$(function(){
    $('.b_select').click(function(){
        var val = $(this).attr("checked");
        $(".b_select").attr("checked", val);
        $(".b_friend").attr("checked", val);
    });
    $('.b_del').click(function(){
        var enable = false;
        $(".b_friend").each(function(){
            if($(this).attr("checked")){
                enable = true;
                return false;
            }
        });
        if(!enable){
            alert("����ѡ��Ҫɾ���ĺ���!");    
            return false;
        }
        if(confirm("ȷ��Ҫɾ����Щ����?")){
            $('#friend_form').submit();
        }
    });
});

