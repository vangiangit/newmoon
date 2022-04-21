var $post_config = $('#dropzone_config').val();
Dropzone.autoDiscover = false;
$("div#dropzone-image a.btn-upload").dropzone({
    url: "index.php?module=ajax&view=ajax&raw=1&task=upload_image&config="+$post_config,
    previewsContainer: ".dropzone-thumb",
    init: function() {
        this.on("success", function(file, response) {
            file.serverId = response;
        });
        this.on("addedfile", function(file) {
            var removeButton = Dropzone.createElement("<a class='dz-remove' title='Xóa ảnh này'></a>");
            var _this = this;
            removeButton.addEventListener("click", function(e) {
                e.preventDefault();
                e.stopPropagation();
                _this.removeFile(file);

                $.ajax({
                    type: "POST",
                    url: "index.php?module=ajax&view=ajax&raw=1&task=delete_upload_image&id="+file.serverId,
                    data: "config="+$post_config
                });

            });
            file.previewElement.appendChild(removeButton);
        });
    }
});
function dz_remove($id, $post_config){
    $.ajax({
        type: "POST",
        url: "index.php?module=ajax&view=ajax&raw=1&task=delete_upload_image&id="+$id,
        data: "config="+$post_config
    });
    $('#sort_'+$id).remove();
}
function update_image_title($obj) {
    var $id = $($obj).attr('data-id');
    var $table = $($obj).attr('data-table');
    var $title = $($obj).val();
    $.ajax({
        type: "POST",
        url: "index.php?module=ajax&view=ajax&raw=1&task=update_image_title&id="+$id+"&table="+$table+"&title="+$title,
    });
}
$(document).ready(function(){
    $.ajax({
        type : 'POST',
        dataType: 'json',
        url : 'index2.php?module=ajax&view=ajax&raw=1&task=load_upload_image',
        data: 'config='+$post_config,
        success : function($json){
            if($json.error == false)
                $("div#dropzone-image .dropzone-thumb").html($json.html);
        }
    });
});