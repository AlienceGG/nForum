<{include file="../plugins/mobile/views/header.tpl"}>
<{if !isset($noid)}>
<ul class="sec list">
<li class="f">ID:&nbsp;<{$uid}></li>
<li>�ǳ�:&nbsp;<{$name}></li>
<{if !($hide) || $isAdmin}>
<li>�Ա�:&nbsp;<{$gender}></li>
<li>����:&nbsp;<{$astro}></li>
<{/if}>
<li>�ȼ�:&nbsp;<{$level}></li>
<li>����:&nbsp;<{$postNum}></li>
<{if $me || $isAdmin}>
<li>��½����:&nbsp;<{$loginNum}></li>
<{/if}>
<li>������:&nbsp;<{$life}></li>
<{if $me || $isAdmin}>
<li>ע��ʱ��:&nbsp;<{$first}></li>
<{/if}>
<li>�ϴε�¼:&nbsp;<{$lastTime}></li>
<li>������IP:&nbsp;<{$lastIP}></li>
<li>��ǰ״̬:&nbsp;<{$status}></li>
</ul>
<{/if}>
<div class="sp sec">
��ѯID:&nbsp;<input type="text" id="u_txt" size="10"/>&nbsp;<input type="button" value="GO" class="btn" onclick="window.location.href='<{$mbase}>/user/query/'+document.getElementById('u_txt').value"/>
</div>
<{include file="../plugins/mobile/views/footer.tpl"}>
