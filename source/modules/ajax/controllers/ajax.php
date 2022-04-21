<?php
class AjaxControllersAjax extends FSControllers{
    function __construct(){
        parent::__construct();
    }
    
    function create_image(){
        ob_start();
        //Let's generate a totally random string using md5 
        $md5_hash = md5(rand(0,999)); 
        //We don't need a 32 character long string so we trim it down to 5 
        $security_code = substr($md5_hash, 15, 5); 
        //Set the session to store the security code
        $_SESSION["security_code"] = $security_code;
        //Set the image width and height 
        $width = 60; 
        $height = 21;  
        //Create the image resource 
        $image = ImageCreate($width, $height);  
        //We are making three colors, white, black and gray 
        $white = ImageColorAllocate($image, 255, 255, 255); 
        $black = ImageColorAllocate($image, 0, 0, 0); 
        $grey = ImageColorAllocate($image, 204, 204, 204); 
        //Make the background black 
        ImageFill($image, 0, 0, $white); 
        //Add randomly generated string in white to the image
        ImageString($image, 3, 15, 3, $security_code, $black); 
        //Throw in some lines to make it a little bit harder for any bots to break 
        ImageRectangle($image,0,0,$width-1,$height-1,$grey); 
    //    imageline($image, 0, $height/2, $width, $height/2, $grey); 
    //    imageline($image, $width/2, 0, $width/2, $height, $grey); 
        //Tell the browser what kind of file is come in 
        header("Content-Type: image/jpeg"); 
        //Output the newly created image in jpeg format 
        ImageJpeg($image); 
        //Free up resources
        ImageDestroy($image); 
        ob_end_flush();
        exit(); 
    }
    
    function check_capcha(){
        $result = 0;
        $capcha = FSInput::get('capcha');
        if ($capcha == $_SESSION["security_code"]){
            $result = 1;
        }//echo $_SESSION["security_code"];
        echo $result; exit;
    }    
    
    function php_info(){
        phpinfo();
    }

    function shortlink(){
        $id = FSInput::get('id',0,'int');
        $data = $this->model->get_record_by_id($id, 'fs_shortlink');
        $link = URL_ROOT;
        if($data & $data->link!='')
            $link = $data->link;
        setRedirect($link);
    }

    function get_stories(){
        global $db;
        $file = FSFactory::getClass('FsFiles');
        $arr_img_paths = array(
            array('tiny', 300, 300, 'resize_image_fix')
        );
        $path_original = 'images/stories/'.date('Y/m') . '/original/';
        $path = PATH_BASE.$path_original;

        $id = FSInput::get('id', 1);
        $cat = $this->model->get_record('id='.intval($id), 'fs_stories_categories');
        if(!$cat)
            return false;
        $link = $cat->link.$cat->page;
        $content = $this->curlGetPageContent($link);
        preg_match_all('#class="box wbox"(.*?)class="clear"#is', $content, $post);
        $allLink = array();
        if(isset($post[1])){
            foreach ($post[1] as $plink) {
                preg_match('#href="(.*?)"#is', $plink, $link);
                if(isset($link[1]))
                    $allLink[] = $link[1];
            }
        }
        $allLink = array_unique($allLink);

        $allPost = array();
        foreach ($allLink as $link){
            // $allPost[] = $this->get_story_detail($link);

            $row = $this->get_story_detail($link);
            $fileinfo = pathinfo($row['image']);
            $filename = $this->createAlias($row['title']).'.'.$fileinfo['extension'];
            $file->create_folder($path_original);
            $image = '';
            if($this->curlSaveToFile($row['image'], $path.$filename)){
                $image = $path_original.$filename;
                foreach ($arr_img_paths as $item ){
                    $path_resize = str_replace ( '/original/', '/' . $item [0] . '/', $path );
                    $file->create_folder ( $path_resize );
                    $method_resize = $item [3] ? $item [3] : 'resize_image';
                    if (! $file->$method_resize ( $path . $filename, $path_resize . $filename, $item [1], $item [2] ))
                        continue;
                }
            }
            $row['content'] = $db->escape_string($this->getAllImagesContent($row['content']));
            $row['alias'] = $this->createAlias($row['title']);
            $row['image'] = $image;
            $row['created_time'] = date('Y-m-d H:i:s');

            $row['category_id'] = $cat->id;
            $row['category_alias'] = $cat->alias;
            $row['category_name'] = $cat->name;
            $row['category_id_wrapper'] = $cat->list_parents;
            $row['category_alias_wrapper'] = $cat->alias_wrapper;

            $this->model->_add($row, 'fs_stories');
        }
    }

