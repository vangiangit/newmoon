<?php
/**
 * FSRoute
 * 
 * @package fs_thoitranghanquoc24h.com
 * @author vangiangfly
 * @copyright 2013
 * @version $Id$
 * @access public
 */
class FSRoute
{
    var $url;
    function __construct($url)
    {
    }
    public static function _($url)
    {
        return FSRoute::enURL($url);
    }
    public static function addParameters($params, $value, $arr_request_need = array())
    {
        // only filter
        $module = FSInput::get('module');
        $view = FSInput::get('view');
        if ($view == 'cat')
        {
            $arr_request_need[] = 'ccode';
            $arr_request_need[] = 'id';
            $arr_request_need[] = 'Itemid';
            $url = 'index.php?module=' . $module . '&view=' . $view;
            foreach ($arr_request_need as $item)
            {
                $item_request = FSInput::get($item);
                if ($item_request)
                {
                    $url .= '&' . $item . '=' . $item_request;
                }
            }
            if ($value && $params)
            {
                $url .= '&' . $params . '=' . $value;
            }
            return FSRoute::_($url);
        } else
        {
            $ccode = FSInput::get('ccode');
            $url = 'index.php?module=' . $module . '&view=' . $view;
            $url .= '&ccode=' . $ccode;
            $url .= '&filter=' . $value;
            $url .= '&Itemid=' . $Itemid;
            return FSRoute::_($url);
        }
        return FSRoute::_($_SERVER['REQUEST_URI']);
    }
    public static function addParameters1($params, $value)
    {
        // only filter
        $module = FSInput::get('module');
        $view = FSInput::get('view');
        if ($module == 'products' && $view == 'categories')
        {
            $ccode = FSInput::get('ccode');
            $filter = FSInput::get('filter');
            $manu = FSInput::get('manu');
            $pmodel = FSInput::get('pmodel');
            //			$Itemid = FSInput::get('Itemid');
            $Itemid = 7;
            $url = 'index.php?module=' . $module . '&view=' . $view;
            if ($ccode)
            {
                $url .= '&ccode=' . $ccode;
            }
            // manufactory
            if ($params == 'manu')
            {
                $url .= '&manu=' . $value;
            } else
            {
                $url .= '&manu=' . $manu;
            }
            // product_model
            if ($params == 'pmodel')
            {
                $url .= '&pmodel=' . $value;
            } else
            {
                $url .= '&pmodel=' . $pmodel;
            }
            if ($params == 'filter')
            {
                $url .= '&filter=' . $value;
            } else
            {
                $url .= '&filter=' . $filter;
            }
            $url .= '&Itemid=' . $Itemid;
            return FSRoute::_($url);
        }
        if ($module == 'products' && $view = 'product')
        {
            $ccode = FSInput::get('ccode');
            $code = FSInput::get('code');
            //			$Itemid = FSInput::get('Itemid');
            $Itemid = 7;
            $url = 'index.php?module=' . $module . '&view=' . $view;
            if ($ccode)
            {
                $url .= '&ccode=' . $ccode;
            }
            if ($code)
            {
                $url .= '&code=' . $code;
            }
            // manufactory
            if ($params == 'layout')
            {
                $url .= '&layout=' . $value;
            }
            $url .= '&Itemid=' . $Itemid;
            return FSRoute::_($url);
        }
        return FSRoute::_($_SERVER['REQUEST_URI']);
    }
    /*
    * For product filter
    */
    public static function removeParameters($params)
    {
        // only filter
        $module = FSInput::get('module');
        $view = FSInput::get('view');
        $ccode = FSInput::get('ccode');
        $filter = FSInput::get('filter');
        $manu = FSInput::get('manu');
        $pmodel = FSInput::get('pmodel');
        $Itemid = FSInput::get('Itemid');
        $url = 'index.php?module=' . $module . '&view=' . $view;
        if ($ccode)
        {
            $url .= '&ccode=' . $ccode;
        }
        if ($manu)
        {
            $url .= '&manu=' . $manu;
        }
        if ($pmodel && ($params != 'manu'))
        {
            $url .= '&pmodel=' . $pmodel;
        }
        if ($filter)
        {
            $url .= '&filter=' . $filter;
        }
        $url .= '&Itemid=' . $Itemid;
        $url = trim(preg_replace('/&' . $params . '=[0-9a-zA-Z_-]+/i', '', $url));
        return FSRoute::_($url);
    }
    /*
    * rewrite
    */
    public static function enURL($url)
    {	
        if (!$url)
            $url = $_SERVER['REQUEST_URI'];
        if (!IS_REWRITE)
            return URL_LANG . $url;
        if (strpos($url, 'http://') !== false || strpos($url, 'https://') !== false)
            return $url;
        $link_estore = 0;
        $pos1 = strpos($url, 'index.php?');
        $pos2 = strpos($url, 'estores.php?');
        if ($pos1 !== false)
        {
            $url_reduced = substr($url, ($pos1 + 10));
        } else
            if ($pos2 !== false)
            {
                $url_reduced = substr($url, ($pos2 + 12));
                $link_estore = 1;
            } else
            {
                return URL_LANG . $url;
            }
            $array_buffer = explode('&', $url_reduced);
        $array_params = array();
        for ($i = 0; $i < count($array_buffer); $i++)
        {
            $item = $array_buffer[$i];
            $pos_sepa = strpos($item, '=');
            $array_params[substr($item, 0, $pos_sepa)] = substr($item, $pos_sepa + 1);
        }
        $module = isset($array_params['module']) ? $array_params['module'] : '';
        $view = isset($array_params['view']) ? $array_params['view'] : $module;
        $task = isset($array_params['task']) ? $array_params['task'] : 'display';
        $Itemid = isset($array_params['Itemid']) ? $array_params['Itemid'] : 0;
        $url_uri = '';
        foreach($array_params as $key=>$value){
			if($key == 'module' || $key == 'view' || $key == 'Itemid' || $key == 'ccode' || $key == 'id' || $key == 'filter')
				continue;
			$url_uri .= '&'.$key.'='.$value;
		}
        if (!$link_estore)
        {
            switch ($module)
            {
                case 'news':
                    switch ($view)
                    {
                        case 'home':
                            return URL_LANG.'tin-tuc';
                        case 'news':
                            if($task== 'display'){
								$id  = isset($array_params['id'])?$array_params['id']: 0;
                                $code  = isset($array_params['code'])?$array_params['code']: 'tin-tuc';
								return URL_LANG.$code.'-ch'.$id.'.html';
							}else{
								return URL_ROOT.$url;
							}
                        case 'cat':
                            $id  = isset($array_params['id'])?$array_params['id']: 0;
							$ccode  = isset($array_params['ccode'])?$array_params['ccode']: 'danh-muc-tin-tuc';
							return URL_LANG.$ccode.'.html';
                        default:
                            return URL_ROOT . $url;
                    }
                    break;

                case 'album':
                    switch ($view)
                    {
                        case 'home':
                            return URL_LANG.'album';
                        case 'album':
                            if($task== 'display'){
                                $id  = isset($array_params['id'])?$array_params['id']: 0;
                                $code  = isset($array_params['code'])?$array_params['code']: 'album';
                                return URL_LANG.$code.'-ald'.$id;
                            }else{
                                return URL_ROOT.$url;
                            }
                        case 'cat':
                            $id  = isset($array_params['id'])?$array_params['id']: 0;
                            $ccode  = isset($array_params['ccode'])?$array_params['ccode']: 'danh-muc-album';
                            return URL_LANG.$ccode.'-al'.$id;
                        default:
                            return URL_ROOT . $url;
                    }
                    break;
                case 'statics':
                    switch ($view)
                    {
                        case 'home':
                            return URL_LANG.'trang-tinh';
                        case 'statics':
                            if($task== 'display'){
								$id  = isset($array_params['id'])?$array_params['id']: 0;
								//$ccode  = isset($array_params['ccode'])?$array_params['ccode']: 'chi-tiet-trang-tinh';
                                $code  = isset($array_params['code'])?$array_params['code']: 'trang-tinh';
								return URL_LANG.$code.'-st'.$id.'';
							}else{
								return URL_ROOT.$url;
							}
                        case 'cat':
                            $id  = isset($array_params['id'])?$array_params['id']: 0;
							$ccode  = isset($array_params['ccode'])?$array_params['ccode']: 'danh-muc-trang-tinh';
							return URL_LANG.$ccode.'-s'.$id.'';
                        default:
                            return URL_ROOT . $url;
                    }
                    break;
                case 'videos':
                    switch ($view)
                    {
                        case 'home':
                            return URL_LANG.'videos';
                        case 'videos':
                            if($task== 'display'){
								$id  = isset($array_params['id'])?$array_params['id']: 0;
                                $code  = isset($array_params['code'])?$array_params['code']: 'videos';
								return URL_LANG.$code.'-v'.$id.'';
							}else{
								return URL_ROOT.$url;
							}
                        case 'cat':
                            $id  = isset($array_params['id'])?$array_params['id']: 0;
							$ccode  = isset($array_params['ccode'])?$array_params['ccode']: 'danh-muc-videos';
							return URL_LANG.$ccode.'-s'.$id.'';
                        default:
                            return URL_ROOT . $url;
                    }
                    break;
                case 'contact':
                    return URL_LANG . 'lien-he';
                case 'download':
                    return URL_LANG . 'download';
                case 'home':
                    return URL_LANG;
                default:
                    return URL_ROOT . $url;
            }
        }
        return URL_ROOT . $url;
    }
}