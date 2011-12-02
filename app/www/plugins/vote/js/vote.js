$(function(){
    //for vote add
    if($('#vote_opt').length>0){
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
                console.log($(this.items));
                for(var i=1;i<=num;i++)
                    this.addItem();
                $(this.items).on('click', 'samp', this.removeItem);
                $(this.opt).on('click', '.item-more', this.addItem);
            },
            addItem:function(){
                if(vote.itemNum >= vote.maxItem){
                    alert("���ֻ�����20��ѡ��");
                    return false;
                }
                var name = "i" + Math.round(Math.random()*100000);
                $(vote.items).append(vote.templete.replace(/%name%/, name));
                vote.itemNum ++;
            },
            removeItem:function(){
                if(!confirm("ȷ��ɾ������?"))
                    return false;
                if(vote.itemNum <= 2){
                    alert("���ٱ���2��ѡ��");
                    return false;
                }
                $(this).parent().prev().remove();
                $(this).parent().remove();
                vote.itemNum --;
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
        vote.init(6);

        $('#f_vote').submit(function(){
            if(vote.isNull()){
                alert('��������д�����2��ѡ��');
                return false;
            }
            if(!$('#vote_opt').find('input[name="end"]').val().match(/^\d{4}(-\d{2}){2}$/)){
                alert('����д��ȷ�Ľ�ֹ����');
                return false;
            }
            $.post($(this).attr('action'), $(this).getPostData(), function(json){
                DIALOG.ajaxDialog(json)
            }, 'json');
            return false;
        });

        $('#vote_opt').find('input[name="end"]').datepicker({dateFormat:"yy-mm-dd",showMonthAfterYear:true,minDate:new Date(), dayNamesMin:['��', 'һ', '��', '��', '��', '��', '��'],monthNames:['һ��', '����', '����', '����', '����', '����','����','����','����','ʮ��','ʮһ��','ʮ����']});

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
    if($('#vote_share').length>0){
        BShare.init($('#vote_share'), $('#vote_share').attr('_u'), $('#vote_share').attr('_c'));
        $('#f_view').submit(function(){
            $.post($(this).attr('action'), $(this).getPostData(), function(json){
                if(json.ajax_st == 1)
                    BODY.refresh();
                else
                    DIALOG.ajaxDialog(json)
            }, 'json');
            return false;
        });

    }
    $('#body').on('click', '.vote-delete', function(){
        var self = this;
        DIALOG.confirmDialog('ȷ��ɾ����ͶƱ?', function(){
            $.post($(self).attr('href'), function(json){
                if(json.ajax_st ==1){
                    if(BODY.get('path').match(/vote\/view\/\d+/))
                        BODY.open('vote?c=list&u=' + SESSION.get('id'));
                    else
                        BODY.refresh();
                }else{
                    DIALOG.ajaxDialog(json)
                }
            }, 'json');
        })
    });
});
