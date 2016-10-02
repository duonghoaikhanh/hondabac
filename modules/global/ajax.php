<?php



/*================================================================================*\

Name code : view.php

Copyright © 2015  by Phan Van Lien

@version : 1.0

@date upgrade : 01/01/2015 by Phan Van Lien

\*================================================================================*/



if (! defined('IN_ttH')) {

  die('Access denied');

}

$nts = new sMain();



class sMain

{

	var $modules = "user";

	var $action = "ajax";

	

	/**

	* function sMain ()

	* Khoi tao 

	**/

	function sMain ()

	{

		global $ttH;

		

		$ttH->func->load_language($this->modules);

		

		$fun = (isset($ttH->input['f'])) ? $ttH->input['f'] : '';



		switch ($fun) {

			case "captcha":

				$this->do_captcha ();

				exit;

				break;
			case "comment":

				$this->do_comment ();

				exit;

				break;

			default:

				flush();

				echo '';

				exit;

				break;

		}

		

		exit;

	}

	

	function do_captcha ()

	{

		global $ttH;

		

		Captcha::pic();

	}
	function do_comment(){

		global $ttH;
		$parent = (isset($ttH->input['parent'])) ? $ttH->input['parent'] : "";
		$table = (isset($ttH->input['table'])) ? $ttH->input['table'] : "";
		$table_id = (isset($ttH->input['table_id'])) ? $ttH->input['table_id'] : "";
		$content = (isset($ttH->input['content'])) ? $ttH->input['content'] : "";
		$email = (isset($ttH->input['email'])) ? $ttH->input['email'] : "";
		$full_name = (isset($ttH->input['full_name'])) ? $ttH->input['full_name'] : "";
		
		$arr_info = array(
			'full_name'=> $full_name,
			'email' => $email
		);
		$arr_info = json_encode($arr_info);

		$sql = "insert into `comment`(`parent`,`table`,`table_id`,`content`,`info_customer`,`lang`,`date_create`,`date_update`)
				values(".$parent.",'".$table."','".$table_id."','".$content."','".$arr_info."','".$ttH->conf['lang_cur']."',".time().",".time().")";
		$ok = $ttH->db->query($sql);

		$data= array(
			'status'=>$ok,
		);
		if($ok){
			$data['mess'] = $ttH->lang['global']['comment_success'];
		}else{
			$data['mess'] = $ttH->lang['global']['comment_fail'];
		}
		echo json_encode($data);
	}

		

  // end class

}

?>