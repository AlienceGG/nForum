	<{include file="s_nav.tpl" nav_left="ģ�巢��"}>
	<div class="b-content corner">
	<div class="tmpl">
		<form action="<{$base}>/article/<{$bName}>/ajax_tmpl.json" method="post" id="f_tmpl">
		<table class="m-table que">
            <tr>
                <th class="col5">ģ��<{$num}></th>
                <td class="col6"><{$tmplTitle}></td>
            </tr>
            <tr>
                <th>����</th>
                <td><{$title|default:"<input type=\"text\" name=\"q[0]\" class=\"input-text\" style=\"width:90%\" id=\"tmpl_subject\" />"}></td>
            </tr>
<{foreach from=$info item=item key=k}>
            <tr>
                <th>����<{$k+1}>:<{$item.text}>(����:<{$item.len}>)</th>
                <td><textarea name="q[<{$k+1}>]" style="width:90%"></textarea></td>
			</tr>
<{/foreach}>
			<tr class="tmpl-op">
				<td colspan="2">
                <input type="submit" class="button" value="�ύ����" />
                <input type="button" class="button" value="Ԥ��" id="que_preview"/>
                <input type="button" class="button" value="����" onclick="history.go(-1)"/>
                <input type="hidden" value="0" name="pre"/>
                </td>
			</tr>
			</table>
            <input type="hidden" name="id" value="<{$reid|default:0}>" />
            <input type="hidden" name="tmplid" value="<{$tmplId}>" />
        </form>
    </div>
    </div>
<{include file="article/preview.tpl"}>
