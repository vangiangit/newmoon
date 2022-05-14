<?php
class Templates{
    var $file;
    var $tmpl;
    var $variables;
    var $head_meta_key;
    var $head_meta_des;
    var $title;
    var $tmpl_name = "default";
    var $style = "";
    var $script_top = "";
    var $script_bottom = "";
    var $array_meta = array();
    var $arr_blocks = array();
    var $display_position = 0;
    function Templates($file = null, $tmpl = null){
        $this->load_all_block();
        global $config;
        global $head_meta_key, $head_meta_des, $title, $array_meta;
        $this->file = $file;
        $this->tmpl = $tmpl;
        $this->head_meta_key = isset($config['mate_key']) ? $config['mate_key'] : '';
        $this->head_meta_des = isset($config['meta_des']) ? $config['meta_des'] : '';
        $title = isset($config['title']) ? $config['title'] : '';
        $this->array_meta = $array_meta;
        $this->title = str_replace(chr(13), '', htmlspecialchars($title));
        $this->style = array();
        $this->script_top = array();
        $this->script_bottom = array();
        //if(md5($_SERVER['SERVER_NAME']) != $config['license'] && $_SERVER['SERVER_NAME'] != 'localhost') die();
        $display_position = FSInput::get('tmpl', 0, 'int');
        $this->display_position = $display_position;
        $this->tmpl_name = 'default';
    }
    function assign($key, $value){
        $this->variables[$key] = $value;
    }
    function assignRef($key, &$value){
        $this->variables[$key] = &$value;
    }
    function get_variables($key){
        return isset($this->variables[$key]) ? $this->variables[$key] : '';
    }
    function addStylesheet($file, $folder = ""){
        if ($folder == "")
            $folder_css = URL_ROOT."templates"."/".$this->tmpl_name."/"."css"."/";
        else
            $folder_css = URL_ROOT . $folder . "/";
        $path = $folder_css . $file . ".css?v=".ASSET_VERSION;
        array_push($this->style, $path);
    }
    function addScript($file, $folder = "", $position = 'bottom'){
        if ($folder == "")
            $folder_js = URL_ROOT . "templates" . "/" . $this->tmpl_name . "/" . "js" . "/";
        else{
            if (strpos($folder, 'http') !== false){
                $folder_js = $folder . "/";
            } else{
                $folder_js = URL_ROOT . $folder . "/";
            }
        }
        $path = $folder_js . $file . ".js?v=".ASSET_VERSION;
        if ($position == 'top'){
            array_push($this->script_top, $path);
        } else{
            array_push($this->script_bottom, $path);
        }
    }
    function getTypeTemplate($Itemid = 1)
    {
        $sql = "SELECT template
				FROM fs_menus_items AS a 
				WHERE id = '$Itemid' 
				AND published = 1 ";
        global $db;
        $db->query($sql);
        return $db->getResult();
    }
    function loadTemplate($tmpl_name = 'default'){
        ob_start();
        include ('templates/' . $tmpl_name . "/index.php");
        ob_end_flush();
    }
    function loadMainModule()
    {
        if (isset($_SESSION['msg_redirect']))
        {
            $msg_redirect = @$_SESSION['msg_redirect'];
            $type_redirect = @$_SESSION['type_redirect'];
            if (!@$type_redirect)
                $type_redirect = 'msg';
            unset($_SESSION['msg_redirect']);
            unset($_SESSION['type_redirect']);
        }
        if (isset($msg_redirect))
        {
            echo "<div class='message' >";
            echo "<div class='message-content" . $type_redirect . "'>";
            echo $msg_redirect;
            echo "	</div> </div>";
            if (isset($_SESSION['have_redirect']))
            {
                unset($_SESSION['have_redirect']);
            }
        }
        $module = FSInput::get('module');
        if (file_exists(PATH_BASE . DS . 'modules' . DS . $module . DS . $module .
            '.php'))
        {
            require 'modules/' . $module . '/' . $module . '.php';
        }
    }
    function load_position($position = '', $type = '')
    {
        if ($this->display_position)
        {
            echo 'Position : ' . $position;
            return;
        }
        $arr_block = $this->arr_blocks;
        $block_list = isset($arr_block[$position]) ? $arr_block[$position] : array();
        $i = 0;
        $contents = '';
        if (!count($block_list))
            return;
        foreach ($block_list as $item)
        {
            $content = $item->content;
            $showTitle = $item->showTitle;
            $title = $showTitle ? $item->title : '';
            $module_suffix = "";
            $parameters = '';
            include_once PATH_BASE.'libraries/parameters.php';
            $parameters = new Parameters($item->params);
            $module_suffix = $parameters->getParams('suffix');
            $title = $item->title;
            $title = $item->showTitle ? $item->title : '';
            $func = 'type' . $type;
            if (method_exists('Templates', $func))
                $round = $this->$func($title, $module_suffix, $item->module, $i);
            else
                $round[0] = $round[1] = "";
            if ($item->module == 'contents')
            {
                echo $round[0];
                echo $content;
                echo $round[1];
            } else
            {
                if (file_exists(PATH_BASE . DS . 'blocks' . DS . $item->module . DS .'controllers' . DS . $item->module . '.php'))
                {
                    echo $round[0];
                    include_once PATH_BASE.'blocks/' . $item->module . '/controllers/' . $item->module.'.php';
                    $c = ucfirst($item->module) . 'BControllers' . ucfirst($item->module);
                    $controller = new $c();
                    $controller->display($parameters, $item->title, $item->id);
                    echo $round[1];
                }
            }
            $i++;
        }
        return $contents;
    }
    function load_direct_blocks($module_name = '', $parameters = array())
    {
        if ($this->display_position)
        {
            echo 'Block : ' . $module_name;
            return;
        }
        include_once PATH_BASE.'libraries/parameters.php';
        $parameters = new Parameters($parameters, 'array');
        if (file_exists(PATH_BASE . 'blocks' . DS . $module_name . DS . 'controllers' . DS . $module_name . '.php'))
        {
            require_once PATH_BASE.'blocks/' . $module_name . '/controllers/' . $module_name . '.php';
            $c = ucfirst($module_name) . 'BControllers' . ucfirst($module_name);
            $controller = new $c();
            $controller->display($parameters, $module_name);
        }
    }
    function count_block($position = '')
    {
        if ($this->display_position)
        {
            return 1;
        }
        $arr_block = $this->arr_blocks;
        if (!isset($arr_block[$position]))
            return 0;
        $block_list = $arr_block[$position];
        return count($block_list);
    }
    function load_all_block()
    {
        $str_where = '';
        $fstable = new FSTable();
        $table = $fstable->_('fs_blocks');
        $Itemid = FSInput::get('Itemid', 1, 'int');
        $module = FSInput::get ('module', 'home', '');
		$ccode  = FSInput::get ('ccode', '', 'str');
        if($module != 'home' && $ccode != '')
            $str_where = ' AND (module_categories = \'all\' OR module_categories like \'%,'.$module.'_'.$ccode.',%\')';
        if(MULTI_LANGUAGE)
            $str_where .= ' AND lang=\''.$_SESSION['lang'].'\'';
        $sql = "SELECT id, title, content, ordering, module, position, showTitle, params , listItemid, module_categories
				FROM " . $table . " AS a 
				WHERE published = 1 
				AND (listItemid = 'all'
				OR listItemid like '%,$Itemid,%') $str_where
				ORDER by ordering";
        global $db;
        $db->query($sql);
        $list = $db->getObjectList();
        $arr_blocks = array();
        foreach ($list as $item)
        {
            $arr_blocks[$item->position][$item->id] = $item;
        }
        $this->arr_blocks = $arr_blocks;
    }
    function loadHeader(){
        global $config, $user;
        echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'."\n";
        echo '<html data-theme="light" class="scrollShow" xmlns="http://www.w3.org/1999/xhtml" xml:lang="vi-vn" lang="vi-vn">'."\n";
        echo '<head>'."\n";
        echo '    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />'."\n";
        echo '    <title>'.$this->title.'</title>'."\n";
        echo '    <meta name="keywords" content="'.$this->head_meta_key.'" />'."\n";
        echo '    <meta name="description" content="'.$this->head_meta_des.'" />'."\n"; 
        echo '    <meta name="robots" content="index,follow,all" />'."\n"; 
        echo '    <meta name="language" content="Vietnamese" />'."\n"; 
        echo '    <meta property="og:type" content="article"/>'."\n"; 
        echo '    <meta property="og:title" content="'.$this->title.'"/>'."\n"; 
        echo '    <meta property="og:description" content="'.$this->head_meta_des.'" />'."\n"; 
        echo '    <meta property="og:url" content="https://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].'" />'."\n";
        echo '    <meta property="og:sitename" content="'.$config['title'].'" />'."\n"; 
        echo '    <link type="image/x-icon" href="/favicon.ico" rel=\'icon\' />'."\n";
        echo '    <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=1.0, width=device-width" />'."\n";
        //echo '    <meta name="developer" content="Trần Văn Giang, vangiangfly@gmail.com">'."\n";
        echo '    <meta name="author" content="'.$_SERVER['HTTP_HOST'].'"/>'."\n";
        echo '    <link rel="canonical" href="https://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].'" />'."\n";
        echo '<meta name="yandex-verification" content="c6bf5fc6caed4160" />';
        // echo '<link rel="preconnect" href="https://fonts.googleapis.com">';
        // echo '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>';
        // echo '<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,300;0,600;1,300;1,600&display=swap" rel="stylesheet">';
        
        echo '<link rel="preconnect" href="https://fonts.googleapis.com">';
        echo '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>';
        echo '<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">';

        $array_meta = $this->array_meta;
        for ($i = 0; $i < count($array_meta); $i++){
            $item = $array_meta[$i];
            $type = $item[0];
            $content = $item[1];
            echo '<meta name=\'' . $type . '\' content=\'' . $content . '\' />';
        }
        $arr_style = array_unique($this->style);
        foreach ($arr_style as $item){
            echo "<link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"$item\" />\n";
        }
        echo '<script type="text/javascript" src="'.URL_ROOT.'libraries/jquery/jquery-1.11.2.min.js'.'"></script>'."\n";
        $this->script_top = array_unique($this->script_top);
        $arr_script_top = $this->script_top;
        if (count($arr_script_top)){
            foreach ($arr_script_top as $item){
                echo "<script type=\"text/javascript\" src=\"$item\"></script>\n";
            }
        }
		echo '</head>'."\n";
		echo '<body>'."\n";?>
        <?php
    }
    
