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
	|<a href="<{$mbase}>/mail" accesskey="5">����<{if $mailInfo.full}>(��)<{elseif $mailInfo.newmail}>(��)<{/if}></a>
<{if false !== $newAt}>
	|<a href="<{$mbase}>/refer/at" accesskey="6">@��<{if $newAt>0}>(<{$newAt}>)<{/if}></a>
<{/if}>
<{if false !== $newReply}>
	|<a href="<{$mbase}>/refer/reply" accesskey="7">����<{if $newReply>0}>(<{$newReply}>)<{/if}></a>
<{/if}>
	|<a href="<{$mbase}>/friend/online" accesskey="8">����</a>
	|<a href="<{$mbase}>/user/logout" accesskey="9">ע��(<{$id}>)</a>
<{/if}>
	</div>
	<div class="logo sp">BYR-Team&copy;2010</div>
</div>
<script>
        window.scrollTo(0,0); 
</script> 
</body>
</html>