    function get_story_detail($link){
        $data = array();
        $detail = $this->curlGetPageContent($link);
        /* Lấy tiêu đề tin */
        preg_match('#<div class="viewcontent-page" >(.*?)</h1>#is', $detail, $tmp);
        if(!isset($tmp[1]))
            return;
        $data['title'] = trim(strip_tags($tmp[1]));
        /* Lấy content */
        preg_match('#<div class="maincontent" >(.*?)</div>[\s]*[\n]*<div class="wrap-details">#is', $detail, $tmp);
        if(!isset($tmp[1]))
            return;
        $content = $tmp[1];
        /* Xóa script */
        $content  = preg_replace('#<script type=[\"\']text\/javascript[\"\']>(.*?)</script>#is','',$content);
        $content  = preg_replace('#<script>(.*?)</script>#is','',$content);
        /* Xóa tin dư thừa*/
        $content  = preg_replace('#width\=\"([0-9]+)\"#e','',$content);
        $content  = preg_replace('#height\=\"([0-9]+)\"#e','',$content);
        //$content  = preg_replace('#style\=\"(.*?)\"#e','',$content);
        $content  = preg_replace('#onclick\=\"(.*?)\"#e','',$content);
        $content  = preg_replace('#onclick\=\'(.*?)\'#e','',$content);
        /* Xóa thẻ hidden*/
        $content  = preg_replace('#<input type=\'hidden\'.*\/\>#e','',$content);
        /* Xóa thẻ a */
        $content  = preg_replace('#<a(.*?)\>#e','',$content);
        $content  = preg_replace('#<\/a>#e','',$content);
        /* Xóa div ads */
        $content  = preg_replace('#<!--(.*?)-->#is','',$content);
        $content  = preg_replace('#<div(.*?)</div>#is','',$content);

        $content  = preg_replace('#style\=\"(.*?)\"#e','',$content);
        $content  = preg_replace('#style\=\'(.*?)\'#e','',$content);
        $data['content'] = $content;

        preg_match_all('#<strong>(.*?)</strong>#is', $content, $summary);
        if(isset($summary[1])){
            $data['summary'] = htmlspecialchars($summary[1][0]);
        }

        $arrImages = $this->getImagesSrc($content);
        $data['image'] = '';
        $data['source'] = $link;
        if(isset($arrImages[0]))
            $data['image'] = 'https://www.truyenngan.com.vn/'.$arrImages[0];
        return $data;
    }

    function curlSaveToFile($url, $local){
        try {
            $ch = curl_init();
            $fh = fopen($local, 'w');
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_FILE, $fh);
            curl_setopt($ch, CURLOPT_HEADER, false);
            curl_setopt($ch, CURLOPT_VERBOSE, false);
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
            curl_setopt($ch, CURLOPT_NOPROGRESS, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($ch, CURLOPT_USERAGENT, '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.11) Gecko/20071204 Ubuntu/7.10 (gutsy) Firefox/2.0.0.11');
            curl_exec($ch);
            if (curl_errno($ch)) {
                return false;
            }
            curl_close($ch);
            fclose($fh);
            if (filesize($local) > 10) {
                return true;
            } else {
                @unlink($local);
            }
        }catch (Exception $e) {
            trigger_error(sprintf('Curl failed with error #%d: %s', $e->getCode(), $e->getMessage()), E_USER_ERROR);
        }
        return false;
    }

