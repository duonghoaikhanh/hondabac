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
	var $action = "promotion";
	var $sub = "manage";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		
		if($ttH->site_func->check_user_login() != 1) {
			$url = $ttH->func->base64_encode($_SERVER['REQUEST_URI']);
			$url = (!empty($url)) ? '/?url='.$url : '';
			
			$link_go = $ttH->site->get_link ($this->modules, $ttH->setting[$this->modules]["signin_link"]).$url;
			$ttH->html->redirect_rel($link_go);
		}
		
		$ttH->func->load_language($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->modules.".tpl");
		$ttH->temp_act->assign('CONF', $ttH->conf);
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		$ttH->func->include_css ($ttH->dir_css.$this->modules.'/'.$this->modules.'.css');
		
		$ttH->conf['menu_action'] = array($this->modules);
		$ttH->data['link_lang'] = (isset($ttH->data['link_lang'])) ? $ttH->data['link_lang'] : array();
		
		include ($this->modules."_func.php");
		
		$data = array();
		//Make link lang
		foreach($ttH->data['lang'] as $row_lang) {
			$ttH->data['link_lang'][$row_lang['name']] = $ttH->site->get_link_lang ($row_lang['name'], $this->modules);
		}
		//End Make link lang
		
		//SEO
		$ttH->site->get_seo (array(
			'meta_title' => (isset($ttH->setting[$this->modules][$this->action."_meta_title"])) ? $ttH->setting[$this->modules][$this->action."_meta_title"] : '',
			'meta_key' => (isset($ttH->setting[$this->modules][$this->action."_meta_key"])) ? $ttH->setting[$this->modules][$this->action."_meta_key"] : '',
			'meta_desc' => (isset($ttH->setting[$this->modules][$this->action."_meta_desc"])) ? $ttH->setting[$this->modules][$this->action."_meta_desc"] : ''
		));
		$ttH->conf["cur_group"] = 0;
		
		$data = array();
		$data['content'] = $this->do_manage();
		$data['box_left'] = box_left($this->action);
		//$data['box_column'] = box_column();
	
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}
	
	//-----------
	function manage_row($row)
	{
		global $ttH;
		
		$output = '';
		
		if(!empty($row["picture"])){
			$row["picture"] = '<a class="fancybox-effects-a" title="'.$row["picture"].'" href="'.DIR_UPLOAD.$row["picture"].'">
				'.$ttH->func->get_pic_mod($row["picture"], 50, 50, '', 1, 0, array('fix_width'=>1)).'
			</a>';
		}
		
		$row['status'] = ($row['order_id'] > 0) ? promotion_status_info (1) : promotion_status_info (0);
		
		$row['date_create'] = date('d/m/Y',$row['date_create']);
		$row['date_end'] = date('d/m/Y, H:i',$row['date_end']);
		
		$ttH->temp_act->assign('row', $row);
		
		$ttH->temp_act->parse("promotion.row_item");
		$output = $ttH->temp_act->text("promotion.row_item");
		$ttH->temp_act->reset("promotion.row_item");
		
		return $output;
	}
	
	//-----------
	function do_manage($is_show="")
	{
		global $ttH;
		
		$err = "";
		
		$p = (isset($ttH->input["p"])) ? $ttH->input["p"] : 1;
		$search_date_begin = (isset($ttH->input["search_date_begin"])) ? $ttH->input["search_date_begin"] : "";
		$search_date_end = (isset($ttH->input["search_date_end"])) ? $ttH->input["search_date_end"] : "";
		$search_title = (isset($ttH->input["search_title"])) ? $ttH->input["search_title"] : "";
		
		$where = " ";
		$ext = "";
		$is_search = 0;
		
		$where .= " where is_show=1 and user_id='".$ttH->data['user_cur']['user_id']."' ";
		
		if($search_date_begin || $search_date_end ){
			$tmp1 = @explode("/", $search_date_begin);
			$time_begin = @mktime(0, 0, 0, $tmp1[1], $tmp1[0], $tmp1[2]);
			
			$tmp2 = @explode("/", $search_date_end);
			$time_end = @mktime(23, 59, 59, $tmp2[1], $tmp2[0], $tmp2[2]);
			
			$where.=" AND (date_create BETWEEN {$time_begin} AND {$time_end} ) ";
			$ext.="&date_begin=".$search_date_begin."&date_end=".$search_date_end;
			$is_search = 1;
		}
		
		if(!empty($search_title)){
			$where .=" and (a.order_id='$search_title' or title like '%$search_title%') ";			
			$ext.="&search_title=".$search_title;
			$is_search = 1;
		}
    
		$num_total = 0;
		$res_num = $ttH->db->query("select promotion_id from promotion ".$where." ");
			$num_total = $ttH->db->num_rows($res_num);
		$n = 20;//($ttH->conf["n_list"]) ? $ttH->conf["n_list"] : 20;
		$num_products = ceil($num_total / $n);
		if ($p > $num_products)
		  $p = $num_products;
		if ($p < 1)
		  $p = 1;
		$start = ($p - 1) * $n;
		
		$link_action = $ttH->site->get_link ($this->modules,$ttH->setting[$this->modules]["ordering_link"]);
		
		$where .= " order by date_create DESC";

    $sql = "select * from promotion ".$where." limit $start,$n";
    //echo $sql;
		
		$nav = $ttH->site->paginate ($link_action, $num_total, $n, $ext, $p);
		
		$result = $ttH->db->query($sql);
    $i = 0;
		$data['row_item'] = '';
    $html_row = "";
    if ($num = $ttH->db->num_rows($result))
		{
			while ($row = $ttH->db->fetch_row($result)) 
			{
				$i++;
				$row['stt'] = $start + $i;
				$data['row_item'] .= $this->manage_row($row);
			}
		}
		else
		{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["user"]["no_have_data"]));
			$ttH->temp_act->parse("promotion.row_empty");
		}
		
		$data['html_row'] = $html_row;
		$data['nav'] = $nav;
		$data['err'] = $err;
		
		$data['link_action_search'] = $link_action;
		$data['link_action'] = $link_action."&p=".$p.$ext;
		
		$data['search_date_begin'] = $search_date_begin;
		$data['search_date_end'] = $search_date_end;
		$data['search_title'] = $search_title;
		$data['form_search_class'] = ($is_search == 1) ? ' expand' : '';
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("promotion");
		return $ttH->temp_act->text("promotion");
	}
	
  // end class
}
?>