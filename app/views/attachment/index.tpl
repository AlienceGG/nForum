<{include file="script.tpl"}>
<style>
*{ margin:0px; padding:0px; }
a { color:#6595D6; text-decoration:none; }
a:hover { color:#6595D6; text-decoration:underline; }
body{ font-family:Arial,Verdana,Sans-Serif; font-size:0.8em; }
li{list-style:none;padding:1px}
li span{ }
.input-text{ border:1px solid #7F9DB9; }
.submit{ border:1px solid #77a2d2; background:#ecf4fd; -moz-border-radius: 5px;  -webkit-border-radius: 5px; padding:0; margin:0; color:#4c6785; }
#result{margin-top:5px;padding:5px;border:1px solid #c9d7f1;width:600px}
.red{color:red;}
</style>
<{if !isset($disable)}>
<form method="post" ENCTYPE="multipart/form-data" action="<{$base}>/att/add/<{$bName}><{$postUrl|default:""}>"> 
<input type="file" name="attachfile" size="20" />
<input type="submit" value="�ϴ�" class="submit" style="display:inline"/> &nbsp;&nbsp;��������:&nbsp;<{$maxNum}>&nbsp;&nbsp;&nbsp;&nbsp;��С����:&nbsp;<{$maxSize}>
</form>
<{else}>
���ϴ����ļ������Ѿ��ﵽ����<br />
<{/if}>
<div id="result">
<{foreach from=$atts item=att key=k}>
<li><span><{$k+1}>.&nbsp;&nbsp;<{$att.name}>&nbsp;&nbsp;&nbsp;&nbsp;��С:&nbsp;<{$att.size}>&nbsp;<a href="javascript:window.location.href='<{$base}>/att/del/<{$bName}><{$postUrl|default:""}>?name=<{$att.name}>'">ɾ��</a></span></li>
<{/foreach}>
<{if $num != 0}><br /><{/if}>
��<span class="red"><{$num}></span>���ļ����ܴ�С<span class="red"><{$size}></span>
</div>
