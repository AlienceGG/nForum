<script id="tmpl_forward" type="text/template">
<form id="a_forward" action="<%=action%>" method="post">
	<ul>
	<li><span>�ռ���:</span><input type="text" class="input-text" name="target"/>
        <select id="a_forward_list">
            <option value="">ѡ�����</option>
        <%_.each(friends,function(f){%>
            <option value="<%=f%>"><%=f%></option>
        <%});%>
        </select>
    </li>
	<li><span>�ϼ�ת��:</span><input type="checkbox" name="threads" />
    &emsp;&emsp;<span>�ϼ�������:</span><input type="checkbox" name="noref" />
    </li>
	<li><span>��������:</span><input type="checkbox" name="noatt" /></li>
</form>
</script>
