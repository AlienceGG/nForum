    	<div class="mbar corner">
        	<ul>
                <li><a href="<{$base}>/user/info">���������޸�</a></li>
                <li><a href="<{$base}>/user/passwd">�ǳ������޸�</a></li>
                <li><a href="<{$base}>/user/custom">�û��Զ������</a></li>
                <li><a href="<{$base}>/mail">�û��ż�</a></li>
                <li><a href="<{$base}>/refer">��������</a></li>
                <li><a href="<{$base}>/friend">�����б�</a></li>
                <li class="selected"><a href="<{$base}>/fav">�ղذ���</a></li>
            </ul>					
        </div>
        <div class="b-content corner">
			<div id="fav_op">
				<input id="fav_update" type="button" class="button" value="ˢ��" />
				<input id="fav_up" type="button" class="button" value="��һ��" />
			</div>
			<div id="fav_add">
				��Ӱ���:&ensp;<input type="text" id="fav_ab_txt" class="input-text" /><input type="button" id="fav_ab_btn"  class="button"value="����" />
                ���Ŀ¼:&ensp;<input type="text" id="fav_ad_txt" class="input-text"/><input type="button" id="fav_ad_btn"  class="button" value="����" />
			</div>
            <table class="board-list" cellpadding="0" cellspacing="0">
                <thead>
                <tr>
                    <th class="title_1">��������</th>
                    <th class="title_2">����</th>
                    <th class="title_3">��������</th>
                    <th class="title_4 middle">��������</th>
                    <th class="title_5 middle">��������</th>
                    <th class="title_6 middle">������</th>
                    <th class="title_7 middle">������</th>
                    <th class="title_8 middle">����</th>
            	</tr>
                </thead>
                <tbody id="fav_list"></tbody>
            </table>
    	</div>
<script id="tmpl_fav" type="text/template">
                <tr id="fav_item_<%=name%>">
                    <td class="title_1">
						<a href="<{$base}>/<%=type%>/<%=name%>"<%if(type=='fav'){%> class="fav-link"<%}%>><%=description%></a>
                    <%if(type!='fav'){%>
						<br /><%=name%>
                    <%}%>
					</td>
                    <td class="title_2">
                    <%if(type=='fav'){%>
                        [�Զ���Ŀ¼]
                    <%}else if(type=='section'){%>
                        [����Ŀ¼]
                    <%}else{%>
						<%=manager%>
                    <%}%>
					</td>
                    <td class="title_3">
                    <%if(last.id){%>
						<a href="<{$base}>/article/<%=name%>/<%=last.id%>"><%=last.title%></a><br />  
						�ظ�:&ensp;<a href="<{$base}>/user/query/<%=last.owner%>"><%=last.owner%></a> ����:&ensp;<%=last.date%>
                    <%}%>&nbsp;
					</td>
                    <td class="title_4 middle"><%=user_online_count%>&nbsp;</td>
                    <td class="title_5 middle"><%=post_today_count%>&nbsp;</td>
                    <td class="title_6 middle"><%=post_threads_count%>&nbsp;</td>
                    <td class="title_7 middle"><%=post_all_count%>&nbsp;</td>
                    <td class="title_8 middle"><a href="javascript:void(0)" class="fav-del" _ac="<%if(type=='fav'){%>dd<%}else{%>db<%}%>" _npos="<%=(position == -218)?name:position%>">ɾ��</a></td>
            	</tr>
</script>
