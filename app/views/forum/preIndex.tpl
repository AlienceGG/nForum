<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=Content-Language content=zh-cn>
<meta http-equiv="Content-Type" content="text/html; charset=<{$encoding}>">
<meta name="keywords" content="<{$keywords}>">
<meta name="description" content="<{$description}>">
<meta name="author" content="�������Ŷ�(BYR-Team)">
<title><{$webTitle}></title>
<{include file="css.tpl"}>
</head>
<body>
<div id="wrap">
<div id="preImg">
<{if !empty($preimg)}>
<a href="<{$preimg.url}>" ><img src="<{$preimg.file}>" alt="�������<{$siteName}>"/></a>
<{/if}>
</div>

<div id="login">
<form id="f_login" method="post" action="<{$base}>/login">
<span>�û���:</span>
<input name="id" type="text" class="input-text"  id="id" size="10" onmouseover=this.focus() tabindex="1"/>
<span>����:</span>
<input name="passwd" type="password" class="input-text" id="pwd" size="10" onmouseover=this.focus() tabindex="2" />
<select name="mode" id="s-mode">
<option value="0">nForum</option>
</select>
<select name="CookieDate">
<option value="0">������</option>
<option value="1">����һ��</option>
<option value="2">����һ��</option>
<option value="3">����һ��</option>
</select>
<input type="submit" id="b_login" class="submit" value="��¼"/>
<input type="button" id="b_guest" class="submit" value="�ο�"/>
<input type="button" id="b_reg" class="submit" value="ע��"/>
</form>
</div>
<div id="b_adv">
<ul>
<{foreach from=$preadv item=item}>
<li><a href="<{$item.url}>"><img src="<{$item.file}>"></a></li>
<{/foreach}>
</ul>
</div>
</div>
<!--footer start-->
<div id="footer">
	<p class="footer_message">
    	<img src="<{$base}>/img/logo_footer.gif" />
        ��ǰ��̳���ܹ���<span class="c-total"><{$webTotal}></span>�����ߣ�����ע���û�<span class="c-user"><{$webUser}></span>�ˣ��ÿ�<span class="c-guest"><{$webGuest}></span>�ˡ�<br />
        powered by BYR-Team&copy;2009.<br />
        all rights reserved
    </p>	
</div>
<!--footer end-->
</body>
<{include file="script.tpl"}>
</html>
