<!--menu start-->
<div id="menu" class="m-hide">
    <!--login start-->
<{if !($islogin)}>
	<div class="u-login corner">
		<form class="user_login_form" action="<{$base}>/login<{if isset($from)}>?from=<{$from}><{/if}>" method="post">
		<div><span>�ʺ�:</span><input type="text" id="id" class="input-text input" name="id"/></div>
		<div><span>����:</span><input type="password" id="pwd" class="input-text input" name="passwd"/></div>
		<div class="l-check"><input type="checkbox" id="c_auto" name="CookieDate" value="2"/><label for="c_auto">�´��Զ���¼</label></div>
		<div class="b-op">
			<input type="submit" id="bb_login" class="submit" value="��¼" /><input class="submit" type="button" value="ע��" id="bb_reg"/>
		</div>
        </form>  
    </div>
<{else}><{if $newNum != 0}>
	<bgsound src="<{$base}>/files/audio/mail.wav" /><{/if}>
    <div class="u-login-info corner">
    	<div><samp class="ico-pos-cdot"></samp>��ӭ<a href="<{$base}>/user/query/<{$id}>" title="<{$id}>"><{$id|truncate:11:"..."}></a></div>
        <ul>
        	<li><a href="<{$base}>/mail">�ҵ��ռ���<{if $newNum != 0}><span class="new_mail">(<{$newNum}>��)</span><{/if}></a></li>
            <!--<li><a href="#">�ҵĸ��˲���</a></li>-->
            <li><a href="<{$base}>/fav">�ҵ��ղؼ�</a></li>
        	<li><a href="<{$base}>/widget/add">������ҳ����</a></li>
        	<!--<li><a href="#">��̳��������</a></li>-->
            <li><a href="<{$base}>/logout">�˳���¼</a></li>
        </ul>
    </div>
<{/if}>
    <!--login end-->
	<div id="left-line">
		<samp class="ico-pos-hide"></samp>
	</div>
    <!--function list start -->
	<div id="xlist" class="corner">
    	<ul>
			<li class="has_child"> <a href="javascript:void(0);" class="xlist-a"><samp class="ico-pos-tag-off"></samp>ȫ��������</a><ul  id="list-section" class="child_list xtree"> </ul> </li>
<{if $islogin}>
            <li class="has_child"><a href="javascript:void(0);" class="xlist-a"><samp class="ico-pos-tag-off"></samp>�ҵ��ղؼ�</a><ul id="list-favor" class="child_list xtree"></ul></li>
<{/if}>
            <li class="has_child"><a href="javascript:void(0)" class="xlist-a"><samp class="ico-pos-tag-off"></samp>�������</a><ul class="child_list" id="list-control"><{if $islogin}><{if !$isReg}><li><a href="<{$base}>/reg/form" class="xlist-a"><samp class="ico-pos-dot"></samp>��дע�ᵥ</a></li><{/if}><li><a href="<{$base}>/user/info" class="xlist-a"><samp class="ico-pos-dot"></samp>���������޸�</a></li><li><a href="<{$base}>/user/passwd" class="xlist-a"><samp class="ico-pos-dot"></samp>�ǳ������޸�</a></li><li><a href="<{$base}>/user/custom" class="xlist-a"><samp class="ico-pos-dot"></samp>�û��Զ������</a></li><li><a href="<{$base}>/friend" class="xlist-a"><samp class="ico-pos-dot"></samp>�����б�</a></li><li><a href="<{$base}>/fav" class="xlist-a"><samp class="ico-pos-dot"></samp>�ղؼй���</a></li><li><a href="<{$base}>/online" class="xlist-a"><samp class="ico-pos-dot"></samp>�����û�</a></li><{/if}><li><a href="<{$base}>/user/query" class="xlist-a"><samp class="ico-pos-dot"></samp>��ѯ�û�</a></li><li><a href="<{$base}>/s" class="xlist-a"><samp class="ico-pos-dot"></samp>��������</a></li></ul></li>
			<li class="no_child"><a href="<{$base}>/vote" class="xlist-a"><samp class="ico-pos-cdot"></samp>ͶƱϵͳ</a></li><li class="no_child"><a href="<{$base}>/elite/path" class="xlist-a"><samp class="ico-pos-cdot"></samp>������</a></li><li class="no_child"><a href="telnet://#" class="xlist-a"><samp class="ico-pos-cdot"></samp>Telnet��¼</a></li><li class="no_child search"><samp class="ico-pos-cdot"></samp><input type="text" class="input-text" value="����������" id="b_search"/></li>
        </ul>
    </div>
    <!--function list end-->
	<div id="adv">
<{foreach from=$advs item=item}>
		<a href="<{$item.url}>"><img src="<{$base}><{$item.path}>" /></a>
<{/foreach}>
	</div>
</div>
<!--menu end-->
