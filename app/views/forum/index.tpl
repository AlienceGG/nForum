<{include file="header.tpl"}>
	<div id="columns">
<{if empty($widget)}>
<div class="no-widget corner">
    ��ʼ��Widget��������WidgetĬ�����ã�ȷ��Ĭ��Widget����Ч!
</div>
<{else}>
<{foreach from=$widget item=col key=kcol}>
        <ul id="column<{$kcol}>" class="column">
<{foreach from=$col item=row key=krow}>
            <li class="widget color-<{$row.color}>" id="<{$row.name}>">  
                <div class="widget-head">
                    <div class="widget-op" ></div>
                    <span class="widget-title"><a <{if !empty($row.url)}>target="_blank" href="<{$base}><{$row.url}><{else}>href="javascript:void(0);<{/if}>"><{$row.title}></a></span>
                </div>
                <div class="widget-content">
<{if isset($row.content)}><{$row.content}><{/if}>
                </div>
            </li>
<{/foreach}>
        </ul>
<{/foreach}>
<{/if}>
	</div>
<{include file="footer.tpl"}>
