$(function(){
    $('.f-user-add').submit(function(){
        $.post($(this).attr('action'), $(this).getPostData(),
            function(json){
                SYS.clear('friends');
                DIALOG.ajaxDialog(json);
            },'json');
        return false;
    });
    $('.f-user-delete').submit(function(){
        $.post($(this).attr('action'), $(this).getPostData(),
            function(json){
                SYS.clear('friends');
                DIALOG.ajaxDialog(json);
            }, 'json');
        return false;
    });
    $('#body').on('click', '.user-select', function(){
        var val = ($(this).attr("checked") == 'checked');
        $(".user-select").attr("checked", val);
        $(".user-item").attr("checked", val);
    }).on('click', '.user-del', function(){
        if($(".user-item:checked").length <= 0){
            DIALOG.alertDialog("����ѡ��Ҫɾ�����û�!");
            return false;
        }
        DIALOG.confirmDialog("ȷ��Ҫɾ����Щ�û�?",function(){
            $('.f-user-delete').submit();
        });
    });
});

