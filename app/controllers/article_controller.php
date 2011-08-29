<?php
/**
 * Article controller for nforum
 *
 * @author xw
 */
App::import("vendor", array("model/section", "model/board", "model/threads", "inc/ubb"));
class ArticleController extends AppController {
    
    private $_threads;
    private $_board;

    public function beforeFilter(){
        parent::beforeFilter();
        $this->_init();
    }

    public function index(){
        $this->cache(false);
        $this->css[] = "ubb.css";
        $this->css[] = "article.css";
        $this->css[] = "ansi.css";
        $this->js[] = "forum.xubb.js";
        $this->js[] = "forum.share.js";
        $this->js[] = "forum.article.js";
        $this->_getNotice();
        $this->notice[] = array("url"=>"", "text"=>"�Ķ�����");

        App::import('Sanitize');
        App::import('vendor', array("inc/pagination", "inc/astro"));

        if(!isset($this->params['gid']) || $this->params['gid'] == '0')
            $this->error(ECode::$ARTICLE_NONE);
        try{
            $gid = $this->params['gid'];
            $this->_threads = Threads::getInstance($gid, $this->_board);
        }catch(ThreadsNullException $e){
            $this->error(ECode::$ARTICLE_NONE);
        }
        $p = isset($this->params['url']['p'])?$this->params['url']['p']:1;
        $pagination = new Pagination($this->_threads, Configure::read("pagination.article"));
        $articles = $pagination->getPage($p);

        $u = User::getInstance();
        $bm = $u->isBM($this->_board) || $u->isAdmin();
        $info = array();
        $curTime = strtotime(date("Y-m-d", time()));
        foreach($articles as $v){
            try{
                $own = User::getInstance($v->OWNER); 
                $astro = Astro::getAstro($own->birthmonth, $own->birthday);

                if($own->getCustom("userdefine0", 29) == 0){
                    $hide = true;
                    $gender = -1;
                }else{
                    $hide = false;
                    $gender = ($own->gender == "77")?0:1;
                }
                $user = array(
                    "id" => $own->userid,
                    "name" => Sanitize::html($own->username),
                    "gender" => $gender,
                    "furl" => Sanitize::html($own->getFace()),
                    "width" => ($own->userface_width === 0)?"":$own->userface_width,
                    "height" => ($own->userface_height === 0)?"":$own->userface_height,
                    "post" => $own->numposts,
                    "astro" => $astro['name'],
                    "online" => $own->isOnline(),
                    "level" => $own->getLevel(),
                    "time" => date(($curTime > $own->lastlogin)?"Y-m-d":"H:i:s", $own->lastlogin),
                    "first" => date("Y-m-d", $own->firstlogin),
                    "hide" => $hide
                );
            }catch(UserNullException $e){
                $user = false;
            }

            $content = $v->getHtml(true);
            //hard to match all the format of ip
            //$pattern = '/<font class="f[0-9]+">��( |&nbsp;)��Դ:��.+?\[FROM:( |&nbsp;)[0-9a-zA-Z.:*]+\]<\/font><font class="f000">( +<br \/>)+ +<\/font>/';
            //preg_match($pattern, $content, $match);
            //$content = preg_replace($pattern, "", $content);
            if(Configure::read("ubb.parse")){
                //remove ubb of nickname in first and title second line
                preg_match("'^(.*?<br \/>.*?<br \/>)'", $content, $res);
                $content = preg_replace("'(^.*?<br \/>.*?<br \/>)'", '', $content);
                $content = XUBB::remove($res[1]) . $content;
                $content = XUBB::parse($content);
            }
            $info[] = array(
                "id" => $v->ID,
                "owner" => $user,
                "op" => ($v->OWNER == $u->userid || $bm)?1:0,
                "pos" => $v->getPos(),
                "poster" => $v->OWNER,
                "content" => $content,
                "subject" => $v->isSubject()
                //"from" => isset($match[0])?preg_replace("/<br \/>/", "", $match[count($match)-1]):""
            );
        }
        $this->title = Sanitize::html($this->_threads->TITLE);
        $link = "?p=%page%";
        $pageBar = $pagination->getPageBar($p, $link);
        $this->set("bName", $this->_board->NAME);
        $this->set("gid", $gid);
        $this->set("anony", $this->_board->isAnony());
        $this->set("tmpl", $this->_board->isTmplPost());
        $this->set("info", $info);
        $this->set("pageBar", $pageBar);
        $this->set("title", $this->title);
        $this->set("totalNum", $this->_threads->getTotalNum());
        $this->set("curPage", $pagination->getCurPage());
        $this->set("totalPage", $pagination->getTotalPage());
        //for the quick reply, raw encode the space
        $this->set("reid", $this->_threads->ID);
        if(!strncmp($this->_threads->TITLE, "Re: ", 4))
            $reTitle = $this->_threads->TITLE;
        else
            $reTitle = "Re: " . $this->_threads->TITLE;
        $this->set("reTitle", rawurlencode($reTitle));
        //for default search day 
        $this->set("searchDay", Configure::read("search.day"));
        $this->set("searchDay", Configure::read("search.day"));
        $this->jsr[] = "var user_post=" . ($this->_board->hasPostPerm($u)?"true":"false") . ";";
    }

