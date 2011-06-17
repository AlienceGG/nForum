<{include file="header.tpl"}>
    	<div class="mbar">
        	<ul>
                <li><a href="<{$base}>/vote?c=new">����ͶƱ</a></li>
                <li><a href="<{$base}>/vote?c=hot">����ͶƱ</a></li>
                <li><a href="<{$base}>/vote?c=all">ȫ��ͶƱ</a></li>
<{if $islogin}>
                <li><a href="<{$base}>/vote?c=list&u=<{$id}>">�ҵ�ͶƱ</a></li>
                <li><a href="<{$base}>/vote?c=join">�Ҳ����ͶƱ</a></li>
                <li><a href="<{$base}>/vote/add">��ͶƱ</a></li>
<{/if}>
<{if $isAdmin}>
                <li><a href="<{$base}>/vote?c=del">��ɾ����ͶƱ</a></li>
<{/if}>
            </ul>					
        </div>
		<div class="b-content vote-main">
			<div class="vote-title">�鿴ͶƱ</div>
			<div id="vote_view" class="vote-left">
				<div class="view-wrap">
				<form action="" method="post">
				<h1><{$info.title}><span>(<{$info.limitMsg}>)</span></h1>
				<h2>����ʱ��:<{$info.start}>&nbsp;&nbsp;&nbsp;��ֹ����:<{$info.end}><{if $info.isEnd}><font color="red">(�ѽ�ֹ)</font><{/if}><{if $info.isDel}><font color="red">(��ɾ��)</font><{/if}>&nbsp;&nbsp;&nbsp;��������:<{$info.num}></h2>
<{if $info.desc!=""}>
				<h3><{$info.desc}></h3>
<{/if}>
				<table id="vote_table" cellpadding="0" cellspacing="0" _limit="<{$info.limit}>">
<{foreach from=$item item=item}>
					<tr>
						<td class="col1"><{$item.label}>:</td>
						<td class="col2"><div class="vote-scroll corner"><span class="corner" style="width:<{$item.percent}>%"></span></div></td>
						<td class="col3"><{$item.num}>(<{$item.percent}>%)</td>
<{if $info.type=="0"}>
						<td class="col4"><input type="radio" name="v<{$info.vid}>" value="<{$item.viid}>"<{if $info.voted || $info.isEnd || $info.isDel}> disabled="true"<{if $item.on}> checked="true"<{/if}><{/if}> /></td>
<{else}>
						<td class="col4"><input type="checkbox" name="v<{$info.vid}>_<{$item.viid}>"<{if $info.voted || $info.isEnd || $info.isDel}> disabled="true"<{if $item.on}> checked<{/if}><{/if}> /></td>
<{/if}>
					</tr>
<{/foreach}>
				</table>
				<div class="vote-submit">
<{if !$islogin}>
���¼�����ͶƱ
<{elseif !$info.voted}>
<{if !$info.isDel&& !$info.isEnd}>
					<input type="submit" class="button" value="�ύ" />
					<input type="reset" class="button" value="����" />
<{/if}>
<{else}>
���� <{$myres.time}> �����˴�ͶƱ��
<{/if}>
				</div>
				</form>
				</div>
			</div>
			<div id="vote_info" class="vote-right">
<{if !$info.isDel}>
				<li class="widget color-white">  
					<div class="widget-head">
						<span class="widget-title vote-hot">�����б�</span>	
					</div>
					<div class="widget-content">
						<ul class="w-list-line">
						<li><a href="<{$base}>/article/<{$board}>/<{$info.aid}>">�鿴����</a></li>
<{if $islogin}>
						<li><a href="<{$base}>/article/<{$board}>/post?reid=<{$info.aid}>">��Ҫ����</a></li>
<{/if}>
<{if $admin}>
						<li><a href="<{$base}>/vote/delete/<{$info.vid}>" onclick="return confirm('ȷ��ɾ����ͶƱ?')">ɾ����ͶƱ</a></li>
<{/if}>
						</ul>
					</div>
				</li>
<{/if}>
				<li class="widget color-default">  
					<div class="widget-head">
						<span class="widget-title vote-user">������</span>	
					</div>
					<div class="widget-content">
						<div class="w-free">
<{if $furl}>
						<img src="<{$base}><{$furl}>" <{if $fwidth != ""}>width="<{$fwidth}>px"<{/if}> <{if $fheight != ""}>height="<{$fheight}>px"<{/if}> />
<{/if}>
						<span>ID:<{$info.uid}></span>

						</div>
						<ul class="w-list-line">
						<li><a href="<{$base}>/vote?c=list&u=<{$info.uid}>">�鿴����ͶƱ</a></li>
						<li><a href="<{$base}>/user/query/<{$info.uid}>">�鿴������Ϣ</a></li>
<{if $islogin}>
						<li><a href="<{$base}>/mail/send?id=<{$info.uid}>">������վ����</a></li>
						<li><a href="<{$base}>/friend/add?id=<{$info.uid}>">����Ϊ����</a></li>
<{/if}>
						</ul>
					</div>
				</li>
			</div>
		</div>
<{include file="footer.tpl"}>
