<{include file="header.tpl"}>
    	<div class="mbar">
        	<ul>
                <li><a href="<{$base}>/user/info">���������޸�</a></li>
                <li class="selected"><a href="<{$base}>/user/passwd">�ǳ������޸�</a></li>
                <li><a href="<{$base}>/user/custom">�û��Զ������</a></li>
                <li><a href="<{$base}>/mail">�û��ż�����</a></li>
                <li><a href="<{$base}>/friend">�����б�</a></li>
                <li><a href="<{$base}>/fav">�ղذ������</a></li>
            </ul>					
        </div>
        <div class="b-content corner">
        	<div id="c_content" class="corner">
                <h6>�ǳ��޸�</h6>
                <form method="post" action="">
                <ul>
                    <li><span class="b-left-m">�����ǳƣ�</span><input class="input-text" type="text" name="name" value="<{$name}>" size="30"/></span></li>
                </ul>
                <div class="b-op b-nc-change">
					<input type="submit" class="button" value="�ύ�޸�" />
					<input class="button" type="reset" value="��д" />
				</div>
                </form>
                <h6>�����޸�</h6>
                <form method="post" action="" id="p_submit">
                <ul>
                    <li><span class="b-left-m">������ȷ�ϣ�</span><input class="input-text" type="password" name="pold"/><span class="b-right-m">���뵱ǰ����</span></li>
                    <li><span class="b-left-m">�����룺</span><input class="input-text" type="password"  id="p_new1" name="pnew1"/><span class="b-right-m">����������</span></li>
                    <li><span class="b-left-m">������ȷ�ϣ�</span><input class="input-text" type="password" id="p_new2" name="pnew2" /><span class="b-right-m">��������������</span></li>
                </ul>
                <div class="b-op b-nc-change">
					<input type="submit" class="button" value="�ύ�޸�"/>
					<input class="button" type="reset" value="��д" />
				</div>
                </form>
            </div>
    	</div>
<{include file="footer.tpl"}>
