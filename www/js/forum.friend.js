$(function(){
    $('#friend_add').submit(function(){
        $.post($(this).attr('action'), $(this).getPostData(),
            function(json){
                SYS.clear('friends');
                DIALOG.ajaxDialog(json);
            },'json');
        return false;
    });
    $('#friend_form').submit(function(){
        $.post($(this).attr('action'), $(this).getPostData(),
            function(json){
                SYS.clear('friends');
                DIALOG.ajaxDialog(json);
            }, 'json');
        return false;
    });
    $('#body').on('click', '.friend-select', function(){
        var val = ($(this).attr("checked") == 'checked');
        $(".friend-select").attr("checked", val);
        $(".friend-item").attr("checked", val);
    }).on('click', '.friend-del', function(){
        if($(".friend-item:checked").length <= 0){
            DIALOG.alertDialog("����ѡ��Ҫɾ���ĺ���!");
            return false;
        }
        DIALOG.confirmDialog("ȷ��Ҫɾ����Щ����?",function(){
            $('#friend_form').submit();
        });
    });
});

