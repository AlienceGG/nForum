<{include file="../plugins/mobile/views/header.tpl"}>
<ul class="list sec">
<li class="f">����:<{$title}></li>
<li>
	<div class="nav hl">
	<a href="<{$mbase}>/user/query/<{$sender}>"><{$sender}></a>|
	<a class="plant"><{$time}></a>|
	<a href="<{$mbase}>/mail/send/<{$num}>?a=r">�ظ�</a>|
	<a href="<{$mbase}>/mail/send/<{$num}>?a=f">ת��</a>|
	<a href="<{$mbase}>/mail/delete/<{$num}>">ɾ��</a>|
	</div>
	<div class="sp"><{$content}></div>
</li>
</ul>
<{include file="../plugins/mobile/views/footer.tpl"}>
