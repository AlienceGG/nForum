	<{include file="s_nav.tpl" nav_left="�༭����"}>
        <div class="b-content corner">
            <form action="<{$base}>/article/<{$bName}>/ajax_edit/<{$eid}>.json" method="post" id="post_form">
            <ul class="post-list">
            	<li class="post-list-item">
                	<div class="post-m">����:</div>
                    <input class="input-text post-title" type="text" name="subject" id="post_subject" value="<{$title}>"/>
                </li>
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
                    	<textarea class="post-textarea" name="content" id="post_content"><{$content}></textarea>
                    </div>
                </li>
                <li class="post-list-item">
                	<div class="post-m">����:(<span>������ǩѡ�����</span>)</div>
                    <div id="em_img"></div>
                </li>
           </ul>
           <div class="post-su"><input type="submit" class="button b-submit" value="�ύ" /><input class="button b-submit" type="button" value="Ԥ��(�޸���)" id="post_preview"/></div>
           </form>
		   <form id="f_preview" action="<{$base}>/article/<{$bName}>/ajax_preview.json" method="post"></form>
    	</div>
<{include file="article/preview.tpl"}>
<{include file="article/upload.tpl"}>