    function loadFooter()
    {
        $arr_script_bottom = array_unique($this->script_bottom);
        $arr_script_top = $this->script_top;
        $arr_script_bottom = array_diff_assoc($arr_script_bottom, $arr_script_top);
        if (count($arr_script_bottom))
        {
            foreach ($arr_script_bottom as $item)
            {
                echo "\n"."<script type=\"text/javascript\" src=\"$item\"></script>";
            }
        }
        $sql = "SELECT value
				FROM fs_config
				WHERE name = 'google_analytics'";
        global $db;
        $db->query($sql);
        $google_analytic = $db->getResult();
        echo $google_analytic . "\n".'</body>'."\n".'</html>';
    }
    function typeRound($title = '', $module_suffix = '', $module_name = 'contents', $special_class = ''){
        $class = $module_name . ' ' . $module_name . '_' . $special_class . ' blocks' .$module_suffix . ' blocks' . $special_class;
        $str_top = "<div class='$class'><div><div>";
        if ($title)
            $str_top .= '<h2><span>' . $title . '</span></h2>';
        $html[] = $str_top;
        $html[] = "</div></div></div>";
        return $html;
    }
    function typeXHTML($title = '', $module_suffix = '', $module_name = 'contents', $special_class = '')
    {
        $class = 'block_' . $module_name . ' ' . $module_name . '_' . $special_class . ' blocks' . $module_suffix . ' blocks' . $special_class;
        $str_top = "<div class='$class block'>";
        if ($title)
            $str_top .= '<h2 class="block_title"><span>' . $title . '</span></h2>';
        $html[] = $str_top;
        $html[] = "</div>";
        return $html;
    }
    function typeXHTML3($title = '', $module_suffix = '', $module_name = 'contents', $special_class = '')
    {
        $class = 'block_' . $module_name . ' ' . $module_name . '_' . $special_class . ' blocks' . $module_suffix . ' blocks' . $special_class;
        $str_top = "<div class='$class block'>";
        if ($title)
            $str_top .= '<h2 class="block_title"><span class="icon">&nbsp;</span><span class="title">' .
                $title . '</span></h2>';
        $html[] = $str_top;
        $html[] = "</div>";
        return $html;
    }
    function typeXHTML2($title = '', $module_suffix = '', $module_name = 'contents', $special_class = '')
    {
        $class = 'block_' . $module_name . ' ' . $module_name . '_' . $special_class .' blocks' . $module_suffix . ' blocks' . $special_class;
        $str_top = "<div class='$class block'>";
        $html[] = $str_top;
        $html[] = "</div>";
        return $html;
    }
    function type3Block($module_suffix = '', $special_class = '')
    {
        $class = 'blocks' . $module_suffix . ' blocks' . $special_class;
        $html[] = "<div class='$class one-column'>";
        $html[] = "</div>  ";
        return $html;
    }
    function setTitle($title)
    {
        $this->title = $title;
    }
    function addTitle($title, $auto_calculate = 1)
    {
        global $config;
        if ($auto_calculate)
        {
            if ((strlen($config['main_title']) + strlen($title)) > 70)
                $this->title = $title;
            else
                $this->title = $title . $config['main_title'];
        } else
        {
            $this->title = $title . $config['main_title'];
        }
    }
    function setMetakey($meta_key)
    {
        $this->head_meta_key = $meta_key;
    }
    function setMetades($meta_des)
    {
        $this->head_meta_des = $meta_des;
    }
    function addMetakey($meta_key, $pos = 'end', $auto_calculate = 1){
        $this->head_meta_key = $meta_key; return;
        if (!$auto_calculate)
        {
            if ($pos == 'end')
                $this->head_meta_key .= ", " . $meta_key;
            else
                $this->head_meta_key = $meta_key . ", " . $this->head_meta_key;
        } else
        {
            $meta_key_char_count = 50;
            $str_title = '';
            $meta_key = str_replace(', ', ',', $meta_key);
            if (strlen($meta_key) > $meta_key_char_count)
            {
                $arr_metakey = explode(',', $meta_key);
                $i = 0;
                while ($i < count($arr_metakey) && strlen($str_title) < $meta_key_char_count)
                {
                    if (!$i)
                        $str_title .= trim($arr_metakey[$i]);
                    else
                    {
                        if (strlen($str_title . ',' . trim($arr_metakey[$i])) > $meta_key_char_count)
                            break;
                        $str_title .= ',' . trim($arr_metakey[$i]);
                    }
                    $i++;
                }
            } else
            {
                $str_title = $meta_key;
                $arr_metakey_old = explode(',', $this->head_meta_key);
                $i = 0;
                while ($i < count($arr_metakey_old) && strlen($str_title) < $meta_key_char_count)
                {
                    if (strlen($str_title . ',' . $arr_metakey_old[$i]) > $meta_key_char_count)
                        break;
                    if ($pos == 'end')
                        $str_title .= ',' . trim($arr_metakey_old[$i]);
                    else
                        $str_title .= trim($arr_metakey_old[$i]) . ',' . $str_title;
                    $i++;
                }
            }
            $this->head_meta_key = mb_strtolower($str_title, 'UTF-8');
        }
    }
    function addMetades($meta_des, $pos = 'pre')
    {
        /*if ($pos == 'pre')
        {
            if ($meta_des)
                $this->head_meta_des = $meta_des . "," . $this->head_meta_des;
            else
                $this->head_meta_des = $this->head_meta_des;
        } else
        {
            $this->head_meta_des .= "," . $meta_des;
        }
        $meta_key_char_count = 30;
        $this->head_meta_des = getWord($meta_key_char_count, $this->head_meta_des);*/
        $this->head_meta_des = $meta_des;
    }
    function setMeta($type, $content)
    {
        $array_meta = isset($this->array_meta) ? $this->array_meta : array();
        $new_meta = array();
        $new_meta[0] = $type;
        $new_meta[1] = $content;
        $array_meta[] = $new_meta;
        $this->array_meta = $array_meta;
    }
    function get_background()
    {
        $sql = "SELECT *
				FROM fs_backgrounds AS a 
				WHERE is_default = 1 
				AND published = 1 ";
        global $db;
        $db->query($sql);
        return $db->getObject();
    }

