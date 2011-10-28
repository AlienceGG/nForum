<{include file="script.tpl"}>
<style>
*{ margin:0px; padding:0px; }
a { color:#6595D6; text-decoration:none; }
a:hover { color:#6595D6; text-decoration:underline; }
body{ font-family:Arial,Verdana,Sans-Serif; font-size:0.8em;}
li{list-style:none;padding:1px}
li span{ }
.input-text{ border:1px solid #7F9DB9; }
.submit{ border:1px solid #77a2d2; background:#ecf4fd; -moz-border-radius: 5px;  -webkit-border-radius: 5px; padding:0; margin:0; color:#4c6785; }
#result{margin-top:5px;width:690px}
.red{color:red;}
.upload{margin:5px}
.upload input{margin-right:8px}
#upload_file input{margin-top:4px;margin-right:8px;}
table {width:100%;table-layout:fixed;border-collapse:collapse;font-size:12px;border:1px solid #c9d7f1;}
th,td{border-bottom:1px solid #c9d7f1;vertical-align:center;text-align:center;padding:1px 0}
th{background-color:#f5f8fb;}
</style>
<{if !isset($disable)}>
<form method="post" ENCTYPE="multipart/form-data" action="<{$base}>/att/add/<{$bName}><{$postUrl|default:""}>"> 
<div id="upload_file">
<input type="file" name="attachfile1" size="50" />
</div>
<div class="upload">
<input type="submit" value="�ϴ�" class="submit" />
<input type="button" value="���Ӹ���" class="submit" id="b_add"/>
&ensp;��������:&ensp;<{$maxNum}>&ensp;��С����:&ensp;<{$maxSize}>
&emsp;&emsp;<{if isset($msg)}><span class="red"><{$msg}></span><{/if}>
</div>
</form>
<{else}>
<span class="red">���ϴ����ļ������Ѿ��ﵽ����</span>
<{/if}>
<div id="result">
<table>
<tr>
<th style="width:40px;">���</td>
<th>�ļ���</td>
<th style="width:60px;">��С</td>
<th style="width:60px;">����</td>
</tr>
<{foreach from=$atts item=att key=k}>
<tr>
<td><{$k+1}>.</td>
<td><{$att.name}></td>
<td><{$att.size}></td>
<td><a href="javascript:window.location.href='<{$base}>/att/del/<{$bName}><{$postUrl|default:""}>?name=<{$att.name}>'">ɾ��</a></td>
</tr>
<{/foreach}>
<tr>
<td colspan="4">��<span class="red"><{$num}></span>���ļ����ܴ�С<span class="red"><{$size}></span></td>
</tr>
</table>
</div>
<script type="text/javascript" >
<{if isset($new)}>
<{foreach from=$new key=k item=item}>
var txt = parent.document.getElementById('ta_content');
txt.value += "[upload=<{$item}>][/upload]";
<{if isset($exif)}>
txt.value += "\n<{$exif[$k]}>";
<{/if}>
<{/foreach}>
<{/if}>
function file_remove(e){
    $(e).parent().remove();
    iframeAutoFit();
}
$(function(){
    $('#b_add').click(function(){
        if($('#upload_file').children().length >= <{$maxNum}> - <{$num}>){
            alert('������<{$maxNum}>������');
            return false;
        }
        $('#upload_file').append('<div><input type="file" name="attachfile' + Math.round(Math.random()*100000) + '" size="50" /><a href="javascript:void(0)" onclick="file_remove(this)">ɾ��</a></div>');
        iframeAutoFit();
        return false;
    });
});
</script>