    public function post(){
        $this->_postInit();
        if($this->RequestHandler->isPost()){
            if(isset($this->params['form']['reid'])){
                $reID = intval($this->params['form']['reid']);
            }else{
                if($this->_board->isTmplPost()){
                    $this->redirect("/article/" . $this->_board->NAME . "/tmpl");
                }
                $reID = 0;
            }
            if(!isset($this->params['form']['subject']))
                $this->error(ECode::$POST_NOSUB);
            if(!isset($this->params['form']['content']))
                $this->error(ECode::$POST_NOCON);
            $subject = rawurldecode(trim($this->params['form']['subject']));
            if(strlen($subject) > 60)
                $subject = nforum_fix_gbk(substr($subject,0,60));
            $content = trim($this->params['form']['content']);
            $sig = User::getInstance()->signature;
            $email = 0;$anony = null;$outgo = 0;
            if(isset($this->params['form']['signature']))
                $sig = intval($this->params['form']['signature']);
            if(isset($this->params['form']['email']))
                $email = 1;
            if(isset($this->params['form']['anony']))
                $anony = 1;
            if(isset($this->params['form']['anony']))
                $outgo = 1;
            try{
                $id = Article::post($this->_board, $subject, $content, $sig, $reID, $email, $anony, $outgo);
                $gid = Article::getInstance($id, $this->_board);
                $gid = $gid->GROUPID;
            }catch(ArticlePostException $e){
                $this->error($e->getMessage());
            }catch(ArticleNullException $e){
                $this->error(ECode::$ARTICLE_NONE);
            }
            $this->waitDirect(
                array(
                    "text" => $this->_board->DESC, 
                    "url" => "/board/" . $this->_board->NAME
                ), ECode::$POST_OK, 
                array(array("text" => str_replace('Re: ', '', $subject), "url" => '/article/' .  $this->_board->NAME . '/' . $gid)
                    ,array("text" => Configure::read("site.name"), "url" => Configure::read("site.home"))
                ));
        }

        $this->js[] = "jquery-ui-1.8.7.pack.js";
        $this->js[] = "forum.xubb.js";
        $this->js[] = "forum.post.js";
        $this->css[] = "jquery-ui-1.8.7.css";
        $this->css[] = "post.css";
        $this->css[] = "ubb.css";
        $this->_getNotice();
        $this->notice[] = array("url"=>"", "text"=>"��������");

        $reTitle = $reContent = "";
        if(isset($this->params['id'])){
            $reID = $this->params['id'];
            try{
                $article = Article::getInstance($reID, $this->_board);
            }catch(ArticleNullException $e){
                $this->error(ECode::$ARTICLE_NONE);
            }
            $reContent = "\n".$article->getRef();
            //remove ref ubb tag
            $reContent = XUBB::remove($reContent);
            if(!strncmp($article->TITLE, "Re: ", 4))
                $reTitle = $article->TITLE;
            else
                $reTitle = "Re: " . $article->TITLE;
        }else{
            if($this->_board->isTmplPost()){
                $this->redirect("/article/" . $this->_board->NAME . "/tmpl");
            }
            $reID = 0;
        }
        $u = User::getInstance();
        $sigOption = array();
        foreach(range(0, $u->signum) as $v){
            if($v == 0)
                $sigOption["$v"] = "��ʹ��ǩ����";
            else
                $sigOption["$v"] = "ʹ�õ�{$v}��";
        }
        $sigOption["-1"] = "ʹ�����ǩ����";
        $this->set("bName", $this->_board->NAME);
        $this->set("anony", $this->_board->isAnony());
        $this->set("outgo", $this->_board->isOutgo());
        $this->set("isAtt", $this->_board->isAttach());
        $this->set("reTitle", $reTitle);
        $this->set("reContent", $reContent);
        $this->set("sigOption", $sigOption);
        $this->set("sigNow", $u->signature);
        $this->set("reID", $reID);
    }

