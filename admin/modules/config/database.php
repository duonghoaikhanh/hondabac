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
	var $modules = "config";
	var $action = "database";
	var $sub = "manage";
	
	/**
	* function sMain ()
	* Khoi tao 
	**/
	function sMain ()
	{
		global $ttH;
		$ttH->func->load_language_admin($this->modules);
		$ttH->temp_act = new XTemplate($ttH->path_html.$this->modules.DS.$this->action.".tpl");
		$ttH->temp_act->assign('LANG', $ttH->lang);
		$ttH->temp_act->assign('DIR_IMAGE', $ttH->dir_images);
		
		include ($this->modules."_func.php");
		
		$data["link_manage"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage");
		$data["link_manage_trash"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "manage_trash");
		$data["link_add"] = $ttH->admin->get_link_admin ($this->modules, $this->action, "add");
		
		$this->sub = (isset($ttH->input["sub"])) ? $ttH->input["sub"] : "manage";
		switch ($this->sub) {
			case "manage_trash":
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_".$this->sub];
				$data["main"] = $this->do_manage("trash");
				break;
			default:
				$this->sub = "manage";
				$ttH->conf["page_title"] = $ttH->lang[$this->modules][$this->action."_manage"];
				$data["main"] = $this->do_manage();
				break;
		}
		$data["class"] = array();
		$data["class"][$this->sub] = ' class="active"';
		$data["page_title"] = $ttH->conf["page_title"];
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("main");
		$ttH->output .=  $ttH->temp_act->text("main");
	}

	//-------------- 
  function do_backup ($tables = '*')
  {
    global $ttH;
		
		$path = $ttH->conf['rootpath'] . "backup". DS . "database". DS;
		$output = '';
		
		$output .= "\n".'--';
		$output .= "\n".'-- Copyright © 2013 by Phan Van Lien';
		$output .= "\n".'-- Backup '.date('d/m/Y - H:i:s A');
		$output .= "\n".'--'."\n\n";
	
		$link = mysql_connect($ttH->conf['host'],$ttH->conf['dbuser'],$ttH->conf['dbpass']);
		mysql_select_db($ttH->conf['dbname'],$link);
		
		//get all of the tables
		if($tables == '*')
		{
			$tables = array();
			$result = mysql_query('SHOW TABLES');
			while($row = mysql_fetch_row($result))
			{
				$tables[] = $row[0];
			}
		}
		else
		{
			$tables = is_array($tables) ? $tables : explode(',',$tables);
		}
		
		//cycle through
		foreach($tables as $table)
		{
			$result = mysql_query('SELECT * FROM '.$table);
			$num_fields = mysql_num_fields($result);
			
			$output .= "\n".'--';
			$output .= "\n".'-- Table structure for table '.$table.'';
			$output .= "\n".'--';
			$output .= "\n".'DROP TABLE IF EXISTS '.$table.';';
			$row2 = mysql_fetch_row(mysql_query('SHOW CREATE TABLE '.$table));
			$output.= "\n\n".$row2[1].";\n\n";
			
			for ($i = 0; $i < $num_fields; $i++) 
			{
				while($row = mysql_fetch_row($result))
				{
					$output.= 'INSERT INTO '.$table.' VALUES(';
					for($j=0; $j<$num_fields; $j++) 
					{
						$row[$j] = addslashes($row[$j]);
						$row[$j] = str_replace("\n","\\n",$row[$j]);
						if (isset($row[$j])) {
							$output.= '"'.$row[$j].'"' ; 
						} else { 
							$output.= '""'; 
						}
						if ($j<($num_fields-1)) { 
							$output.= ','; 
						}
					}
					$output.= ");\n";
				}
			}
			$output.="\n\n\n";
		}
		
		//save file
		$name_file = $ttH->conf['dbname'].'-'.time();
		$handle = fopen($path.$name_file.'.sql','w+');
		fwrite($handle,$output);
		fclose($handle);
		
    if ($handle){
      $mess = $ttH->lang["config"]["backup_success"];
			$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, 'manage');
			$ttH->html->alert($mess, $link_action);
    } else  {
      $mess = $ttH->html->html_alert($ttH->lang["config"]["backup_false"], "error");
    }
		
		return $mess;
  }

	//-------------- 
  function do_del ($list_del = "")
  {
    global $ttH;
		
		if(empty($list_del)){
			$ttH->html->alert ($ttH->lang["global"]["not_found_product"], $ttH->admin->get_link_admin ($this->modules, $this->action));
		}
		$del_item = "";
		$del_item_lang = "";
		
		$query = $ttH->db->query("select id, menu_id from admin_menu_lang where find_in_set(menu_id,'".$list_del."') and lang='".$ttH->conf["lang_cur"]."'");	
		while ($row = $ttH->db->fetch_row($query)){
			$check = $ttH->db->query("select id from admin_menu_lang where menu_id='".$row["menu_id"]."' and lang!='".$ttH->conf["lang_cur"]."'");
			if (!$num_check = $ttH->db->num_rows($query)){	
				$del_item .= ($del_item) ? "," : "";
				$del_item .= $row["menu_id"];
			}
			$del_item_lang .= ($del_item_lang) ? "," : "";
			$del_item_lang .= $row["id"];
		}
		
		$ok = $ttH->db->delete ("admin_menu_lang", "find_in_set(id,'".$del_item_lang."')");
    if ($ok){
			$ttH->db->delete ("admin_menu", "find_in_set(menu_id,'".$del_item."')");
      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_success"], "success");
    } else  {
      $mess = $ttH->html->html_alert($ttH->lang["global"]["del_false"], "error");
    }
		
		return $mess;
  }
	
	//-----------
	function do_manage()
	{
		global $ttH;
		
		$err = "";
		
		//update
		if (isset($ttH->input['do_action']))
		{
			$up_id = (isset($ttH->input["selected_id"])) ? $ttH->input["selected_id"] : array();
		  switch ($ttH->input["do_action"]){
				case "do_edit":
					
					$arr_show_order = (isset($ttH->post["show_order"])) ? $ttH->post["show_order"] : array();
							
					$mess = $ttH->lang['global']['edit_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['show_order'] = $arr_show_order[$up_id[$i]];
						$ok = $ttH->db->do_update("admin_menu", $dup, "menu_id=" . $up_id[$i]);
						if ($ok){
							$str_mess .= ($str_mess) ? ", " : "";
							$str_mess .= $up_id[$i];
						} else{
							$mess .= $ttH->lang["global"]['edit_false'] . " ID: <strong>" . $up_id[$i] . "</strong>";
						}
					}
					$mess .= $str_mess . "</strong>";
					$err = $ttH->html->html_alert ($mess, "success");
					break;
				case "do_backup":
					$err = $this->do_backup ();
					break;
				case "do_restore":
					$up_id = (isset($ttH->input["id"])) ? array($ttH->input["id"]) : $up_id;
					$mess = $ttH->lang['global']['restore_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['is_show'] = 1;
						$ok = $ttH->db->do_update("admin_menu", $dup, "menu_id=" . $up_id[$i]);
						if ($ok){
							$str_mess .= ($str_mess) ? ", " : "";
							$str_mess .= $up_id[$i];
						} else{
							$mess .= $ttH->lang["global"]['restore_false'] . " ID: <strong>" . $up_id[$i] . "</strong>";
						}
					}
					$mess .= $str_mess . "</strong>";
					$err = $ttH->html->html_alert ($mess, "success");
					break;
				case "do_trash":
					$up_id = (isset($ttH->input["id"])) ? array($ttH->input["id"]) : $up_id;
					$mess = $ttH->lang['global']['trash_success'] . " ID: <strong>";
					$str_mess = "";
					for ($i = 0; $i < count($up_id); $i ++){
						$dup = array();
						$dup['is_show'] = 0;
						$ok = $ttH->db->do_update("admin_menu", $dup, "menu_id=" . $up_id[$i]);
						if ($ok){
							$str_mess .= ($str_mess) ? ", " : "";
							$str_mess .= $up_id[$i];
						} else{
							$mess .= $ttH->lang["global"]['trash_false'] . " ID: <strong>" . $up_id[$i] . "</strong>";
						}
					}
					$mess .= $str_mess . "</strong>";
					$err = $ttH->html->html_alert ($mess, "success");
					break;
				case "do_del":
					if(isset($ttH->input['id'])){
						$list_del = $ttH->input['id'];
					}elseif(isset($ttH->post['selected_id']) && is_array($ttH->post['selected_id'])){
						$list_del = @implode(','.$ttH->post['selected_id']);
					}
					$err = $this->do_del ($list_del);
					break;
		  }
		}
		
		$p = (isset($ttH->input["p"])) ? $ttH->input["p"] : 1;
		
		$where = " ";
		$ext = "";
		
		$link_action = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub);
		
    $i = 0;
    $html_row = "";
    $path = $ttH->conf['rootpath'] . "backup". DS . "database";
		if ($arr_file = array_diff(scandir($path), array('..', '.'))) {
			foreach($arr_file as $file) {
				if ( $file != "index.html") {
					$i++;
					
					$arr_tmp = explode('-',$file);
					$n_arr_tmp = count($arr_tmp);
					
					$row = array();
					$row["link_del"] = $ttH->admin->get_link_admin ($this->modules, $this->action, $this->sub, array("do_action"=>"do_del","file"=>$file));
					$row['file_id'] = $file;
					$row['title'] = $file;
					$row['date_create'] = (int)$arr_tmp[$n_arr_tmp-1];
					$row['date_create'] = date('H:i:s, d/m/Y', $row['date_create']);
					$row['filesize'] = filesize ($path . DS . $file);
					$row['filesize'] = $ttH->func->format_size ($row['filesize']);
					
					$ttH->temp_act->assign('row', $row);
					$ttH->temp_act->parse("manage.row_item");
				}
			}
		}
		else
		{
			$ttH->temp_act->assign('row', array("mess"=>$ttH->lang["global"]["no_have_data"]));
			$ttH->temp_act->parse("manage.row_empty");
		}
		
		$data['html_row'] = $html_row;
		$data['err'] = $err;
		
		$data['link_backup'] = $link_action."&do_action=do_backup";
		$data['link_action'] = $link_action."&p=".$p.$ext;
		
		$ttH->temp_act->assign('data', $data);
		$ttH->temp_act->parse("manage");
		return $ttH->temp_act->text("manage");
	}

  // end class
}
?>