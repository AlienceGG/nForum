$(init);
function init(){
    $('.board-list tr').mouseover(function(){
        $(this).addClass("mouseover");
    }).mouseout(function(){
        $(this).removeClass("mouseover");
    });
    $('.board-list tr:odd').addClass('bg-odd');
    $('#t_search').mouseover(function(){
        $(this).select();
    });
    var validLogin = function(){
        if(!user_post && !user_login){
            alert('�������ȵ�¼!');
            return false;
        }
    };
    $('#b_post').click(validLogin);
    $('#b_tmpl').click(validLogin);
}
function favadd(name){
    var url = config.base + "/fav/op/0";
    var data = {ac:'ab', v:name};
    $.post(url, data, function(json){
        if(json.st == "success"){
            alert("��ӳɹ�");
        }else if(json.st == "error"){
            alert('��������\ncode:' + json.code + '\n' + json.msg);
        }
    }, "json");
}
