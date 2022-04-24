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
        $path = $folder_css . $file . ".css";
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
        $path = $folder_js . $file . ".js";
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
        echo '<html class="scrollShow" xmlns="http://www.w3.org/1999/xhtml" xml:lang="vi-vn" lang="vi-vn">'."\n";
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
        echo '    <meta property="og:url" content="http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].'" />'."\n";
        echo '    <meta property="og:sitename" content="'.$config['title'].'" />'."\n"; 
        echo '    <link type="image/x-icon" href="/favicon.ico" rel=\'icon\' />'."\n";
        echo '    <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=1.0, width=device-width" />'."\n";
        echo '    <meta name="developer" content="Trần Văn Giang, vangiangfly@gmail.com">'."\n";
        echo '    <meta name="author" content="'.$_SERVER['HTTP_HOST'].'"/>'."\n";
        echo '    <link rel="canonical" href="http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].'" />'."\n";
        echo '<meta name="yandex-verification" content="c6bf5fc6caed4160" />';
        echo '<link rel="preconnect" href="https://fonts.googleapis.com">';
        echo '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>';
        echo '<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,300;0,600;1,300;1,600&display=swap" rel="stylesheet">';
        
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
                                <img src="/images/iconCoinNM.png" class="rounded-circle" alt="icon">
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
                                <img src="/images/iconCoinNM.png" class="rounded-circle" alt="icon">
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