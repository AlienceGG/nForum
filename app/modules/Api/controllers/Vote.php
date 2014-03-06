<?php
load("vote.vote");
class VoteController extends NF_ApiController {

    protected $_method = array('get' => array('index'), 'post' => array('index'));

    public function init(){
        parent::init();
        if(!in_array('vote', c('modules.install')))
            $this->error("δ��װͶƱ���");
    }

    public function indexAction(){
        $id = intval($this->params['id']);
        try{
            $vote = new Vote($id);
        }catch(VoteNullException $e){
            $this->error("δ֪��ͶƱ");
        }
        $u = User::getInstance();
        if($this->getRequest()->isPost()){
            $this->requestLogin();
            if($vote->isDeleted())
                $this->error("��ͶƱ��ɾ��");
            if($vote->isEnd())
                $this->error("��ͶƱ�ѽ�ֹ");
            if($vote->getResult($u->userid) !== false)
                $this->error("���Ѿ�Ͷ��Ʊ��");
            if(!isset($this->params['form']['vote']))
                $this->error("δ֪�Ĳ���");

            if($vote->type == "0"){
                $viid = intval($this->params['form']['vote']);
                if(!$vote->hasItem($viid))
                    $this->error("δ֪��ѡ�ͶƱʧ��");
                $vote->vote($u->userid, $viid);
            }else if($vote->type == "1"){
                $items = array_values((array)$this->params['form']['vote']);
                if(count($items) == 0)
                    $this->error("������ѡ��һ��ѡ��");
                if(count($items) > $vote->limit && $vote->limit != 0)
                    $this->error("ͶƱ�����������ƣ�ͶƱʧ��");
                foreach($items as $v){
                    if(!$vote->hasItem(intval($v)))
                        $this->error("δ֪��ѡ�ͶƱʧ��");
                }
                $vote->vote($u->userid, $items);
            }else{
                $this->error("�����ͶƱ");
            }
        }
        if($vote->isDeleted() && !$u->isAdmin())
            $this->error("��ͶƱ��ɾ��");
        $wrapper = Wrapper::getInstance();
        $data['vote'] = $wrapper->vote($vote, array('items'=>true));
        $this->set('data', $data);
    }

    public function categoryAction(){
        $category = $this->params['id'];
        $params = array();
        $time = time();
        $yes = $time - 86400;
        $u = User::getInstance();
        switch($category){
            case 'hot':
                $sql = "select * from pl_vote where status=1 and end>? order by num desc, vid desc";
                $params = array($yes);
                break;
            case 'me':
            case 'list':
                if($category === 'me')
                    $user = $u->userid;
                else
                    @$user = trim($this->params['url']['u']);
                $sql = "select * from pl_vote where status=1 and uid=? order by vid desc";
                $params = array($user);
                break;
            case 'all':
                $sql = "select * from pl_vote where status=1 order by vid desc";
                break;
            case 'join':
                $this->requestLogin();
                $sql = "select * from pl_vote where status=1 and vid in (select vid from pl_vote_result where uid=?) order by vid desc";
                $params = array($u->userid);
                break;
            case 'delete':
                if(!$u->isAdmin())
                    $this->error('����Ȩ�鿴����ͶƱ');
                $sql = "select * from pl_vote where status=0 order by vid desc";
                break;
            case 'new':
                $category = "new";
                $sql = "select * from pl_vote where status=1 and end>? order by vid desc";
                $params = array($yes);
                break;
            default:
                $this->error('��������');
        }
        $list = new VoteList($sql, $params);
        load('inc/pagination');

        $count = isset($this->params['url']['count'])?$this->params['url']['count']:10;
        $page = isset($this->params['url']['page'])?$this->params['url']['page']:1;
        if(($count = intval($count)) <= 0)
            $count = 10;
        if($count > c('modules.api.page_item_limit'))
            $count = c('modules.api.page_item_limit');
        $page = intval($page);
        $pagination = new Pagination($list, $count);
        $votes = $pagination->getPage($page);

        $wrapper = Wrapper::getInstance();
        $data = array();
        $data['pagination'] = $wrapper->page($pagination);
        $data['votes'] = array();
        foreach($votes as $v){
            $data['votes'][] = $wrapper->vote($v);
        }

        $this->set('data', $data);
        $this->set('root', 'list');
    }
}
