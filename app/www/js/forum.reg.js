function validid(){
    $('#t_id').blur(function(){
        var id = $.trim($(this).val());
        if(id == "")
            return;
        var url = config.base + config.wsapi.u_checkid + "?id=" + id;
        var _id = $(this);
        $.getJSON(url, function(json){
            if(json.st == "success" ){
                var res = "";
                _id.nextAll().remove();
                switch(json.v){
                    case 0:
                        res = '<font color="green">��ID����ע��</font>';
                        break;
                    case 4:
                        res = '<font color="red">��ID�ѱ�ʹ��</font>';
                        _id.select();
                        break;
                    default:
                        res = '<font color="red">��ID�����Ϲ淶</font>';
                        _id.select();
                }
                _id.after(res);
            }
        });
    });
}

function validpwd(){
    $('#t_pwd1').blur(function(){
        var pwd = $(this).val();
        $(this).nextAll().remove();
        if(pwd == "")
            return;
        if(pwd.length < 4 || pwd.length > 39){
            $(this).after('<font color="red">���벻���Ϲ淶</font>');
        }else{
            $(this).after('<font color="green">������Ч</font>');
        }
    });
    $('#t_pwd2').blur(function(){
        var pwd = $(this).val();
        $(this).nextAll().remove();
        if(pwd!= $('#t_pwd1').val()){
            $(this).after('<font color="red">�������벻һ��</font>');
        }else{
            $(this).after('<font color="green">��������һ��</font>');
        }
    });
}
$(function(){
    validid();
    validpwd();
    $('#authimg').click(function(){this.src = config.base + "/authimg?_id=" + Math.round(Math.random() * 10000);});
    $('#f_reg').submit(function(){
        if($('#t_id').val() == ""){
            alert('ID����Ϊ��');
            $('#t_id').focus();
            return false;
        }else if($('#t_pwd1').val() == ""){
            alert('���벻��Ϊ��');
            $('#t_pwd1').focus();
            return false;
        }else if($('#t_pwd1').val() != $('#t_pwd2').val()){
            alert('���벻һ��');
            $('#t_pwd2').focus();
            return false;
        }else if($('#t_name').val() == ""){
            alert('�ǳƲ���Ϊ��');
            $('#t_name').focus();
            return false;
        }else if($('#t_auth').val() == ""){
            alert('��֤�벻��Ϊ��');
            $('#t_auth').focus();
            return false;
        }else if($('#t_stuno').val() == ""){
            alert('ѧ�Ų���Ϊ��');
            $('#t_stuno').focus();
            return false;
        }else if($('#t_dept').val() == ""){
            alert('ѧУϵ��������λ����Ϊ��');
            $('#t_dept').focus();
            return false;
        }else if($('#t_tname').val() == ""){
            alert('��ʵ��������Ϊ��');
            $('#t_tname').focus();
            return false;
        }else if($('#t_phone').val() == ""){
            alert('��ϵ�绰����Ϊ��');
            $('#t_phone').focus();
            return false;
        }else if($('#t_address').val() == ""){
            alert('��ϸסַ����Ϊ��');
            $('#t_address').focus();
            return false;
        }else if(!$('#t_year').val().match(/^[0-9]+$/)){
            alert('������ݲ���ȷ');
            $('#t_year').focus();
            return false;
        }else if(!$('#t_month').val().match(/^[0-9]+$/)){
            alert('�����·ݲ���ȷ');
            $('#t_month').focus();
            return false;
        }else if(!$('#t_day').val().match(/^[0-9]+$/)){
            alert('�����ղ���ȷ');
            $('#t_day').focus();
            return false;
        }else if(!$('#t_email').val().match(/^\w+([-+.]\w+)*@\w+([-.]\w)*\.\w+([-.]\w+)*$/)){
            alert('�����ʼ�����ȷ');
            $('#t_email').focus();
            return false;
        }
    });
});
