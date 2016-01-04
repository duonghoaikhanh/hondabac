<?php
class Editor
{
	//=================get_menu===============
	function load_editor ($html_name, $html_id, $value="", $more_atl="", $type="full", $more_conf = array())
	{
		global $ttH;
		$ttH->func->include_js ($ttH->dir_lib."tinymce/tinymce.min.js");
		
		$folder_up = (isset($more_conf["folder_up"])) ? $more_conf["folder_up"] : "";
		$fldr = (isset($more_conf["fldr"])) ? $more_conf["fldr"] : "";
		
		$output = '<textarea id="'.$html_id.'" name="'.$html_name.'" '.$more_atl.'>'.$value.'</textarea>';
		
		switch ($type) {
			case "mini":
				$output .= '<script>
					tinymce.init({
						selector: "textarea#'.$html_id.'",
						theme: "modern",
						width: "100%",
						height: 100,
						link_list: [
						],
						plugins: [
								"advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
                "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                "table contextmenu directionality emoticons textcolor paste textcolor responsivefilemanager"
					 ],
						relative_urls: false,
						browser_spellcheck : true ,
						filemanager_title:"Responsive Filemanager",
						external_filemanager_path:"'.$ttH->conf["rooturl"].'admin/?mod=library&act=library&sub=popup_library&lang='.$ttH->conf["lang_cur"].'&folder_up='.$folder_up.'&fldr='.$fldr.'",
						external_plugins: { "filemanager" : "'.$ttH->conf["rooturl"].'admin/modules/library/plugin.min.js"},
						codemirror: {
						indentOnInit: true, // Whether or not to indent code on init. 
						path: "CodeMirror"
					},
					
					image_advtab: true,
					
					toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect | fontselect fontsizeselect",
					toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image media code | inserttime preview | forecolor backcolor",
					toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft",
					
					menubar: false,
					toolbar_items_size: "small"

				 });
				</script>';
				break;
			default:
				$output .= '<script>
					tinymce.init({
						selector: "textarea#'.$html_id.'",
						theme: "modern",
						width: "100%",
						height: 300,
						link_list: [
						],
						plugins: [
								"advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
                "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                "table contextmenu directionality emoticons textcolor paste textcolor responsivefilemanager"
					 ],
						relative_urls: false,
						browser_spellcheck : true ,
						filemanager_title:"Responsive Filemanager",
						external_filemanager_path:"'.$ttH->conf["rooturl"].'admin/?mod=library&act=library&sub=popup_library&lang='.$ttH->conf["lang_cur"].'&folder_up='.$folder_up.'&fldr='.$fldr.'",
						external_plugins: { "filemanager" : "'.$ttH->conf["rooturl"].'admin/modules/library/plugin.min.js"},
						codemirror: {
						indentOnInit: true, // Whether or not to indent code on init. 
						path: "CodeMirror"
					},
					
					image_advtab: true,
					
					toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect | fontselect fontsizeselect",
					toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image media responsivefilemanager code | inserttime preview | forecolor backcolor",
					toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft",
					
					menubar: false,
					toolbar_items_size: "small"

				 });
				</script>';
        break;
		}
		
		return $output;
	}
}
?>
