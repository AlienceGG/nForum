<{include file="header.tpl"}>
	<{include file="s_nav.tpl" nav_left="��¼��̳"}>
        <div class="b-content corner">
<{if isset($from)}>
			<form method="post" action="<{$base}>/login?from=<{$from}>">
            <ul class="l-error corner">
            	<li><samp class="ico-pos-dot"></samp>���Ƿ���ϸ�Ķ��˰����ļ�����������û�е�¼���߲�����ʹ�õ�ǰ���ܵ�Ȩ�ޡ�</li>
            </ul>
<{else}>
			<form method="post" action="<{$base}>/login">
<{/if}>
            <ul class="l-area">
                <li><label for="id" class="t-label">�����������û���:</label><input class="input-text input" type="text" id="id" name="id" tabindex="1"/><a href="<{$base}>/reg">û��ע��?</a></li>
                <li><label for="pwd" class="t-label">��������������:</label><input class="input-text input" type="password" id="pwd" name="passwd" tabindex="2"/><a href="<{$base}>/reset">��������?</a></li>
                <li>
                    <label for="" class="t-label">cookieѡ�</label>
                    <input class="radio" type="radio" checked="checked" name="CookieDate" id="0" value="0"/><label class="r-label" for="1">������</label>
                    <input class="radio" type="radio" name="CookieDate" id="2"  value="1"/><label class="r-label" for="2">����һ��</label>
                    <input class="radio" type="radio" name="CookieDate" id="3"  value="2"/><label class="r-label" for="3">����һ��</label>
                    <input class="radio" type="radio" name="CookieDate" id="4"  value="3"/><label class="r-label" for="4">����һ��</label>
                </li>
                <li class="op"><input class="button" type="submit" value="��¼" /><input class="button" type="button" value="������һҳ"  onclick="javascript:history.go(-1)"/></li>
            </ul>            
            </form>
        </div>   
<{include file="footer.tpl"}>