    public function delete(){
        $u = User::getInstance();
        if(isset($this->params['id'])){
            try{
                $a = Article::getInstance(intval($this->params['id']), $this->_board);
                if(!$a->hasEditPerm($u))
                    $this->error(ECode::$ARTICLE_NODEL);
                if(!$a->delete())
                    $this->error(ECode::$ARTICLE_NODEL);
            }catch(ArticleNullException $e){
                $this->error(ECode::$ARTICLE_NONE);
            }
        }
        $this->waitDirect(
            array(
                "text" => $this->_board->DESC, 
                "url" => "/board/" . $this->_board->NAME
            ),ECode::$ARTICLE_DELOK,
            array(
                array("text" => Configure::read("site.name"), "url" => Configure::read("site.home"))
            ));

    }

    public function edit(){
        $this->_editInit();
        $id = $this->params['id'];
        if($this->RequestHandler->isPost()){
            if(!isset($this->params['form']['subject']))
                $this->error(ECode::$POST_NOSUB);
            if(!isset($this->params['form']['content']))
                $this->error(ECode::$POST_NOCON);
            $subject = trim($this->params['form']['subject']);
            if(strlen($subject) > 60)
                $subject = nforum_fix_gbk(substr($subject,0,60));
            $content = trim($this->params['form']['content']);
            $article = Article::getInstance($id, $this->_board);
            if(!$article->update($subject, $content))
                $this->error(ECode::$ARTICLE_EDITERROR);
            $this->waitDirect(
                array(
                    "text" => $this->_board->DESC, 
                    "url" => "/board/" . $this->_board->NAME
                ),ECode::$ARTICLE_EDITOK,
                array(array("text" => $subject, "url" => '/article/' .  $this->_board->NAME . '/' . $article->GROUPID)
                    ,array("text" => Configure::read("site.name"), "url" => Configure::read("site.home"))
                ));
        }

        $this->js[] = "jquery-ui-1.8.7.pack.js";
        $this->js[] = "forum.xubb.js";
        $this->js[] = "forum.post.js";
        $this->css[] = "jquery-ui-1.8.7.css";
        $this->css[] = "post.css";
        $this->css[] = "ubb.css";
        $this->_getNotice();
        $this->notice[] = array("url"=>"", "text"=>"�༭����");

        $article = Article::getInstance($id, $this->_board);
        App::import('Sanitize');
        $title = Sanitize::html($article->TITLE);
        $content = Sanitize::html($article->getContent());
        $this->set("bName", $this->_board->NAME);
        $this->set("isAtt", $this->_board->isAttach());
        $this->set("title", $title);
        $this->set("content", $content);
        $this->set("eid", $id);
    }

    public function preview(){
        $this->css[] = "article.css";
        $this->css[] = "ansi.css";
        $this->notice[] = array("url"=>"", "text"=>"����Ԥ��");
        App::import('Sanitize');
        if(!isset($this->params['form']['title']) || !isset($this->params['form']['content'])){
            $this->error();
        }

        $title = Sanitize::html($this->params['form']['title']);
        $content = preg_replace("/\n/", "<br />", Sanitize::html($this->params['form']['content']));
        if(Configure::read("ubb.parse"))
            $content = XUBB::parse($content);
        $this->set("title", $title);
        $this->set("content", $content);
    }

