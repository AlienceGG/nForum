        <div class="mbar">
            <ul>
                <li <{if $type=="section"}>class="selected"<{/if}>><a href="<{$base}>/widget/add?t=section">������</a></li>
                <li <{if $type=="board"}>class="selected"<{/if}>><a href="<{$base}>/widget/add?t=board">����</a></li>
                <li <{if $type=="favor"}>class="selected"<{/if}>><a href="<{$base}>/widget/add?t=favor">�ղؼ�</a></li>
                <li <{if $type=="ext"}>class="selected"<{/if}>><a href="<{$base}>/widget/add?t=ext">����Ӧ��</a></li>
            </ul>
        </div>
        <div class="b-content corner">
<{if isset($filter)}>
            <ul class="widget-add-filter">
<{foreach from=$filter item=item key=k}>
                <li class="tab-normal" id="filter_<{$k}>"><{$item}></li>
<{/foreach}>
            </ul>
<{/if}>
            <ul id="widget_add" class="corner">
            </ul>
<{if isset($search)}>
            <div class="widget-add-search"><span>����Ӧ��:&ensp;</span><input class="input-text" type="text" id="w_search_txt" value="����Ӧ������" /><input class="button" type="button" id="w_search_btn" value="��  ��" /></div>
<{/if}>
        </div>
<script id="tmpl_app" type="text/template">
                <li id="<%=wid%>" title="<%=title%>">
                    <h5 class="widget-add-title"><%=title%></h5>
                    <div class="widget-add-logo"><img src="<{$base}>/img/app/icon/<%=p%>.png" /></div>
                    <div class="widget-add-submit"><input type="button" class="submit" value="��ӵ���ҳ" /></div>
                </li>
</script>
<script id="tmpl_app_add" type="text/template">
    <form id="widget_add_form" action="<{$base}>/widget/set.json">
            <ul>
            <li><span>����:&ensp;</span><input type="text" size="20" class="input-text" value="<%=title%>" name="ti"/></li>
            <li><span>��ɫ:&ensp;</span><select id="color" name="co">
                    <{html_options options=$colors selected=$color}>
                </select>
            </li>
            <li>
                <span>��:&emsp;&ensp;</span><select name="c">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <{if $line3}>
                    <option value="3">3</option>
                    <{/if}>
                </select>
            </li>
            </ul>
            <input type="hidden" name="w" value="<%=wid%>" />
            <input type="hidden" name="t" value="0" />
            <input type="hidden" name="r" value="1" />
    </form>
</script>
