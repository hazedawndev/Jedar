<?php



include_once 'includes/project.php';
include_once 'includes/config.php';


$curURL = parse_url("http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]");

//$actual_link = $curURL['scheme']."://$curURL[host]".str_replace(basename($curURL['path']), '', $curURL['path']);
if ($curURL['port']) {
	$actual_link = $curURL['scheme']."://$curURL[host]".":".$curURL['port'].str_replace(basename($curURL['path']), '', $curURL['path']);
} else {
	$actual_link = $curURL['scheme']."://$curURL[host]".str_replace(basename($curURL['path']), '', $curURL['path']);
}


function isAction($action){
	global $allFields;
	if($allFields['a'] == $action){
		return true;
	}
	return false;
}

function getAPI(){
	global $_GET;
	return $_GET['c'];
}

$result = array(
    'rscode' => 200,
    'msg_detail' => 'success'
);

if(file_exists('project/'.$project_folder.'/api/'.getAPI().'.php')){
	include_once 'project/'.$project_folder.'/api/'.getAPI().'.php';
} else {
	$result = array(
	    'rscode' => 400,
	    'msg_detail' => 'api control not exists'
	);
}

header('Content-Type: application/json; charset=utf-8');

echo json_encode($result);

?>