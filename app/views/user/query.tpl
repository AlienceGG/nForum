<{include file="header.tpl"}>
	<{include file="s_nav.tpl" nav_left="�û���Ϣ"}>
        <div class="b-content corner">
<{if !isset($noid)}>
        	<h5 class="u-name">
				<{$uid}>
				<{if $islogin}>
				<a href="<{$base}>/mail/send?id=<{$uid}>">���ʺ���</a>|<a href="<{$base}>/friend/add?id=<{$uid}>">��Ϊ����</a>
				<{/if}>
			</h5>
			<h5 class="u-title">������Ϣ</h5>
			<div id="u-img">
            <img src="<{$static}><{$base}><{$furl}>" <{if $fwidth != ""}>width="<{$fwidth}>px"<{/if}> <{if $fheight != ""}>height="<{$fheight}>px"<{/if}> />
			</div>
            <dl class="u-info">
            	<dt>�� �ƣ�</dt>
				<dd><{$name}></dd>
<{if !($hide) || $isAdmin}>
            	<dt>�� ��</dt>
				<dd><{$gender}></dd>
                <dt>�� ����</dt>
				<dd><{$astro}></dd>
<{/if}>
                <dt>QQ��</dt>
				<dd><{$qq}></dd>
                <dt>MSN��</dt>
				<dd><{$msn}></dd>
                <dt>�� ҳ��</dt>
				<dd><{$homepage}></dd>
            </dl>
            <h5 class="u-title">��̳����</h5>	
            <dl class="u-info u-detail">
            	<dt>��̳�ȼ���</dt>
				<dd><{$level}></dd>
                <dt>����������</dt>
				<dd><{$postNum}>ƪ</dd>
<{if $me || $isAdmin}>
                <dt>��½������</dt>
				<dd><{$loginNum}></dd>
<{/if}>
                <dt>��������</dt>
				<dd><{$life}></dd>
<{if $me || $isAdmin}>
                <dt>ע��ʱ�䣺</dt>
				<dd><{$first}></dd>
<{/if}>
                <dt>�ϴε�¼��</dt>
				<dd><{$lastTime}></dd>
                <dt>������IP��</dt>
				<dd><{$lastIP}></dd>
                <dt>��ǰ״̬��</dt>
				<dd><{$status}></dd>
            </dl>
<{/if}>
            <h5 class="search_user">
				<form method="get" action="/user/query" id="f_search" >
				<span>��ѯ�û���</span>
				<input class="input_search input-text"type="text" id="s_name" value="" />
				<input class="search_sub button" type="submit" id="s_btn" value="��ѯ" />
				</form>
			</h5>
    	</div>
<{include file="footer.tpl"}>
