<{include file="../plugins/mobile/views/header.tpl"}>
<form action="<{$mbase}>/article/<{$bName}>/forward/<{$gid}>" method="post">
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
<li>�ϼ�ת��:<input type="checkbox" name="threads" /><br />
�ϼ�������:<input type="checkbox" name="noref" />
</li>
<li>��������:<input type="checkbox" name="noatt" /></li>
<li><input type="submit" class="btn" value="ת��"/>&nbsp;<input type="button" class="btn" value="����" onclick="javascript:history.go(-1)" /></li>
</ul>
<{if $single}>
<input type="hidden" name="s" value="1" />
<{/if}>
</form>
<{include file="../plugins/mobile/views/footer.tpl"}>
