<script id="tmpl_upload_file" type="text/template">
<td><%=no%>.</td>
<td><%-name%>
<%if(status===plupload.QUEUED){%>
<span style="color:blue">(׼���ϴ�)</span>
<%}else if(status===plupload.UPLOADING){%>
<span style="color:blue">(<%=percent%>%)</span>
<%}else if(status===plupload.DONE){%>
<span style="color:green">(�ϴ��ɹ�)</span>
<%}else if(status===plupload.FAILED){%>
<span style="color:red">(�ϴ�ʧ��:<%=err%>)</span>
<%}%>
</td>
<td><%=$.sizeFormat(size)%></td>
<td><a href="javascript:void(0)">
<%if(status===plupload.DONE || status===plupload.XWNONE ){%>
ɾ��
<%}else{%>
<span style="color:blue">ȡ��</span>
<%}%></a></td>
</script>
