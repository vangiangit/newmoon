<?php
class AjaxControllersAjax extends Controllers{
    function __construct(){
        parent::__construct();
    }

    function upload_image(){
        global $user;
        $data = array(
            'error' => true,
            'src' => '',
            'image' => ''
        );

        $string = FSFactory::getClass('FSString');

        $file = FSFactory::getClass('FsFiles');

        if($_FILES["file"]["error"] == UPLOAD_ERR_OK){
            /**
             * $pConfig
             * 0: Trạng thái add, edit
             * 1: tmp hoặc id (khi là edit)
             * 2: Module
             * 3: Các kích thước cắt
             */
            $pConfig = explode('|', fsDecode( FSInput::get('config', 'LJExsTSxMN')));
            $path = PATH_BASE.'images/'.$pConfig[2].'/' . date('Y/m').'/original/';
            $filename = pathinfo($_FILES["file"]["name"]);
            $filename = $string->stringStandart($filename['filename']);
            $image = $file->uploadImage('file', $path, 2000000, $filename.'-'.time());
            if (!$image)
                return false;
            $img_link = 'images/'.$pConfig[2].'/' . date('Y/m').'/original/'.$image;
            $tmp_paths = explode(';', $pConfig[3]);

            $image_paths = array();
            foreach($tmp_paths as $key)
                $image_paths[] = explode(',', $key);

            foreach ($image_paths as $item){
                $path_resize = str_replace('/original/', '/'.$item[0].'/', $path);
                $file->create_folder($path_resize);
                $method_resize = $item[3] ? $item[3] : 'resized_not_crop';
                if (!$file->$method_resize($path.$image, $path_resize.$image, $item[1], $item[2]))
                    return false;
            }

            $type = FSInput::get('type', 'image');

            if($pConfig[0] == 'add')
                $id = $this->model->_add(array(
                    'tmp' => session_id(),
                    'image' => $img_link,
                    'created_time' => date('Y-m-d H:i:s')
                ), 'fs_'.$pConfig[2].'_images');
            else
                $id = $this->model->_add(array(
                    'record_id' => intval($pConfig[1]),
                    'tmp' => '',
                    'image' => $img_link,
                    'created_time' => date('Y-m-d H:i:s')
                ), 'fs_'.$pConfig[2].'_images');
            echo $id; return;
        }
        echo 0;
    }

    function delete_upload_image(){
        $pConfig = explode('|', fsDecode( FSInput::get('config', 'LJExsTSxMN')));
        $id = FSInput::get('id', 0);
        $row = $this->model->get_record("id = ".$id, 'fs_'.$pConfig[2].'_images', 'image');
        if($row){
            $tmp_paths = explode(';', $pConfig[3]);
            $image_paths = array();
            foreach($tmp_paths as $key)
                $image_paths[] = explode(',', $key);
            foreach ($image_paths as $item){
                $path_resize = str_replace('/original/', '/'.$item[0].'/', $row->image);
                @unlink(PATH_BASE.$path_resize);
            }
            $this->model->_remove("id = ".$id, 'fs_'.$pConfig[2].'_images');
        }
    }

    function load_upload_image(){
        $json = array(
            'error' => true,
            'html' => ''
        );
        $pConfig = explode('|', fsDecode( FSInput::get('config', 'LJExsTSxMN')));
        if($pConfig[0] == 'add')
            $where = 'tmp = \''.session_id().'\'';
        else
            $where = 'record_id = '.intval($pConfig[1]);
        $rows = $this->model->get_records($where, 'fs_'.$pConfig[2].'_images');
        foreach($rows as $item){
            $json['error'] = false;
            $json['html'] .= '
                <div class="dz-preview dz-processing dz-image-preview dz-success dz-complete" id="sort_'.$item->id.'">
                    <div class="dz-details dz-image-ajax">
                        <img data-dz-thumbnail="" src="'.URL_ROOT.str_replace('/original/','/tiny/', $item->image).'" />
                    </div>
                    <a class="dz-remove" onclick="dz_remove('.$item->id.', \''.FSInput::get('config', 'LJExsTSxMN').'\');" title="Xóa ảnh này"></a>
                    <input onkeyup="update_image_title(this);" data-id="'.$item->id.'" data-table="fs_'.$pConfig[2].'_images" type="text" value="'.$item->title.'">
                </div>';
        }
        ob_end_clean();
        echo json_encode($json);
    }

    function update_image_title(){
        $json = array(
            'error' => true,
            'html' => ''
        );
        $id = FSInput::get('id', 0);
        $table = FSInput::get('table', '');
        $title = FSInput::get('title', '');
        $this->model->_update(array(
            'title' => $title
        ), $table, 'id='.intval($id));
        ob_end_clean();
        echo json_encode($json);
    }
}