        <div class="mbar corner">
            <ul>
                <li><a href="<{$base}>/user/info">�û�����</a></li>
                <li><a href="<{$base}>/mail">�û��ż�</a></li>
                <li><a href="<{$base}>/refer">��������</a></li>
                <li class="selected"><a href="<{$base}>/friend">����/������</a></li>
                <li><a href="<{$base}>/fav">�ղذ���</a></li>
            </ul>
        </div>
        <div class="c-mbar">
            <ul>
                <li><a href="<{$base}>/friend"><samp class="ico-pos-dot"></samp>�ҵĺ���</a></li>
                <li><a href="<{$base}>/friend/online"><samp class="ico-pos-dot"></samp>���ߺ���</a></li>
                <li><a href="<{$base}>/forum/online"><samp class="ico-pos-dot"></samp>�����û�</a></li>
                <li><a href="<{$base}>/blacklist" class="select"><samp class="ico-pos-dot"></samp>������</a></li>
            </ul>
        </div>
        <div class="b-content">
            <div>
                <form method="get" action="<{$base}>/blacklist/ajax_add.json" id="bl_add" class="f-user-add">
                    ��Ӻ������û�:<input type="text" class="input-text" name="id" value="" />
                    <input type="submit" class="button" value="���" />
                </form>
                <div class="t-pre">
                    <div class="t-btn">
                        <input type="checkbox" class="user-select" />
                        <input type="button" class="button user-del" value="ɾ��" />
                    </div>
                    <div class="page">
                        <{include file="pagination.tpl" page_name='�û�����'}>
                    </div>
                </div>
            <form action="<{$base}>/blacklist/ajax_delete.json" method="post" class="f-user-delete">
                <table class="m-table">
<{if isset($blacklist)}>
<{foreach from=$blacklist item=item}>
                    <tr>
                        <td class="title_1"><input type="checkbox" name="f_<{$item.bid}>" class="user-item"/></td>
                        <td class="title_2"><a href="<{$base}>/user/query/<{$item.bid}>"><{$item.bid}></a></td>
                        <td>&nbsp;</td>
                    </tr>
<{/foreach}>
<{else}>
                    <tr>
                        <td colspan="3" style="text-align:center">û���κ��û�</td>
                    </tr>
<{/if}>
                </table>
            </form>
            <div class="t-pre-bottom">
                <div class="t-btn">
                        <input type="checkbox" class="user-select" />
                        <input type="button" class="button user-del" value="ɾ��" />
                </div>
                <div class="page">
                    <{include file="pagination.tpl" page_name='��������'}>
                </div>
             </div>
            </div>
        </div>
