<{include file="../plugins/mobile/views/header.tpl"}>
<div class="sec nav">
<{if $canPost}>
	<a href="<{$mbase}>/article/<{$bName}>/post?s=1">����</a>|
<{/if}>
	<a href="<{$mbase}>/article/<{$bName}>/<{$gid}>">չ��</a>|
	<a href="<{$mbase}>/article/<{$bName}>/single/<{$gid}>">��Դ</a>|
	<a href="<{$mbase}>/board/<{$bName}>/<{$mode}>">����</a>|
</div>
<ul class="list sec">
<li class="f">����:<{$title}></li>
<li>
	<div class="nav hl">
	<a href="<{$mbase}>/user/query/<{$poster}>"><{$poster}></a>|
	<a class="plant"><{$time}></a>|
	<br />
	<a href="<{$mbase}>/article/<{$bName}>/post/<{$aid}>?s=1">�ظ�</a>|
	<a href="<{$mbase}>/mail/send/<{$poster}>">����</a>|
<{if $op}>
	<a href="<{$mbase}>/article/<{$bName}>/edit/<{$aid}>?s=1">�༭</a>|
	<a href="<{$mbase}>/article/<{$bName}>/delete/<{$aid}>?s=1">ɾ��</a>|
<{/if}>
	</div>
	<div class="sp"><{$content}></div>
</li>
</ul>
<div class="sec nav">
<{if $pre}>
	<a href="<{$mbase}>/article/<{$bName}>/single/<{$pre}>">��һƪ</a>|
<{/if}>
<{if $next}>
	<a href="<{$mbase}>/article/<{$bName}>/single/<{$next}>">��һƪ</a>|
<{/if}>
<{if $tPre}>
	<a href="<{$mbase}>/article/<{$bName}>/single/<{$tPre}>">ͬ������ƪ</a>|
<{/if}>
<{if $tNext}>
	<a href="<{$mbase}>/article/<{$bName}>/single/<{$tNext}>">ͬ������ƪ</a>|
<{/if}>
</div>
<{include file="../plugins/mobile/views/footer.tpl"}>