    public function tmpl(){
        $this->_postInit();
        App::import("vendor", "model/template");
        App::import('Sanitize');
        $this->css[] = "post.css";
        $this->_getNotice();
        $this->notice[] = array("url"=>"", "text"=>"ģ�淢��");

        $reid = 0;
        if(isset($this->params['url']['reid']))
            $reid = intval($this->params['url']['reid']);
        if(isset($this->params['id'])){
            $id = trim($this->params['id']);
            try{
                $t = Template::getInstance($id, $this->_board);
            }catch(TemplateNullException $e){
                $this->error(ECode::$TMPL_ERROR);
            }
            if($this->RequestHandler->isPost() ){
                if(isset($this->params['post']['reid']))
                    $reid = intval($this->params['post']['reid']);
                $val = $this->params['form']['q'];
                $pre = $t->getPreview($val);
                $title = $pre[0];
                $preview = $pre[1];
                $content = $pre[2];
                if($this->params['form']['pre'] == "0"){
                    $u = User::getInstance();
                    try{
                        Article::post($this->_board, $title, $content, $u->signature, $reid, 0);
                    }catch(ArticlePostException $e){
                        $this->error($e->getMessage());
                    }
                    $this->waitDirect(
                        array(
                            "text" => $this->_board->DESC, 
                            "url" => "/board/" . $this->_board->NAME
                        ), ECode::$POST_OK, 
                        array(
                            array("text" => Configure::read("site.name"), "url" => Configure::read("site.home"))
                        ));
                }else{
                    if(Configure::read("ubb.parse"))
                        $content = XUBB::parse($content);
                    $this->set("title", $title);
                    $this->set("content", $preview);
                    $this->set("reid", $reid);
                    array_pop($this->css);
                    $this->css[] = "article.css";
                    $this->css[] = "ansi.css";
                    $this->render("preview");
                }
            }else{
                $info = array();
                try{
                    foreach(range(0, $t->CONT_NUM - 1) as $i){
                        $q = $t->getQ($i);
                        $info[$i] = array("text" => Sanitize::html($q['TEXT']), "len"=>$q['LENGTH']);
                    }
                }catch(TemplateQNullException $e){
                    $this->error();
                }
                $this->set("info", $info);
                $this->set("num", $t->NUM);
                $this->set("tmplTitle", Sanitize::html($t->TITLE));
                $this->set("title", $t->TITLE_TMPL);
                $this->set("reid", $reid);
                $this->render("tmpl_que");
            }
        }else{
            try{
                $page = new Pagination(Template::getTemplates($this->_board));
            }catch(TemplateNullException $e){
                $this->error(ECode::$TMPL_ERROR);
            }
            $info = $page->getPage(1);

            foreach($info as &$v){
                $v = array("name" => Sanitize::html($v->TITLE), "num" => $v->CONT_NUM);
            }
            $this->set("info", $info);
            $this->set("bName", $this->_board->NAME);
            $this->set("reid", $reid);
        }
    }

    private function _init(){
        if(!isset($this->params['name'])){
            $this->error(ECode::$BOARD_NONE);
        }

        try{
            $boardName = $this->params['name'];
            if(preg_match("/^\d+$/", $boardName))
                throw new BoardNullException();
            $this->_board = Board::getInstance($boardName);
        }catch(BoardNullException $e){
            $this->error(ECode::$BOARD_UNKNOW);
        }

        if(!$this->_board->hasReadPerm(User::getInstance())){
            if(!$this->ByrSession->isLogin)
                $this->requestLogin();
            $this->error(ECode::$BOARD_NOPERM);
        }
        $this->_board->setOnBoard();
        $this->ByrSession->Cookie->write("XWJOKE", "hoho", false);
    }

    private function _postInit(){
        if($this->_board->isReadOnly()){
            $this->error(ECode::$BOARD_READONLY);
        }
        if(!$this->_board->hasPostPerm(User::getInstance())){
            $this->error(ECode::$BOARD_NOPOST);
        }
        if(isset($this->params['form']['reid']))
            $reID = intval($this->params['form']['reid']);
        else if(isset($this->params['url']['reid']))
            $reID = intval($this->params['url']['reid']);
        else
            return;
        if($reID == 0)
            return;
        if($this->_board->isNoReply())
            $this->error(ECode::$BOARD_NOREPLY);
        try{
            $reArticle = Article::getInstance($reID, $this->_board);
        }catch(ArticleNullException $e){
            $this->error(ECode::$ARTICLE_NOREID);
        }
        if($reArticle->isNoRe())
            $this->error(ECode::$ARTICLE_NOREPLY);
    }

    private function _editInit(){
        if($this->_board->isReadOnly()){
            $this->error(ECode::$BOARD_READONLY);
        }
        if(!$this->_board->hasPostPerm(User::getInstance())){
            $this->error(ECode::$BOARD_NOPOST);
        }
        if(!isset($this->params['id']))
            $this->error(ECode::$ARTICLE_NONE);
        $id = intval($this->params['id']);
        try{
            $article = Article::getInstance($id, $this->_board);
        }catch(ArticleNullException $e){
            $this->error(ECode::$ARTICLE_NONE);
        }
        $u = User::getInstance();
        if(!$article->hasEditPerm($u))
            $this->error(ECode::$ARTICLE_NOEDIT);
    }

    private function _getNotice(){
        $root = Configure::read("section.{$this->_board->SECNUM}");
        $this->notice[] = array("url"=>"/section/{$this->_board->SECNUM}", "text"=>$root[0]);
        $boards = array(); $tmp = $this->_board;
        while(!is_null($tmp = $tmp->getDir())){
            $boards[] = array("url"=>"/section/{$tmp->NAME}", "text"=>$tmp->DESC);
        }
        foreach($boards as $v)
            $this->notice[] = $v;
        $this->notice[] = array("url"=>"/board/{$this->_board->NAME}", "text"=>$this->_board->DESC);
    }
}
?>
