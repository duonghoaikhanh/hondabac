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

	var $modules = "news";

	var $action = "ajax";


	function sMain ()

	{

		global $ttH;

		

		$ttH->func->load_language($this->modules);

		

		$fun = (isset($ttH->post['f'])) ? $ttH->post['f'] : '';


		flush();

		switch ($fun) {

			case "load_more_news":

				echo $this->load_more_news ();

				exit;

				break;
			default:

				echo '';

				exit;

				break;

		}

		

		exit;

	}

	/**
	 * load_more_news
	 * @return string
	 */
	function load_more_news ()
	{
		global $ttH;
		$start = (isset($ttH->post['start'])) ? $ttH->post['start'] : 6;
		$num_show = 6;
		$output = array(
			'ok' => 0,
			'mess' => $ttH->lang['news']['send_false'],
			'show' => 1
		);
		$output['content'] = $ttH->site->list_home_news($start,$num_show);
		$output['stop_more'] = $output['content']['stop_more'];
		$output['content'] = $output['content']['output'];
		$output['start'] = $start + $num_show;
		return json_encode($output);
	}

}

?>