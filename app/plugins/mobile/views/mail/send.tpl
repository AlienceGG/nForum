<{include file="../plugins/mobile/views/header.tpl"}>
<form action="" method="post">
<ul class="sec list">
<li>�ռ���:<br /><input type="text" name="id" value="<{$uid}>" style="width:100%" /></li>
<li>����:<br /><input type="text" name="title" value="<{$title}>" style="width:100%" /></li>
<li>����:<br /><textarea name="content" style="width:100%" rows="8"/><{$content}></textarea></li>
<li><input type="checkbox" name="backup" checked="true"/>���ݷ�����</li>
<li><input type="submit" class="btn" value="�ύ"/>&nbsp;<input type="button" class="btn" value="����" onclick="javascript:history.go(-1)" /></li>
</ul>
</form>
<{include file="../plugins/mobile/views/footer.tpl"}>
