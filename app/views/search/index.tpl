	<{include file="s_nav.tpl" nav_left="��������"}>
        <div class="b-content corner">
			<form action="<{$base}>/s/article" method="get" id="search_form">
        	<div class="search">
            	<ul>
                    <li>
					<span>ѡ�����:</span>
					<select id="search_section">
					<{html_options options=$sec selected=$selected }>
					</select>&emsp;<span>ѡ�����:</span>
					<select name="b" id="search_board">
					</select>
					</li>
                    <li><span>���⺬��:</span><input class="input-text input" type="text" name="t1"/><span>AND</span><input class="input-text input" type="text" name="t2"/></li>
                    <li><span>���ⲻ��:</span><input class="input-text input" type="text" name="tn"/></li>
                    <li><span>�����˺�:</span><input class="input-text input" type="text" name="au"/></li>
                    <li><span>���ظ�:</span><input class="input-text input input-day" type="text" name="d" value="<{$searchDay}>"/><span>������</span></li>
                    <li class="search-option">
						<input class="input-check" type="checkbox" name="m" /><span>��������</span>
                        <input class="input-check" type="checkbox" name="a"/><span>����������</span>
                        <{if $site && $isAdmin}>
                        <input class="input-check" type="checkbox" name="f"/><span>ȫվ����</span>
                        <{/if}>
                    </li>
            	</ul>
				<div class="b-search">
                <input class="button" type="submit" value="��ѯ����" />
				</div>
        	</div>
			</form>
		</div>