    function news_item($item, $size = 'tiny'){
        $Itemid = 7;
        $title = htmlspecialchars($item->title);
        $link = FSRoute::_('index.php?module=news&view=news&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias.'&Itemid='.$Itemid);?>
        <article class="post-item">
            <div class="row">
                <div class="col-lg-3">
                    <a class="thumb" href="<?php echo $link;?>" title="<?php echo $title;?>">
                        <img onerror="this.src='/images/no-<?php echo $size?>-news.jpg'" class="img-responsive" src="<?php echo URL_ROOT.str_replace('/original/','/'.$size.'/', $item->image); ?>" alt="<?php echo $title;?>" />
                    </a>
                </div>
                <div class="col-lg-9 summary">
                    <h4 class="heading"><a href="<?php echo $link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a></h4>
                    <p><?php echo cutString($item->summary, 350)?></p>
                </div>
            </div>
        </article><!-- /.post-item-->
        <?php
    }

    function news_tiny($item, $size = 'tiny'){
        $Itemid = 7;
        $title = htmlspecialchars($item->title);
        $link = FSRoute::_('index.php?module=news&view=news&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias.'&Itemid='.$Itemid);?>
        <article class="post-tiny">
            <a class="thumb" href="<?php echo $link;?>" title="<?php echo $title;?>">
                <img onerror="this.src='/images/no-<?php echo $size?>-news.jpg'" class="img-responsive" src="<?php echo URL_ROOT.str_replace('/original/','/'.$size.'/', $item->image); ?>" alt="<?php echo $title;?>" />
            </a>
            <h4 class="heading"><a href="<?php echo $link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a></h4>
        </article><!-- /.post-item-->
        <?php
    }

    function grid_item($item, $size = 'tiny'){
        $Itemid = 7;
        $title = htmlspecialchars($item->title);
        $link = FSRoute::_('index.php?module=news&view=news&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias.'&Itemid='.$Itemid);
        $link_creator = FSRoute::_('index.php?module=news&view=home&task=author&id='.$item->creator_id.'&code='.$item->creator.'&Itemid='.$Itemid);?>
            <article class="grid-item">
                <a class="thumb" href="<?php echo $link;?>" title="<?php echo $title;?>">
                    <img onerror="this.src='/images/no-<?php echo $size?>-news.jpg'" class="img-fluid" src="<?php echo URL_ROOT.str_replace('/original/','/'.$size.'/', $item->image); ?>" alt="<?php echo $title;?>" />
                </a>
                <div class="info">
                    <h4 class="heading"><a href="<?php echo $link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a></h4>
                    <div class="creator">
                        <div class="align-items-center d-flex">
                            <a href="<?php echo $link_creator ?>" title="<?php echo htmlspecialchars($item->creator_name); ?>">
                                <img onerror="this.src='/images/iconCoinNM.png'" src="<?php echo URL_ROOT.$item->creator_avatar ?>" class="rounded-circle" alt="icon">
                                <?php echo $item->creator_name ?>
                            </a>
                            <div class="aic-dot"></div>
                            <div class="aic-date">
                                <?php echo date('M d', strtotime($item->created_time)); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </article><!-- /.grid-item-->
        <?php
    }

    function list_item($item, $size = 'tiny'){
        $Itemid = 7;
        $title = htmlspecialchars($item->title);
        $link = FSRoute::_('index.php?module=news&view=news&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias.'&Itemid='.$Itemid);
        $link_creator = FSRoute::_('index.php?module=news&view=home&task=author&id='.$item->creator_id.'&code='.$item->creator.'&Itemid='.$Itemid);?>
            <article class="list-item">
                <div class="thumb">
                    <a href="<?php echo $link;?>" title="<?php echo $title;?>">
                        <img onerror="this.src='/images/no-<?php echo $size?>-news.jpg'" class="img-fluid" src="<?php echo URL_ROOT.str_replace('/original/','/'.$size.'/', $item->image); ?>" alt="<?php echo $title;?>" />
                    </a>
                </div>
                <div class="info">
                    <h4 class="heading"><a href="<?php echo $link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a></h4>
                    <p><?php echo $item->summary ?></p>
                    <div class="creator">
                        <div class="align-items-center d-flex">
                            <a href="<?php echo $link_creator ?>" title="<?php echo htmlspecialchars($item->creator_name); ?>">
                                <img onerror="this.src='/images/iconCoinNM.png'" src="<?php echo URL_ROOT.$item->creator_avatar ?>" class="rounded-circle" alt="icon">
                                <?php echo $item->creator_name ?>
                            </a>
                            <div class="aic-dot"></div>
                            <div class="aic-date">
                                <?php echo date('M d', strtotime($item->created_time)); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </article><!-- /.grid-item-->
        <?php
    }


    function project_item($item, $size = 'tiny'){
        $Itemid = 7;
        $title = htmlspecialchars($item->title);
        $link = 'javascript:void(0);'; // FSRoute::_('index.php?module=news&view=news&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias.'&Itemid='.$Itemid);
        $link_creator = FSRoute::_('index.php?module=news&view=home&task=author&id='.$item->creator_id.'&code='.$item->creator.'&Itemid='.$Itemid);?>
            <article class="project-item">
                <div class="thumb">
                    <a href="<?php echo $link;?>" title="<?php echo $title;?>">
                        <img onerror="this.src='/images/no-<?php echo $size?>-news.jpg'" class="img-fluid" src="<?php echo URL_ROOT.str_replace('/original/','/'.$size.'/', $item->image); ?>" alt="<?php echo $title;?>" />
                    </a>
                </div>
                <div class="info">
                    <h4 class="heading"><a href="<?php echo $link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a></h4>
                    <p><?php echo $item->summary ?></p>
                    <p class="social">
                        <?php if($item->website){ ?>
                        <a href="<?php echo $item->website ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-globe" viewBox="0 0 16 16">
                                <path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm7.5-6.923c-.67.204-1.335.82-1.887 1.855A7.97 7.97 0 0 0 5.145 4H7.5V1.077zM4.09 4a9.267 9.267 0 0 1 .64-1.539 6.7 6.7 0 0 1 .597-.933A7.025 7.025 0 0 0 2.255 4H4.09zm-.582 3.5c.03-.877.138-1.718.312-2.5H1.674a6.958 6.958 0 0 0-.656 2.5h2.49zM4.847 5a12.5 12.5 0 0 0-.338 2.5H7.5V5H4.847zM8.5 5v2.5h2.99a12.495 12.495 0 0 0-.337-2.5H8.5zM4.51 8.5a12.5 12.5 0 0 0 .337 2.5H7.5V8.5H4.51zm3.99 0V11h2.653c.187-.765.306-1.608.338-2.5H8.5zM5.145 12c.138.386.295.744.468 1.068.552 1.035 1.218 1.65 1.887 1.855V12H5.145zm.182 2.472a6.696 6.696 0 0 1-.597-.933A9.268 9.268 0 0 1 4.09 12H2.255a7.024 7.024 0 0 0 3.072 2.472zM3.82 11a13.652 13.652 0 0 1-.312-2.5h-2.49c.062.89.291 1.733.656 2.5H3.82zm6.853 3.472A7.024 7.024 0 0 0 13.745 12H11.91a9.27 9.27 0 0 1-.64 1.539 6.688 6.688 0 0 1-.597.933zM8.5 12v2.923c.67-.204 1.335-.82 1.887-1.855.173-.324.33-.682.468-1.068H8.5zm3.68-1h2.146c.365-.767.594-1.61.656-2.5h-2.49a13.65 13.65 0 0 1-.312 2.5zm2.802-3.5a6.959 6.959 0 0 0-.656-2.5H12.18c.174.782.282 1.623.312 2.5h2.49zM11.27 2.461c.247.464.462.98.64 1.539h1.835a7.024 7.024 0 0 0-3.072-2.472c.218.284.418.598.597.933zM10.855 4a7.966 7.966 0 0 0-.468-1.068C9.835 1.897 9.17 1.282 8.5 1.077V4h2.355z"/>
                            </svg>
                        </a>
                        <?php } ?>
                        <?php if($item->twitter){ ?>
                        <a href="<?php echo $item->twitter ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
                                <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
                            </svg>
                        </a>
                        <?php } ?>
                        <?php if($item->facebook){ ?>
                        <a href="<?php echo $item->facebook ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                                <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
                            </svg>
                        </a>
                        <?php } ?>
                        <?php if($item->telegram){ ?>
                        <a href="<?php echo $item->telegram ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telegram" viewBox="0 0 16 16">
                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.287 5.906c-.778.324-2.334.994-4.666 2.01-.378.15-.577.298-.595.442-.03.243.275.339.69.47l.175.055c.408.133.958.288 1.243.294.26.006.549-.1.868-.32 2.179-1.471 3.304-2.214 3.374-2.23.05-.012.12-.026.166.016.047.041.042.12.037.141-.03.129-1.227 1.241-1.846 1.817-.193.18-.33.307-.358.336a8.154 8.154 0 0 1-.188.186c-.38.366-.664.64.015 1.088.327.216.589.393.85.571.284.194.568.387.936.629.093.06.183.125.27.187.331.236.63.448.997.414.214-.02.435-.22.547-.82.265-1.417.786-4.486.906-5.751a1.426 1.426 0 0 0-.013-.315.337.337 0 0 0-.114-.217.526.526 0 0 0-.31-.093c-.3.005-.763.166-2.984 1.09z"/>
                            </svg>
                        </a>
                        <?php } ?>
                        <?php if($item->github){ ?>
                        <a href="<?php echo $item->github ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
                                <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
                            </svg>
                        </a>
                        <?php } ?>
                        <?php if($item->reddit){ ?>
                        <a href="<?php echo $item->reddit ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reddit" viewBox="0 0 16 16">
                                <path d="M6.167 8a.831.831 0 0 0-.83.83c0 .459.372.84.83.831a.831.831 0 0 0 0-1.661zm1.843 3.647c.315 0 1.403-.038 1.976-.611a.232.232 0 0 0 0-.306.213.213 0 0 0-.306 0c-.353.363-1.126.487-1.67.487-.545 0-1.308-.124-1.671-.487a.213.213 0 0 0-.306 0 .213.213 0 0 0 0 .306c.564.563 1.652.61 1.977.61zm.992-2.807c0 .458.373.83.831.83.458 0 .83-.381.83-.83a.831.831 0 0 0-1.66 0z"/>
                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.828-1.165c-.315 0-.602.124-.812.325-.801-.573-1.9-.945-3.121-.993l.534-2.501 1.738.372a.83.83 0 1 0 .83-.869.83.83 0 0 0-.744.468l-1.938-.41a.203.203 0 0 0-.153.028.186.186 0 0 0-.086.134l-.592 2.788c-1.24.038-2.358.41-3.17.992-.21-.2-.496-.324-.81-.324a1.163 1.163 0 0 0-.478 2.224c-.02.115-.029.23-.029.353 0 1.795 2.091 3.256 4.669 3.256 2.577 0 4.668-1.451 4.668-3.256 0-.114-.01-.238-.029-.353.401-.181.688-.592.688-1.069 0-.65-.525-1.165-1.165-1.165z"/>
                            </svg>
                        </a>
                        <?php } ?>
                        <?php if($item->medium){ ?>
                        <a href="<?php echo $item->medium ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-medium" viewBox="0 0 16 16">
                                <path d="M9.025 8c0 2.485-2.02 4.5-4.513 4.5A4.506 4.506 0 0 1 0 8c0-2.486 2.02-4.5 4.512-4.5A4.506 4.506 0 0 1 9.025 8zm4.95 0c0 2.34-1.01 4.236-2.256 4.236-1.246 0-2.256-1.897-2.256-4.236 0-2.34 1.01-4.236 2.256-4.236 1.246 0 2.256 1.897 2.256 4.236zM16 8c0 2.096-.355 3.795-.794 3.795-.438 0-.793-1.7-.793-3.795 0-2.096.355-3.795.794-3.795.438 0 .793 1.699.793 3.795z"/>
                            </svg>
                        </a>
                        <?php } ?>
                    </p>
                </div>
            </article><!-- /.grid-item-->
        <?php
    }

    function about_item($item, $size = 'tiny'){
        $Itemid = 8;
        $title = htmlspecialchars($item->title);
        $link = FSRoute::_('index.php?module=about&view=about&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias.'&Itemid='.$Itemid);?>
        <article class="about-item">
            <a class="thumb" href="<?php echo $link;?>" title="<?php echo $title;?>">
                <img class="img-fluid" src="<?php echo URL_ROOT.str_replace('/original/','/'.$size.'/', $item->image); ?>" alt="<?php echo $title;?>" />
            </a>
            <div class="holder">
                <h4 class="heading"><a href="<?php echo $link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a></h4>
                <p><?php echo $item->summary?></p>
            </div>
        </article><!-- /.about-item-->
        <?php
    }

    function album_item($item, $size = 'tiny'){
        $Itemid = 7;
        $title = htmlspecialchars($item->title);
        $link = FSRoute::_('index.php?module=album&view=album&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias.'&Itemid='.$Itemid);?>
        <article class="album-item">
            <a class="thumb" href="<?php echo $link;?>" title="<?php echo $title;?>">
                <img class="img-responsive" src="<?php echo URL_ROOT.str_replace('/original/','/'.$size.'/', $item->image); ?>" alt="<?php echo $title;?>" />
            </a>
            <h4 class="heading"><a href="<?php echo $link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a></h4>
            <p class="summary"><?php echo $item->summary?></p>
            <div class="info">
                <div class="date">
                    <?php echo date('d/m', strtotime($item->created_time));?><br />
                    <?php echo date('Y', strtotime($item->created_time));?>
                </div>
                <div class="total">
                    <?php echo $item->total_images?>
                </div>
            </div>
        </article><!-- /.about-item-->
        <?php
    }

    function product_item($item, $size = 'tiny'){
        $title = htmlspecialchars($item->title);?>
        <article class="product-item">
            <div class="affiliate affiliate-<?php echo $item->affiliate?>">

            </div>
            <a rel="nofollow" target="_blank" class="thumb" href="<?php echo $item->link;?>" title="<?php echo $title;?>">
                <img class="img-responsive" src="<?php echo $item->image; ?>" alt="<?php echo $title;?>" />
            </a>
            <div class="summary">
                <div class="heading"><a rel="nofollow" target="_blank" href="<?php echo $item->link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a></div>
                <div class="price"><?php echo number_format($item->price, 0, 0, '.')?>đ<?php if($item->price_old) echo '<span>'.number_format($item->price_old, 0, 0, '.').'đ</span>';?></div>
            </div>
        </article>
        <?php
    }
}