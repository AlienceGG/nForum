<?php
/**
 * exif component for nforum 
 * @author xw       
 */
class ExifComponent extends Object {    
    public function initialize(&$controller) {
        $this->controller = $controller;
    }

    public function format($file){
        $info = $this->getInfo($file);
        if($info === false)
            return false;
        return '��������Ϣ��'.$this->_format($info[1]).$this->_format($info[14]).$this->_format($info[8]).'\n'.
            '�����������'.$this->_format($info[3]).$this->_format($info[13]).$this->_format($info[4]).$this->_format($info[5]).'\n';
    }

    public function getInfo($file){
        @$exif = exif_read_data($file,"IFD0"); 
        if($exif === false){
            return false;
        }
        $exif = exif_read_data($file, 0, true);
        if(isset($exif['EXIF']['ExposureTime'])){
            $expTime = split("/", $exif['EXIF']['ExposureTime']);
            if(intval($expTime[1]) >= intval($expTime[0])*10)
                $expTime = "1/" . intval($expTime[1])/intval($expTime[0]) . "s";
            else
                $expTime = intval($expTime[0])/intval($expTime[1]) . "s";
        }
        if(isset($exif['EXIF']['ExposureBiasValue'])){
            $expbv = split("/", $exif['EXIF']['ExposureBiasValue']);
            $expbv = sprintf("%.2f", intval($expbv[0])/intval($expbv[1]))."EV";
        }
        if(isset($exif['EXIF']['FocalLength'])){
            $flen = split("/", $exif['EXIF']['FocalLength']);
            $flen = intval($flen[0])/intval($flen[1]) . "mm";
        }
        @$ret = array(
            array("������" , $exif['IFD0']['Make']), 
            array("�ͺ�" , $exif['IFD0']['Model']), 
            array("����" , date("Y-m-d H:i:s"),$exif['FILE']['FileDateTime']),
            array("��С" , $exif['COMPUTED']['Width']."*".$exif['COMPUTED']['Height']),
            array("��Ȧֵ" , $exif['COMPUTED']['ApertureFNumber']), 
            array("�ع�ʱ��" , $expTime), 
            array("���ģʽ" , $this->_infoMap($exif['EXIF']['MeteringMode'],$this->_MeteringMode_arr)), 
            array("��Դ" , $this->_infoMap($exif['EXIF']['LightSource'], $this->_Lightsource_arr)), 
            array("�����" , $this->_infoMap($exif['EXIF']['Flash'], $this->_Flash_arr)), 
            array("�ع�ģʽ" , ($exif['EXIF']['ExposureMode']==1?"�ֶ�":"�Զ�")), 
            array("��ƽ��" , ($exif['EXIF']['WhiteBalance']==1?"�ֶ�":"�Զ�")), 
            array("�ع����" , $this->_infoMap($exif['EXIF']['ExposureProgram'], $this->_ExposureProgram)),
            array("�عⲹ��" , $expbv), 
            array("ISO�й��" , $exif['EXIF']['ISOSpeedRatings']), 
            array("����" , $flen), 
            array("�������" , $exif['IFD0']['Software']) 
        );
        return $ret;

    }

    private function _format($item){
        if(!is_array($item) || empty($item[1]))
            return "";
        return '['.$item[0].']'.$item[1]." ";
    }

    private function _infoMap($key, $arr){
        if(array_key_exists($key, $arr))
            return $arr[$key];
        return "δ֪";
    }

    private $_MeteringMode_arr = array( "0" => "δ֪", "1" => "ƽ��", "2" => "�����ص�ƽ�����", "3" => "���", "4" => "����", "5" => "����", "6" => "�ֲ�", "255" => "����" ); 
    private $_Lightsource_arr = array( "0" => "δ֪", "1" => "�չ�", "2" => "ӫ���", "3" => "��˿��", "10" => "�����", "17" => "��׼�ƹ�A", "18" => "��׼�ƹ�B", "19" => "��׼�ƹ�C", "20" => "D55", "21" => "D65", "22" => "D75", "255" => "����" ); 
    private $_Flash_arr = array( "0" => "��", "1" => "��", "2" => "��", "5" => "flash fired but strobe return light not detected", "6" => "��", "7" => "flash fired and strobe return light detected", "16"=>"��"); 
    private $_ExposureProgram = array("δ����", "�ֶ�", "��׼����", "��Ȧ����", "��������", "��������", "�˶�ģʽ", "Ф��ģʽ", "�羰ģʽ"); 
}
