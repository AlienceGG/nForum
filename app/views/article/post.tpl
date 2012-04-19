	<{include file="s_nav.tpl" nav_left="������"}>
        <div class="b-content corner">
            <form action="<{$base}>/article/<{$bName}>/ajax_post.json" method="post" id="post_form" >
            <ul class="post-list">
            	<li class="post-list-item">
                	<div class="post-m">����:</div>
                    <input class="input-text post-title" type="text" name="subject" id="post_subject" value="<{$reTitle}>"/>
                </li>
<{if ($subject && $titKey && !empty($titKey))}>
                <li class="post-list-item">
                    <div class="post-m">�ؼ���(��ѡ):</div>
                    <ul class="post-tag">
<{foreach from=$titKey item=item}>
                    <li class="tab-normal"><{$item}></li>
<{/foreach}>
                    </ul>
                    <div class="clearfix"></div>
                </li>
<{/if}>
<{if ($isAtt)}>
            	<li class="upload post-list-item">
                	<div class="post-m">�ļ��ϴ�:</div>
                    <div id="upload">
                        <div id="upload_op">
                            <input id="upload_select" type="button" value="ѡ���ļ�" class="submit" />
                            <input id="upload_upload" type="button" value="�ϴ��ļ�" class="submit" />
                            <span id="upload_info">
                                ��������:<span class="upload-max-num"><{$maxNum}></span>
                                ��С����:<span class="upload-max-size"><{$maxSize}></span>
                                <span class="upload-msg"></span>
                            </span>
                        </div>
                        <table id="upload_result">
                            <thead>
                                <tr>
                                    <th style="width:40px;">���</td>
                                    <th>�ļ���</td>
                                    <th style="width:60px;">��С</td>
                                    <th style="width:60px;">����</td>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="4">��<span style="color:red" id="upload_num_count"></span>���ļ����ܴ�С<span style="color:red" id="upload_size_count"></span></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </li>
<{/if}>
            	<li class="post-list-item">
                	<div class="post-m">����:</div>
                    <div id="con_c_area">
                    	<textarea class="post-textarea" name="content" id="post_content"><{$reContent}></textarea>
                    </div>
                </li>
                <li class="post-list-item">
                	<div class="post-m">����:(<span>������ǩѡ�����</span>)</div>
                    <div id="em_img"></div>
                </li>
                <li class="post-list-item">
             		<div class="post-m">ѡ��:</div>
					<div class="post-op">ǩ����:
						<select name="signature" class="post-select" id="post_sig">
						<{html_options options=$sigOption selected=$sigNow}>
						</select>   
					</div>
                    <div class="post-op"><input type="checkbox" value="0" name="email" id="post_email" /><span>�лظ�ʱʹ���ʼ�֪ͨ��</span></div>
					<{if $anony}>
                    <span class="post-op"><input type="checkbox" checked="true" value="1" name="anony" id="post_anony"/><span>����</span></span>
					<{/if}>
					<{if $outgo}>
                    <span class="post-op"><input type="checkbox" checked="true" value="1" name="outgo" id="post_outgo"/><span>ת��</span></span>
					<{/if}>
                </li>
           </ul>
		   <input type="hidden" name="id" value="<{$reid|default:0}>" />
           <div class="post-su"><input type="submit" class="button" value="��������" /><input class="button" type="button" value="Ԥ��(�޸���)" id="post_preview" /></div>
           </form>
		   <form id="f_preview" action="<{$base}>/article/<{$bName}>/ajax_preview.json" method="post"></form>
    	</div>
<{include file="article/preview.tpl"}>
<{include file="article/upload.tpl"}>
