<{include file="../plugins/mobile/views/header.tpl"}>
<ul class="list sec">
<li class="f">����:<{$title}></li>
<li>
	<div class="nav hl">
	<a href="<{$mbase}>/user/query/<{$sender}>"><{$sender}></a>|
	<a class="plant"><{$time}></a>|
	<a href="<{$mbase}>/mail/<{$type}>/send/<{$num}>">�ظ�</a>|
	<a href="<{$mbase}>/mail/<{$type}>/forward/<{$num}>">ת��</a>|
	<a href="<{$mbase}>/mail/<{$type}>/delete/<{$num}>">ɾ��</a>|
	<a href="<{$mbase}>/mail/<{$type}>">����</a>
	</div>
	<div class="sp"><{$content}></div>
</li>
</ul>
<{include file="../plugins/mobile/views/footer.tpl"}>
