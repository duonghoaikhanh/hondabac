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
				break;
			default:
				$output .= '<script>
					tinymce.init({
						selector: "textarea#'.$html_id.'",
						theme: "modern",
						width: "100%",
						height: 300,
						link_list: [
								{title: "My page 1", value: "http://www.tinymce.com"},
								{title: "My page 2", value: "http://www.tecrail.com"}
						],
						plugins: [
								 "advlist autolink link image lists charmap print preview hr anchor pagebreak",
								 "searchreplace wordcount visualblocks visualchars insertdatetime media nonbreaking spellchecker",
								 "table contextmenu directionality emoticons paste textcolor responsivefilemanager "
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
					 toolbar1: "undo redo | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | styleselect",
					 toolbar2: "print preview | image media responsivefilemanager | forecolor backcolor emoticons| link unlink anchor"
				 });
				</script>';
        break;
		}
		
		return $output;
	}
}
?>
