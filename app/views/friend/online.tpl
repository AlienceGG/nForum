<{include file="header.tpl"}>
    	<div class="mbar corner">
        	<ul>
                <li><a href="<{$base}>/user/info">���������޸�</a></li>
                <li><a href="<{$base}>/user/passwd">�ǳ������޸�</a></li>
                <li><a href="<{$base}>/user/custom">�û��Զ������</a></li>
                <li><a href="<{$base}>/mail">�û��ż�����</a></li>
                <li class="selected"><a href="<{$base}>/friend">�����б�</a></li>
                <li><a href="<{$base}>/fav">�ղذ������</a></li>
            </ul>					
        </div>
        <div class="c-mbar">
			<ul>
            	<li><a href="<{$base}>/friend"><samp class="ico-pos-dot"></samp>�ҵĺ���</a></li>
                <li><a href="<{$base}>/friend/online" class="select"><samp class="ico-pos-dot"></samp>���ߺ���</a></li>
                <li><a href="<{$base}>/online"><samp class="ico-pos-dot"></samp>�����û�</a></li>
            </ul>
        </div>
        <div class="b-content">
            <div class="mail-list">
                <table class="m-table">
                	<tr class="title">
						<td class="title_7">���</td>
						<td class="title_2">ID</td>
                        <td class="title_3">״̬</td>
                        <td class="title_5">��½IP</td>
                        <td class="title_6">����</td>
                        <td class="title_6">����</td>
                    </tr>
<{if isset($friends)}>
<{foreach from=$friends item=item key=k}>
                	<tr>
						<td class="title_7"><{$k+1}></td>
						<td class="title_2"><a href="<{$base}>/user/query/<{$item.fid}>"><{$item.fid}></a></td>
                        <td class="title_3"><{$item.mode}></td>
                        <td class="title_5"><{$item.from}></td>
                        <td class="title_6"><{$item.idle}></td>
                        <td class="title_6"><a href="<{$base}>/mail/send?id=<{$item.fid}>">�����ʺ�</a></td>
                    </tr>
<{/foreach}>
<{else}>
					<tr>
						<td colspan="6" style="text-align:center">��û���κκ���</td>
					</tr>
<{/if}>
                </table>
            </div>
    	</div>
<{include file="footer.tpl"}>
