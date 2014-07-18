<!--menu start-->
<aside id="menu" class="m-hide">

    <!--login start-->
    <section id="u_login" class="corner">
<{if !($isLogin)}>
        <form action="<{$base}>/login<{if isset($from)}>?from=<{$from}><{/if}>" method="post">
        <div class="u-login-input"><input type="text" id="u_login_id" class="input-text input" name="id" placeholder="�û���"/></div>
        <div class="u-login-input"><input type="password" id="u_login_passwd" class="input-text input" name="passwd" placeholder="����"/></div>
        <div class="u-login-check"><input type="checkbox" id="u_login_cookie" name="CookieDate" value="2"/><label for="u_login_cookie">�´��Զ���¼</label></div>
        <div class="u-login-op">
            <input type="submit" id="u_login_submit" class="submit" value="��¼" /><input class="submit" type="button" value="ע��" id="u_login_reg"/>
        </div>
        </form>
<{else}>
        <div class="u-login-id"><samp class="ico-pos-cdot"></samp>��ӭ<a href="<{$base}>/user/query/<{$id}>" title="<{$id}>"><{$id|truncate:11:"..."}></a></div>
        <ul class="u-login-list">
            <li><a href="<{$base}>/mail">�ҵ��ռ���</a></li>
            <li><a href="<{$base}>/fav">�ҵ��ղؼ�</a></li>
            <li><a href="<{$base}>/widget/add">������ҳ����</a></li>
            <li><a href="<{$base}>/logout">�˳���¼</a></li>
        </ul>
<{/if}>
    </section>
    <!--login end-->

    <div id="left_line">
        <samp class="ico-pos-hide"></samp>
    </div>

    <!--nav start -->
    <nav id="xlist" class="corner">
        <ul>
            <li class="slist">
                <span class="x-folder"><span class="toggler"></span><a href="javascript:void(0);">ȫ��������</a></span>
                <ul class="x-child ajax"><li>{url:<{$base}>/slist.json?uid=<{$id}>&root=list-section}</li>
                </ul>
            </li>
<{if $isLogin}>
            <li class="flist">
                <span class="x-folder"><span class="toggler"></span><a href="javascript:void(0);">�ҵ��ղؼ�</a></span>
                <ul id="list-favor" class="x-child ajax"><li>{url:<{$base}>/flist.json?uid=<{$id}>&root=list-favor}</li></ul>
            </li>
<{/if}>
            <li class="clist">
                <span class="x-folder"><span class="toggler"></span><a href="javascript:void(0)">�������</a></span>
                <ul class="x-child" id="list-control">
            <{if $isLogin}>
                <{if !$isReg}>
                    <li class="leaf"><span class="text"><a href="<{$base}>/reg/form"><samp class="ico-pos-dot"></samp>��дע�ᵥ</a></span></li>
                <{/if}>
                    <li class="leaf"><span class="text"><a href="<{$base}>/user/info" ><samp class="ico-pos-dot"></samp>���������޸�</a></span></li>
                    <li class="leaf"><span class="text"><a href="<{$base}>/user/passwd" ><samp class="ico-pos-dot"></samp>�ǳ������޸�</a></span></li>
                    <li class="leaf"><span class="text"><a href="<{$base}>/user/custom" ><samp class="ico-pos-dot"></samp>�û��Զ������</a></span></li>
                    <li class="leaf"><span class="text"><a href="<{$base}>/friend" ><samp class="ico-pos-dot"></samp>����/������</a></span></li>
                    <li class="leaf"><span class="text"><a href="<{$base}>/fav" ><samp class="ico-pos-dot"></samp>�ղؼй���</a></span></li>
                    <li class="leaf"><span class="text"><a href="<{$base}>/forum/online" ><samp class="ico-pos-dot"></samp>�����û�</a></span></li>
            <{/if}>
                    <li class="leaf"><span class="text"><a href="<{$base}>/user/query" ><samp class="ico-pos-dot"></samp>��ѯ�û�</a></span></li>
                    <li class="leaf"><span class="text"><a href="<{$base}>/s" ><samp class="ico-pos-dot"></samp>��������</a></span></li>
                </ul>
            </li>
            <li><span class="x-leaf"><span class="toggler"></span><a href="<{$base}>/vote">ͶƱϵͳ</a></span></li>
            <li><span class="x-leaf"><span class="toggler"></span><a href="<{$base}>/elite/path">������</a></span></li>
            <li><span class="x-leaf"><span class="toggler"></span><a href="telnet://#">Telnet��¼</a></span></li>
            <li><span class="x-leaf x-search"><span class="toggler"></span><input type="text" class="input-text" value="����������" id="b_search"/></span></li>
        </ul>
    </nav>
    <!--nav list end-->

    <section id="adv">
    </section>
</aside>
<!--menu end-->
