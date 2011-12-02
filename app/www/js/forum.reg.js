$(function(){
    var validid = function(){
        $('#t_id').blur(function(){
            var self = $(this), url, id = $.trim(self.val());
            self.nextAll().remove();
            if(id == "")
                return;
            url = SYS.base + '/' + SYS.ajax.valid_id + "?id=" + id;
            $.getJSON(url, function(json){
                if(json.ajax_st == 1 ){
                    var res = "";
                    switch(json.status){
                        case 0:
                            res = '<font color="green">��ID����ע��</font>';
                            break;
                        case 4:
                            res = '<font color="red">��ID�ѱ�ʹ��</font>';
                            self.select();
                            break;
                        default:
                            res = '<font color="red">��ID�����Ϲ淶</font>';
                            self.select();
                    }
                    self.after(res);
                }
            });
        });
    };
    var validpwd = function(){
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
    };
    validid();
    validpwd();
    $('#authimg').click(function(){this.src = $(this).attr('_src') + "?_t=" + $.random()}).click();
    $('#f_reg').submit(function(){
        if($('#t_id').val() == ""){
            $('#t_id').alertDialog('ID����Ϊ��');
            return false;
        }else if($('#t_pwd1').val() == ""){
            $('#t_pwd1').alertDialog('���벻��Ϊ��');
            return false;
        }else if($('#t_pwd1').val() != $('#t_pwd2').val()){
            $('#t_pwd2').alertDialog('���벻һ��');
            return false;
        }else if($('#t_name').val() == ""){
            $('#t_name').alertDialog('�ǳƲ���Ϊ��');
            return false;
        }else if($('#t_auth').val() == ""){
            $('#t_auth').alertDialog('��֤�벻��Ϊ��');
            return false;
        }else if($('#t_stuno').val() == ""){
            $('#t_stuno').alertDialog('ѧ�Ų���Ϊ��');
            return false;
        }else if($('#t_dept').val() == ""){
            $('#t_dept').alertDialog('ѧУϵ��������λ����Ϊ��');
            return false;
        }else if($('#t_tname').val() == ""){
            $('#t_tname').alertDialog('��ʵ��������Ϊ��');
            return false;
        }else if($('#t_phone').val() == ""){
            $('#t_phone').alertDialog('��ϵ�绰����Ϊ��');
            return false;
        }else if($('#t_address').val() == ""){
            $('#t_address').alertDialog('��ϸסַ����Ϊ��');
            return false;
        }else if(!$('#t_year').val().match(/^[0-9]+$/)){
            $('#t_year').alertDialog('������ݲ���ȷ');
            return false;
        }else if(!$('#t_month').val().match(/^[0-9]+$/)){
            $('#t_month').alertDialog('�����·ݲ���ȷ');
            return false;
        }else if(!$('#t_day').val().match(/^[0-9]+$/)){
            $('#t_day').alertDialog('�����ղ���ȷ');
            return false;
        }else if(!$('#t_email').val().match(/^\w+([-+.]\w+)*@\w+([-.]\w)*\.\w+([-.]\w+)*$/)){
            $('#t_email').alertDialog('�����ʼ�����ȷ');
            return false;
        }
        $.post($(this).attr('action'), $(this).getPostData(), function(json){
            if(json.ajax_st == 0){
                $('#t_auth').val('');
                $('#authimg').click();
            }
            DIALOG.ajaxDialog(json)
        }, 'json');
        return false;
    });
});
