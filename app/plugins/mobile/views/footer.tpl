	<div class="sec sp">
<form action="<{$mbase}>/go" method="get">
	<span class="f">ѡ��������</span><br /><input type="text" name="name" />&nbsp;<input type="submit" value="GO" class="btn" />
</form>
	</div>
	</div>
	<div class="menu nav">
	<a href="<{$mbase}>/" accesskey="0">��ҳ</a>
	|<a href="<{$mbase}>/section" accesskey="2">����</a>
	|<a href="<{$mbase}>/hot" accesskey="3">����</a>
<{if $islogin}>
	|<a href="<{$mbase}>/favor" accesskey="4">�ղ�</a>
	|<a href="<{$mbase}>/mail" accesskey="5">����<{if $newNum != 0}>(<{$newNum}>��)<{/if}></a>
	|<a href="<{$mbase}>/friend/online" accesskey="6">����</a>
	|<a href="<{$mbase}>/user/logout" accesskey="7">ע��(<{$id}>)</a>
<{/if}>
	</div>
	<div class="logo sp">BYR-Team&copy;2010</div>
</div>
</body>
</html>

