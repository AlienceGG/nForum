<{include file="../plugins/mobile/views/header.tpl"}>
<div class="sec nav">
	<a href="<{$mbase}>/refer/at">@�ҵ�����</a>|
	<a href="<{$mbase}>/refer/reply/">�ظ��ҵ�����</a>|
	<a href="<{$mbase}>/refer/<{$type}>/read?index=all">ȫ���Ѷ�</a>
</div>
<div class="sec nav">
<form action="<{$mbase}>/refer/<{$type}>" method="get">
<{if $curPage != 1}>
	<a href="<{$mbase}>/refer/<{$type}>?p=1">��ҳ</a>|
	<a href="<{$mbase}>/refer/<{$type}>?p=<{$curPage-1}>">��ҳ</a>|
<{/if}>
<{if $curPage != $totalPage}>
	<a href="<{$mbase}>/refer/<{$type}>?p=<{$curPage+1}>">��ҳ</a>|
	<a href="<{$mbase}>/refer/<{$type}>?p=<{$totalPage}>">βҳ</a>|
<{/if}>
	<a class="plant"><{$curPage}>/<{$totalPage}></a>|
	<a class="plant">ת��&nbsp;<input type="text" name="p" size="2" />&nbsp;<input type="submit" value="GO" class="btn" /></a>
</form>
</div>
<ul class="list sec">
<{if isset($info)}>
<{foreach from=$info item=item}>
<li<{cycle values=', class="hla"'}>>
    <div>
		<a href="<{$mbase}>/refer/<{$type}>/read?index=<{$item.index}>"<{if !$item.read}> class="top"<{/if}>><{$item.title}></a>
    </div>
    <div>
		<a href="<{$mbase}>/refer/<{$type}>/delete?index=<{$item.index}>">ɾ��</a>&nbsp;<{$item.time}>&nbsp;<a href="<{$mbase}>/user/query/<{$item.user}>"><{$item.user}></a>
    </div>
</li>
<{/foreach}>
<{else}>
<li>û���κ�����</li>
<{/if}>
</ul>
<div class="sec nav">
<form action="<{$mbase}>/refer/<{$type}>" method="get">
<{if $curPage != 1}>
	<a href="<{$mbase}>/refer/<{$type}>?p=1">��ҳ</a>|
	<a href="<{$mbase}>/refer/<{$type}>?p=<{$curPage-1}>">��ҳ</a>|
<{/if}>
<{if $curPage != $totalPage}>
	<a href="<{$mbase}>/refer/<{$type}>?p=<{$curPage+1}>">��ҳ</a>|
	<a href="<{$mbase}>/refer/<{$type}>?p=<{$totalPage}>">βҳ</a>|
<{/if}>
	<a class="plant"><{$curPage}>/<{$totalPage}></a>|
	<a class="plant">ת��&nbsp;<input type="text" name="p" size="2" />&nbsp;<input type="submit" value="GO" class="btn" /></a>
</form>
</div>
<{include file="../plugins/mobile/views/footer.tpl"}>