    function curlGetPageContent($url, $timeout = 60){
        $html = false;

        try {
            $curl = curl_init(); // Khởi tạo
            curl_setopt($curl, CURLOPT_REFERER, "http://google.com/"); //Giả REFERER
            curl_setopt($curl, CURLOPT_URL, $url); // Chỉ định địa chỉ lấy dữ liệu
            curl_setopt($curl, CURLOPT_TIMEOUT, $timeout); // Thiết lập timeout
            curl_setopt($curl, CURLOPT_USERAGENT, '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.11) Gecko/20071204 Ubuntu/7.10 (gutsy) Firefox/2.0.0.11');// Giả tên trình duyệt
            curl_setopt($curl, CURLOPT_HEADER, false); // Có kèm header của HTTP Reponse trong nội dung phản hồi ko
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); // Tham số bổ sung
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);// Tham số bổ sung, ko xác nhận chứng chì ssl
            $html = curl_exec($curl); // Bắt đầu lấy dữ liệu đưa vào biến $html
            if (curl_errno($curl)) {
                return false;
            }
            curl_close($curl); //Đóng kết nối
        } catch (Exception $e) {
            trigger_error(sprintf('Curl failed with error #%d: %s', $e->getCode(), $e->getMessage()), E_USER_ERROR);
        }
        return $html;
    }

    /**
     * Lấy tât cả ảnh trong nội dung
     *
     * @param String $html
     *
     * @return Array
     */
    function getImagesSrc($html = 0){
        $return = array();
        preg_match_all('#src="(.*?)"#is', $html, $images);
        if(isset($images[1]))
            foreach($images[1] as $img)
                if(preg_match('/\.(jpe?g|png|gif)$/i', $img))
                    $return[] = $img;
        return $return;
    }


    function getAllImagesContent($html = '', $baseUrl = 'https://www.truyenngan.com.vn/'){
        $file = FSFactory::getClass('FsFiles');
        $arrSearch = $this->getImagesSrc($html);
        $arrReplace = array();
        foreach($arrSearch as $image_url){
            $path_original = PATH_BASE.'uploaded/images/stories/'.date('Y/m/');
            $file->create_folder ($path_original);
            preg_match("#http#is", $image_url, $matches);
            if(empty($matches)) {
                $image_url = $baseUrl.$image_url;
            }
            $fileinfo = pathinfo($image_url);
            $local = $path_original.$this->createAlias($fileinfo['filename']).'.'.$fileinfo['extension'];
            $i = 1;
            while (file_exists($local)){
                $local = $path_original.$this->createAlias($fileinfo['filename']).'-'.$i.'.'.$fileinfo['extension']; $i ++;
            }
            if($this->curlSaveToFile($image_url, $local))
                $arrReplace[] = str_replace(PATH_BASE, '/', $local);
            else
                $arrReplace[] = $image_url;
        }
        return str_replace($arrSearch, $arrReplace, $html);
    }

    /**
     * Bỏ dấu
     *
     * @param String
     *
     * @return String
     */
    function removeSign($str) {
        $coDau=array("à","á","ạ","ả","ã","â","ầ","ấ","ậ","ẩ","ẫ","ă",
            "ằ","ắ","ặ","ẳ","ẵ",
            "è","é","ẹ","ẻ","ẽ","ê","ề" ,"ế","ệ","ể","ễ",
            "ì","í","ị","ỉ","ĩ",
            "ò","ó","ọ","ỏ","õ","ô","ồ","ố","ộ","ổ","ỗ","ơ"
        ,"ờ","ớ","ợ","ở","ỡ",
            "ù","ú","ụ","ủ","ũ","ư","ừ","ứ","ự","ử","ữ",
            "ỳ","ý","ỵ","ỷ","ỹ",
            "đ",
            "À","Á","Ạ","Ả","Ã","Â","Ầ","Ấ","Ậ","Ẩ","Ẫ","Ă"
        ,"Ằ","Ắ","Ặ","Ẳ","Ẵ",
            "È","É","Ẹ","Ẻ","Ẽ","Ê","Ề","Ế","Ệ","Ể","Ễ",
            "Ì","Í","Ị","Ỉ","Ĩ",
            "Ò","Ó","Ọ","Ỏ","Õ","Ô","Ồ","Ố","Ộ","Ổ","Ỗ","Ơ"
        ,"Ờ","Ớ","Ợ","Ở","Ỡ",
            "Ù","Ú","Ụ","Ủ","Ũ","Ư","Ừ","Ứ","Ự","Ử","Ữ",
            "Ỳ","Ý","Ỵ","Ỷ","Ỹ",
            "Đ","ê","ù","à");
        $khongDau=array("a","a","a","a","a","a","a","a","a","a","a"
        ,"a","a","a","a","a","a",
            "e","e","e","e","e","e","e","e","e","e","e",
            "i","i","i","i","i",
            "o","o","o","o","o","o","o","o","o","o","o","o"
        ,"o","o","o","o","o",
            "u","u","u","u","u","u","u","u","u","u","u",
            "y","y","y","y","y",
            "d",
            "A","A","A","A","A","A","A","A","A","A","A","A"
        ,"A","A","A","A","A",
            "E","E","E","E","E","E","E","E","E","E","E",
            "I","I","I","I","I",
            "O","O","O","O","O","O","O","O","O","O","O","O"
        ,"O","O","O","O","O",
            "U","U","U","U","U","U","U","U","U","U","U",
            "Y","Y","Y","Y","Y",
            "D","e","u","a");
        return str_replace($coDau, $khongDau, $str);
    }

    /**
     * Tạo url alias
     */
    function createAlias($string){
        $string = $this->removeSign($string);
        $string = trim(preg_replace("/[^A-Za-z0-9]/i", " ", $string));
        $string = str_replace(" ","-",$string);
        $string	= str_replace("-----","-",$string);
        $string	= str_replace("----","-",$string);
        $string	= str_replace("---","-",$string);
        $string	= str_replace("--","-",$string);
        $string = strtolower($string);
        return $string;
    }

    function get_stories_home(){
        $json = array(
            'error' => true,
            'list' => array()
        );
        $list = $this->model->get_stories_home();
        if($list) {
            $json['error'] = false;
            foreach ($list as $item) {
                $summary = strip_tags($item->summary);
                $summary = cutString($summary, 86);

                $json['list'][] = array(
                    'id' => $item->id,
                    'title' => $item->title,
                    'summary' => $summary,
                    'category_name' => $item->category_name,
                    'image' => URL_ROOT . str_replace('/original/', '/tiny/', $item->image),
                );
            }
        }
        echo json_encode($json);
    }

    function get_categories(){
        $json = array(
            'error' => true,
            'list' => array()
        );
        $list = $this->model->get_categories();
        if($list) {
            $json['error'] = false;
            foreach ($list as $item) {
                $json['list'][] = array(
                    'id' => $item->id,
                    'name' => $item->name,
                );
            }
        }
        echo json_encode($json);
    }

    function get_detail(){
        $json = array(
            'error' => true,
            'detail' => array(
                'id' => '',
                'title' => '',
                'content' => '',
                'category_name' => ''
            )
        );
        $id = FSInput::get('id', 0);
        $detail = $this->model->get_record('id='.$id, 'fs_stories');
        if($detail){
            $json['error'] = false;
            $content = trim(preg_replace('/\s+/', ' ', $detail->content));
            $content = str_replace('<p>&nbsp;</p>','', $content);
            $content .= '<p>&nbsp;</p>';
            $content = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
            <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="vi-vn" lang="vi-vn">
            <head></head><body><div class="container">'. str_replace("/uploaded/",URL_ROOT."uploaded/", $content).'</div></body></html>';
            $json['detail'] = array(
                'id' => $detail->id,
                'title' => $detail->title,
                'content' => $content,
                'category_name' => $detail->category_name
            );
        }

        $list = $this->model->get_stories_rand($detail->category_id);
        if($list) {
            foreach ($list as $item) {
                $summary = strip_tags($item->summary);
                $summary = cutString($summary, 86);

                $json['list'][] = array(
                    'id' => $item->id,
                    'title' => $item->title,
                    'summary' => $summary,
                    'category_name' => $item->category_name,
                    'image' => URL_ROOT . str_replace('/original/', '/tiny/', $item->image),
                );
            }
        }

        echo json_encode($json);
    }
}