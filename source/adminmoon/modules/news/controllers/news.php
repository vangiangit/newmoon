<?php
/**
 * @author vangiangfly
 * @final 21/04/2013
 */ 
class NewsControllersNews extends Controllers
{
    function __construct()
    {
        $this->view = 'news';
        parent::__construct();
    }
    function display()
    {
        parent::display();
        $sort_field = $this->sort_field;
        $sort_direct = $this->sort_direct;
        $model = $this->model;
        $list = $model->get_data();
        $categories = $model->get_categories_tree();
        $pagination = $model->getPagination();
        include 'modules/' . $this->module . '/views/' . $this->view . '/list.php';
    }
    function add()
    {
        $model = $this->model;
        $categories = $model->get_categories_tree();
        $categories_home = $model->get_categories_tree();
        $maxOrdering = $model->getMaxOrdering();
        $creators = [];
        include 'modules/' . $this->module . '/views/' . $this->view . '/detail.php';
    }
    function edit()
    {
        $ids = FSInput::get('id', array(), 'array');
        $id = $ids[0];
        $model = $this->model;
        $categories = $model->get_categories_tree();
        $data = $model->get_record_by_id($id);
        $creators = $model->get_records(' published = 1', 'fs_users');
        include 'modules/' . $this->module . '/views/' . $this->view . '/detail.php';
    }
    function view_comment($new_id)
    {
        $link = 'index.php?module=news&view=comments&keysearch=&text_count=1&text0=' . $new_id .'&filter_count=1&filter0=0';
        return '<a href="' . $link . '" target="_blink">Comment</a>';
    }

    function get_news_menu(){
		$id = FSInput::get('id', 0, 'int');
		$list = $this->model->get_news_menu($id);?>
		<table class="table table-bordered table-hover">
			<thead class="thead-light">
				<tr>
                    <th scope="col" class="text-center">Mục lục</th>
                    <th scope="col" class="text-center">Ordering</th>
                    <th scope="col" class="text-center">Công cụ</th>
				</tr>
			</thead>
			<tbody>
                <?php foreach ($list as $item){ ?>
                    <tr>
                        <td><?php echo $item->treename ?></td>
                        <td><?php echo $item->ordering ?></td>
                        <td>#<?php echo $item->link ?></td>
                        <td class="text-center">
                            <a href="javascript:void(0);" onclick="editNews(<?php echo $item->id ?>)"><img src="templates/default/images/icon-edit.png" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="javascript:void(0);" onclick="removeNews(<?php echo $item->id ?>)" style="color: red"><img src="templates/default/images/icon-close.png" /></i></a>
                        </td>
                    </tr>
                <?php } ?>
			</tbody>
            <tfoot>
                <tr>
                    <td colspan="2" class="text-center">
                        <a href="javascript:void(0);" title="Thêm" onclick="editNews(0)"><i class="fa fa-plus-square"></i> Thêm mới</a>
                    </td>
                </tr>
            </tfoot>
		</table>
		<?php
	}

	function editNews(){
		$parent_id = FSInput::get('parent_id', 0, 'int');
		$id = FSInput::get('id', 0, 'int');
		$data = $this->model->get_record('id='.$id, 'fs_news_menus');
		$list = $this->model->get_news_menu($parent_id);?>
        <form class="" role="form" action="index.php?module=news&view=news" id="frmnewsModal" name="frmnewsModal" method="post" enctype="multipart/form-data">
            <table cellspacing="1" class="admintable" style="width: 100%">
                <?php
                TemplateHelper::dt_edit_selectbox(FSText::_('Mục cha'),'news_parent_id', @$data->parent_id,'', $list, $field_value = 'id', $field_label='treename', $size = 1,0,1);
                TemplateHelper::dt_edit_text(FSText :: _('Name'),'news_name',@$data->name);
                TemplateHelper::dt_edit_text(FSText :: _('Link'),'news_link',@$data->link);
                TemplateHelper::dt_edit_text(FSText :: _('Ordering'),'news_ordering',@$data->ordering);
                ?>
                <input name="data_id" type="hidden" value="<?php echo $id ?>">
                <input name="data_parent_id" type="hidden" value="<?php echo $parent_id ?>">
            </table>
        </form>
        <div class="clearfix"></div>
        <?php
    }

    function saveEditNews(){
	    $json = array('error' => false);
        $this->model->saveEditNews();
        echo json_encode($json);
    }

    function removeNews(){
        $id = FSInput::get('id', 0, 'int');
        $json = array('error' => false);
        $this->model->_remove('id='.$id, 'fs_news_menus');
        echo json_encode($json);
    }
}