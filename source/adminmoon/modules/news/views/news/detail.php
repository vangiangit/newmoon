<?php
global $toolbar;
$title = @$data ? FSText :: _('Edit'): FSText :: _('Add');
$toolbar->setTitle($title);
$toolbar->addButton('apply',FSText :: _('Apply'),'','apply.png'); 
$toolbar->addButton('Save',FSText :: _('Save'),'','save.png'); 
$toolbar->addButton('back',FSText :: _('Cancel'),'','back.png');   
$this -> dt_form_begin(0);
?>
<link rel="stylesheet" type="text/css" href="templates/default/css/bootstrap.min.css"/>
<script type="text/javascript" src="templates/default/js/bootstrap.min.js"></script>
<table cellspacing="1" class="admintable admintable-news" style="width: 100%; table-layout: fixed">
    <tr>
        <td>
            <table cellspacing="1" class="admintable" style="width: 100%; table-layout: fixed; margin-bottom: 0">
                <tr>
                    <td style="vertical-align: bottom">
                        <table cellspacing="1" class="admintable" style="width: 100%; margin-bottom: 0">
                            <?php
                            TemplateHelper::dt_edit_selectbox(FSText::_('Categories'),'category_id',@$data -> category_id,0,$categories,$field_value = 'id', $field_label='treename',$size = 1,0);
                            TemplateHelper::dt_edit_text(FSText :: _('Title'),'title',@$data -> title);
                            ?>
                        </table>
                    </td>
                    <td style="width: 400px;">
                        <table cellspacing="1" class="admintable" style="width: 100%; margin-bottom: 0">
                            <?php TemplateHelper::dt_edit_image(FSText :: _('Image'),'image',URL_ROOT.str_replace('/original/', '/tiny/', @$data->image), '100px');  ?>
                        </table>
                    </td>
                </tr>
            </table>
            <table cellspacing="1" class="admintable" style="width: 100%">
                <?php TemplateHelper::dt_edit_text(FSText :: _('Content'),'content',@$data -> content,'',650,450,1); ?>
            </table>
            <div class="news-menu">

            </div>
        </td>
        <td style="width: 300px; padding-left: 10px; padding-right: 10px">
            <table cellspacing="1" class="admintable" style="width: 100%">
                <?php
                TemplateHelper::dt_edit_text_1(FSText :: _('Summary'),'summary',@$data -> summary,'',100,9);
                TemplateHelper::dt_edit_text_1(FSText :: _('Tags'),'tags',@$data -> tags,'',100,9);
                TemplateHelper::dt_edit_text_1(FSText :: _('Alias'),'alias',@$data -> alias,'',60,1,0,FSText::_("Can auto generate"));
                TemplateHelper::dt_edit_text_1(FSText :: _('SEO title'),'seo_title',@$data -> seo_title,'',100,1);
                TemplateHelper::dt_edit_text_1(FSText :: _('SEO meta keyword'),'seo_keyword',@$data -> seo_keyword,'',100,1);
                TemplateHelper::dt_edit_text_1(FSText :: _('SEO meta description'),'seo_description',@$data -> seo_description,'',100,9);
                TemplateHelper::dt_edit_text_1(FSText :: _('Ordering'),'ordering',@$data -> ordering,@$maxOrdering,'20');
                TemplateHelper::dt_date_pick_1 ( FSText :: _('Published time' ), 'created_time', @$data->created_time?@$data->created_time:date('Y-m-d H:i:s'), FSText :: _('Bạn vui lòng chọn thời gian hiển thị'), 20);
                TemplateHelper::dt_checkbox_1(FSText::_('Published'),'published',@$data -> published,1);
                TemplateHelper::dt_checkbox_1(FSText::_('Hot'),'hot',@$data -> hot,0);
                ?>
            </table>
        </td>
    </tr>
</table>
<?php $this -> dt_form_end(@$data,0); ?>

<script type="text/javascript">
    function get_news_menu(){
        $.ajax({
            type : 'POST',
            url : 'index.php?module=news&view=news&task=get_news_menu&raw=1',
            dataType : 'html',
            data: 'id=<?php echo @$data->id ?>',
            success : function($html){
                $('.news-menu').html($html)
            }
        });
    }

    $(document).ready(function (){
        get_news_menu();
    });

    function editNews($id){
        $.ajax({
            type : 'POST',
            url : 'index.php?module=news&view=news&task=editNews&raw=1',
            dataType : 'html',
            data: 'parent_id=<?php echo @$data->id ?>&id='+$id,
            success : function($html){
                $('#newsModal .modal-body').html($html);
                $('#newsModal').modal('show');
            }
        });
    }

    function saveEditNews(){
        var $data = $('#frmnewsModal').serialize();
        $.ajax({
            type : 'POST',
            url : 'index.php?module=news&view=news&task=saveEditNews&raw=1',
            dataType : 'json',
            data: $data,
            success : function($json){
                get_news_menu();
                $('#newsModal').modal('hide');
            }
        });
    }

    function removenews($id){
        var rConfirm = confirm("Bạn có chắc muốn xóa bản ghi này?");
        if (rConfirm == true) {
            $.ajax({
                type : 'POST',
                url : 'index.php?module=news&view=news&task=removeNews&raw=1',
                dataType : 'json',
                data: 'parent_id=<?php echo @$data->id ?>&id='+$id,
                success : function($html){
                    get_news_menu();
                }
            });
        }
    }
</script>

<style>
    .modal-content .admintable td{
        padding-top: 10px;
        padding-bottom: 10px;
        vertical-align: middle;
        color: #333 !important;
    } 
</style>

<div class="modal fade" id="newsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Mục lục</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="saveEditNews()">Cập nhật</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>