<{include file="header.tpl"}>
	<{include file="s_nav.tpl" nav_left="ģ�巢��"}>
        <div class="b-content corner">
		<div class="tmpl">
			<table class="m-table">
			<tr>
				<th class="col1">���</th>
				<th class="col2">���� </th>
				<th class="col3">�������</th>
				<th class="col4">����</th>
			</tr>
<{if empty($info)}>
			<tr>
				<td colspan="4">�ð���û���κ�ģ��</td>
			</tr>
<{else}>
<{foreach from=$info item=item key=k}>
			<tr>
				<td><{$k+1}></td>
				<td><{$item.name}></td>
				<td><{$item.num}></td>
				<td><a href="<{$base}>/article/<{$bName}>/tmpl/<{$k+1}>">��Ҫ����</a></td>
			</tr>
<{/foreach}>
<{/if}>
			</table>
		</div>
    	</div>
<{include file="footer.tpl"}>
