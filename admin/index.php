<?php

include_once 'includes/config.php';

ob_start();

if(isset($_GET['file'])){
	include_once 'project/'.$project_folder.'/admin/'.$_GET['file'].'.php';
}
if($admin_index){
	header('location: '.$admin_index);
	exit;
}

if (isset($cms_content)) {
    $cms_content .= ob_get_contents();
} else {
    $cms_content = ob_get_contents();
}
ob_end_clean();

include 'template.php';

?>