    <{include file="s_nav.tpl" nav_left="����ͶƱ"}>
        <div class="b-content corner">
        <div class="vote" style="padding:10px;">
            <table class="m-table" style="text-align:center">
            <tr>
                <th style="width:30px">���</th>
                <th style="width:60px">����</th>
                <th style="width:auto">���� </th>
                <th style="width:150px">����ʱ��</th>
                <th style="width:60px">����ʱ��</th>
                <th style="width:60px">����</th>
            </tr>
<{if empty($info)}>
            <tr>
                <td colspan="6">�ð���û���κ�ģ��</td>
            </tr>
<{else}>
<{foreach from=$info item=item key=k}>
            <tr>
                <td><{$k+1}></td>
                <td><{$item.type}></td>
                <td><{$item.title}></td>
                <td><{$item.start}></td>
                <td><{$item.day}></td>
                <td><a href="<{$base}>/board/<{$bName}>/vote/<{$k+1}>">��ҪͶƱ</a></td>
            </tr>
<{/foreach}>
<{/if}>
            </table>
        </div>
        </div>
