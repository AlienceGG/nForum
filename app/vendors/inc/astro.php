<?php
/****************************************************
 * FileName: app/vendors/inc/astro.php
 * Author: xw <wei.xiao.bupt@gmail.com>
 *****************************************************/
/**
 * Astro model for nforum 
 * 
 * @author xw
 */
class Astro {
    public static function getAstro($month, $day){
        if (($month == 0) || ($day == 0) ){
            return array("name" => "δ֪", "file" => "");
        }  
        switch ($month){
            case 1:
                if ($day >= 21)  {
                    $ret = array("name" => "ˮƿ��", "file" => "");
                }else{
                    $ret = array("name" => "ħ����", "file" => "");
                }
                break;
            case 2:
                if ($day >= 20)  {
                    $ret = array("name" => "˫����", "file" => "");
                }else{
                    $ret = array("name" => "ˮƿ��", "file" => "");
                }
                break;
            case 3:
                if ($day >= 21)  {
                    $ret = array("name" => "������", "file" => "");
                }else{
                    $ret = array("name" => "˫����", "file" => "");
                }
                break;
            case 4:
                if ($day >= 21)  {
                    $ret = array("name" => "��ţ��", "file" => "");
                }else{
                    $ret = array("name" => "������", "file" => "");
                }
                break;
            case 5:
                if ($day >= 22)  {
                    $ret = array("name" => "˫����", "file" => "");
                }else{
                    $ret = array("name" => "��ţ��", "file" => "");
                }
                break;
            case 6:
                if ($day >= 22)  {
                    $ret = array("name" => "��з��", "file" => "");
                }else{
                    $ret = array("name" => "˫����", "file" => "");
                }   
                break;
            case 7:
                if ($day >= 23)  {
                    $ret = array("name" => "ʨ����", "file" => "");
                }else{
                    $ret = array("name" => "��з��", "file" => "");
                }   
                break;
            case 8:
                if ($day >= 24){
                    $ret = array("name" => "��Ů��", "file" => "");
                }else{
                    $ret = array("name" => "ʨ����", "file" => "");
                }
                break;
            case 9:
                if ($day >= 24)  {
                    $ret = array("name" => "�����", "file" => "");
                }else{
                    $ret = array("name" => "��Ů��", "file" => "");
                }
                break;
            case 10:
                if ($day >= 24){
                    $ret = array("name" => "��Ы��", "file" => "");
                }else{
                    $ret = array("name" => "�����", "file" => "");
                }
                break;
            case 11:
                if ($day >= 23)  {
                    $ret = array("name" => "������", "file" => "");
                }else{
                    $ret = array("name" => "��Ы��", "file" => "");
                }
                break;
            case 12:
                if ($day >= 22)  {
                    $ret = array("name" => "ħ����", "file" => "");
                }else{
                    $ret = array("name" => "������", "file" => "");
                }
                break;
            default:
                $ret = array("name" => "", "file" => "");
                break;
        }
        return $ret;
    }
}
?>
