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
			<div id="vote_info" class="vote-right">
<{if !$vinfo.isDel}>
				<li class="widget color-default">  
					<div class="widget-head">
						<span class="widget-title vote-hot">�����б�</span>	
					</div>
					<div class="widget-content">
						<ul class="w-list-line">
						<li><a href="<{$base}>/article/<{$board}>/<{$vinfo.aid}>">�鿴����</a></li>
<{if $islogin}>
						<li><a href="<{$base}>/article/<{$board}>/post/<{$vinfo.aid}>">��Ҫ����</a></li>
<{/if}>
<{if $admin}>
						<li><a href="<{$base}>/vote/ajax_delete/<{$vinfo.vid}>.json" class="vote-delete">ɾ����ͶƱ</a></li>
<{/if}>
						</ul>
					</div>
				</li>
                <li class="widget color-default">
                    <div class="widget-head">
                        <span class="widget-title vote-share">ͶƱ����</span>	
                    </div>
                    <div class="widget-content">
                        <div id="vote_share" _u="<{$domain}><{$base}>/vote/view/<{$vinfo.vid}>" _c="#ͶƱ# <{$vinfo.title}>"></div>
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
						<span>ID:<{$vinfo.uid}></span>

						</div>
						<ul class="w-list-line">
						<li><a href="<{$base}>/vote?c=list&u=<{$vinfo.uid}>">�鿴����ͶƱ</a></li>
						<li><a href="<{$base}>/user/query/<{$vinfo.uid}>">�鿴������Ϣ</a></li>
<{if $islogin}>
						<li><a href="<{$base}>/mail/send?id=<{$vinfo.uid}>">������վ����</a></li>
						<li><a href="<{$base}>/friend/add?id=<{$vinfo.uid}>">����Ϊ����</a></li>
<{/if}>
						</ul>
					</div>
				</li>
			</div>
			<div id="vote_view" class="vote-left corner">
                <{include file="../plugins/vote/views/index/vote.tpl"}>  
			</div>
            <div id="vote_comment" class="vote-left corner">
<{if $more}>
                <div class="vote-comment-more"><a href="<{$base}>/article/<{$board}>/<{$vinfo.aid}>">����鿴��������</a></div>
<{/if}>
<{foreach from=$comments item=item}>
                <div class="vote-comment-item">
                    <{if $item.furl}><a class="vote-comment-face" href="<{$base}>/user/query/<{$item.uid}>"><img src="<{$static}><{$base}><{$item.furl}>" /></a><{/if}>
                    <div class="vote-comment-cell">
                        <div class="vote-comment-id"><a href="<{$base}>/user/query/<{$item.uid}>"><{$item.uid}></a></div>
                        <div class="vote-comment-content"><{$item.content}></div>
                        <div class="vote-comment-time"><{$item.time}></div>
                    </div>
                </div>
<{/foreach}>
<{if $islogin}>
                <div class="vote-comment-comment corner">
                    <form id="vote_post" method="post" action="<{$base}>/article/<{$board}>/ajax_post.json?ajax_redirect=/vote/view/<{$vinfo.vid}>&ajax_title=ͶƱ:<{$vinfo.title}>">
                    <div class="vote-comment-btn"><input type="submit" class="button" value="��Ҫ����" /></div>
                    <div class="vote-comment-txt"><textarea name="content" placeholder="д���������..."></textarea></div>
                    <input type="hidden" name="id" value="<{$reid|default:0}>" />
                    <input type="hidden" name="subject" value="<{$title}>" />
                    </form>
                </div>
<{/if}>
            </div>
		</div>
