$(function(){
    $('.b-select').click(function(){
        var val = $(this).attr("checked");
        $(".b-select").attr("checked", val);
        $(".b-mail").attr("checked", val);
    });
    $('.b-del').click(function(){
        var enable = false;
        $(".b-mail").each(function(){
            if($(this).attr("checked")){
                enable = true;
                return false;
            }
        });
        if(!enable){
            alert("����ѡ��Ҫɾ�����ʼ�!");    
            return false;
        }
        if(confirm("ȷ��Ҫɾ����Щ�ʼ�?")){
            $('#mail_form').submit();
        }
    });
    $('.b-clear').click(function(){
        if(confirm("ȷ��Ҫɾ��ȫ���ʼ�?")){
            $('#mail_clear').submit();
        }
    });
    $('#a_content').keydown(function(event){
        if(event.ctrlKey && event.keyCode == 13){
            $('#f_mail').submit();
            return false;
        }
    });
    $('#f_mail').submit(function(){
        if($.trim($('#id').val()) ==  ""){
            alert("����д�ռ���");
            return false;
        }
    });
});
