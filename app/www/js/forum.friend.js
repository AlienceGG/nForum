$(function(){
    $('.b-select').click(function(){
        var val = $(this).attr("checked");
        $(".b-select").attr("checked", val);
        $(".b-friend").attr("checked", val);
    });
    $('.b-del').click(function(){
        var enable = false;
        $(".b-friend").each(function(){
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

