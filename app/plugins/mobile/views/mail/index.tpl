<{include file="../plugins/mobile/views/header.tpl"}>
<div class="sec nav">
	<a href="<{$mbase}>/mail/send">���ʼ�</a>|
	<a href="<{$mbase}>/mail/inbox/">�ռ���</a>|
	<a href="<{$mbase}>/mail/outbox/">������</a>|
	<a href="<{$mbase}>/mail/deleted/">������</a>
</div>
<div class="sec nav">
<form action="<{$mbase}>/mail/<{$type}>" method="get">
<{if $curPage != 1}>
	<a href="<{$mbase}>/mail/<{$type}>?p=1">��ҳ</a>|
	<a href="<{$mbase}>/mail/<{$type}>?p=<{$curPage-1}>">��ҳ</a>|
<{/if}>
<{if $curPage != $totalPage}>
	<a href="<{$mbase}>/mail/<{$type}>?p=<{$curPage+1}>">��ҳ</a>|
	<a href="<{$mbase}>/mail/<{$type}>?p=<{$totalPage}>">βҳ</a>|
<{/if}>
	<a class="plant"><{$curPage}>/<{$totalPage}></a>|
	<a class="plant">ת��&nbsp;<input type="text" name="p" size="2" />&nbsp;<input type="submit" value="GO" class="btn" /></a>
</form>
</div>
<ul class="list sec">
<{if $info}>
<{foreach from=$info item=item key=k}>
<li<{cycle values=', class="hla"'}>>
		<{$k+1}>.<a href="<{$mbase}>/mail/<{$type}>/<{$item.num}>"<{if !$item.read}> class="top"<{/if}>><{$item.title}></a><br />
		<a href="<{$mbase}>/user/query/<{$item.sender}>"><{$item.sender}></a>|<{$item.time}>
</li>
<{/foreach}>
<{else}>
<li>û���κ��ż�</li>
<{/if}>
</ul>
<div class="sec nav">
<form action="<{$mbase}>/mail/<{$type}>" method="get">
<{if $curPage != 1}>
	<a href="<{$mbase}>/mail/<{$type}>?p=1">��ҳ</a>|
	<a href="<{$mbase}>/mail/<{$type}>?p=<{$curPage-1}>">��ҳ</a>|
<{/if}>
<{if $curPage != $totalPage}>
	<a href="<{$mbase}>/mail/<{$type}>?p=<{$curPage+1}>">��ҳ</a>|
	<a href="<{$mbase}>/mail/<{$type}>?p=<{$totalPage}>">βҳ</a>|
<{/if}>
	<a class="plant"><{$curPage}>/<{$totalPage}></a>|
	<a class="plant">ת��&nbsp;<input type="text" name="p" size="2" />&nbsp;<input type="submit" value="GO" class="btn" /></a>
</form>
</div>
<{include file="../plugins/mobile/views/footer.tpl"}>
