<?php
load("model/iwidget");

class toptenWidget extends WidgetAdapter{

    protected $_file;
    public function __construct(){
        $this->_file = BBS_HOME . '/xml/day.xml';
    }
    public function wGetTitle(){ return array("text"=>"ʮ�����Ż���", "url"=>""); }
    public function wGetTime(){
        if (!file_exists($this->_file)) {
            return time();
        }
        return filemtime($this->_file);
    }
    public function wGetList(){
        if (!file_exists($this->_file)) {
            return $this->_error('ʮ�����Ż��ⲻ����');
        }
        $ret = array();
        $xml = simplexml_load_file($this->_file);
        if($xml === false)
            return $this->_error('ʮ�����Ż��ⲻ����');
        foreach($xml->hotsubject as $v){
            $title = nforum_fix_gbk(urldecode($v->title));
            $board = ($v->o_board=="")?$v->board:$v->o_board;
            $id = ($v->o_groupid==0)?$v->groupid:$v->o_groupid;
            $ret[] = array("text" => $title . "(<span style=\"color:red\">" . $v->number . "</span>)", "url"=> "/article/" . rawurldecode($board) . "/" . $id);
        }
        if(empty($ret))
            return $this->_error('ʮ�����Ż��ⲻ����');
        return array("s"=>parent::$S_LINE, "v"=>$ret);
    }
}
