<{include file="header.tpl"}>
<form action="" method="post">
<ul class="sec list">
<li>�û���:<input id="target" type="text" name="target" value="" style="width:100px" /></li>
<li>�ҵĺ���:
<select onclick="document.getElementById('target').value=this.value">
    <option value="">ѡ�����</option>
<{foreach from=$friends item=item}>
    <option value="<{$item}>"><{$item}></option>
<{/foreach}>
</select>
</li>
<li><input type="submit" class="btn" value="ת��"/>&nbsp;<input type="button" class="btn" value="����" onclick="javascript:history.go(-1)" /></li>
</ul>
</form>
<{include file="footer.tpl"}>
