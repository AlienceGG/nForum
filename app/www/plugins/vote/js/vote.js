var vote = {
    head:"#vote_head",
    items:"#vote_item",
    opt:"#vote_opt",
    templete:"",
    maxItem:20,
    itemNum:0,
    init:function(num){
        num = (num >this.maxItem)?this.maxItem:num;
        num = (num < 2)?2:num;
        this.templete = $(this.items).html();
        $(this.items).empty().show();
        for(var i=1;i<=num;i++)
            this.addItem();
    },
    addItem:function(){
        if(this.itemNum >= this.maxItem){
            alert("���ֻ�����20��ѡ��");
            return false;
        }
        var name = "i" + Math.round(Math.random()*100000);
        $(this.items).append(this.templete.replace(/%name%/, name));
        this.itemNum ++;
    },
    removeItem:function(item){
        if(!confirm("ȷ��ɾ������?"))
            return false;
        if(this.itemNum <= 2){
            alert("���ٱ���2��ѡ��");
            return false;
        }
        $(item).parent().prev().remove();
        $(item).parent().remove();
        this.itemNum --;
    },
    isNull:function(){
        if($.trim($(this.head).find('input').val()) == "")
                return true;
        var iNull = 0;
        $(this.items).find('input').each(function(){
            if($.trim($(this).val()) != ""){
                iNull++;
            }
        });
        return (iNull<2);
    }
};
$(function(){
    //for vote list
    if($(".vote-left").length > 0){
        $(".vote-left").adjust($('.vote-main'), $('.vote-right').width()+15);
        $(".widget").makeRC();
    }else if($('#vote_opt').length>0){
        $('#f-vote').submit(function(){
            if(vote.isNull()){
                alert('��������д�����2��ѡ��');
                return false;
            }
            if(!$('#vote_opt').find('input[name="end"]').val().match(/^\d{4}(-\d{2}){2}$/)){
                alert('����д��ȷ�Ľ�ֹ����');
                return false;
            }

        });
        $('#vote_opt').find('input[name="end"]').datepicker({dateFormat:"yy-mm-dd",showMonthAfterYear:true,minDate:new Date(), dayNamesMin:['��', 'һ', '��', '��', '��', '��', '��'],monthNames:['һ��', '����', '����', '����', '����', '����','����','����','����','ʮ��','ʮһ��','ʮ����']});
        vote.init(6);
    }
    if($('#vote_table').length>0){
        var checkbox = $('#vote_table input:checkbox'),
            limit = $('#vote_table').attr('_limit');
        if(checkbox.length > 0 && limit > 0){
            checkbox.click(function(){
                if(checkbox.filter(':checked').length > limit){
                    alert("��ͶƱ���ѡ"+limit+"��ѡ��");
                    return false;
                }
            });
        }
    }
});
