$(function(){
    var ubb = false;
    $('#ta_content').click(function(){
        if(ubb) return true;
        $(this).ubb({
            ubb_img_path:config.base + "/img/ubb/",
            ubb_em:$('#em_img')
        });
        ubb = true;
        $(this).focus();
    }).keydown(function(event){
        if(event.ctrlKey && event.keyCode == 13){
            $('#f_article').submit();
            return false;
        }
    });
    $('#f_article').submit(function(){
        if($('#subject').val() == ""){
            alert('���������±���');
            return false;
        }
        return true;
    });
    $('#b_preview').click(function(){
        $('#pre_t').val($('#subject').val());
        $('#pre_c').val($('#ta_content').val());
        $('#f_preview').submit();
    });
});
