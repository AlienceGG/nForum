$(function(){
    $('#f_reset').submit(function(){
        if($('#t_id').val() == ""){
            alert('ID����Ϊ��');
            $('#t_id').focus();
            return false;
        }else if($('#t_auth').val() == ""){
            alert('��֤�벻��Ϊ��');
            $('#t_auth').focus();
            return false;
        }
    });
    if($('#b_auth').length == 0)
        return;
    var tmp = $('<div style="position:absolute;text-align:center;display:none"><img src="'+config.base+'/authimg" /><br /><input type="text" id="t_imgauth" class="input-text" size="6"/><input type="button" class="button" id="b_imgauth" value="ȷ��"/></div>');
    $('body').append(tmp);
    $('#b_imgauth').click(function(){
        var num = $('#t_phone').val();
        var url = config.base + "/auph?f=" + num + "&au=" + $('#t_imgauth').val() + "&t=1&id=" + $('#t_id').val();
        $.getJSON(url, function(json){
            alert(json.msg);
            $('#b_auth').val("��ȡ��֤��").attr("disabled", false);
        });
        tmp.hide();
    });

    $('#b_auth').click(function(e){
        var num = $('#t_phone').val();
        if(!num.match(/^1[0-9]{10}$/)){
            alert("��������ȷ���ֻ���");
            return false;
        }
        if($('#t_id').val() == ""){
            alert('ID����Ϊ��');
            $('#t_id').focus();
            return false;
        }
        function getMPos(ev){
            if(ev.pageX || ev.pageY)
                return {x:ev.pageX, y:ev.pageY};
            return {
                x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,
                y:ev.clientY + document.body.scrollTop  - document.body.clientTop
            }; 
        }
        $(this).val("���Ժ�...").attr("disabled", true);
        var pos = getMPos(e);
        var imgs = tmp.css('top', pos.y - 75).css('left', pos.x - 50).show().find('img');
        imgs.attr('src', imgs.attr("src") + "?id=" + Math.round(Math.random() * 10000));
    }).attr("disabled", false);
});
