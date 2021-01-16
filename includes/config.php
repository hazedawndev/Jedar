<?php

if(!file_exists('project/'.$project_folder)){
    die('no project folder');
    exit;
}
error_reporting(0);
ini_set('display_errors', true);
// error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);

error_reporting(E_ERROR);
// error_reporting(E_ALL);

if (!defined('STD_PAD_LEFT')) {
    define('STD_PAD_LEFT', 0);
}
//define("__ROOT__", dirname(__DIR__)."/");
date_default_timezone_set('Asia/Hong_Kong');

session_start();

include_once './includes/language_setting.php';

if(file_exists('./project/' . $project_folder . '/config/dbconfig.php')){
    include_once './project/' . $project_folder . '/config/dbconfig.php';
}
if(file_exists('./project/' . $project_folder . '/config/emailconfig.php')){
    include_once './project/' . $project_folder . '/config/emailconfig.php';
}
if(file_exists('./project/' . $project_folder . '/config/cmsconfig.php')){
    include_once './project/' . $project_folder . '/config/cmsconfig.php';
}
include_once './includes/mysql.class.php';
if($mysqlhost && $mysqluser && $mysqldb && $dbprefix) {
  $mysql = new mysqlclass($mysqlhost, $mysqluser, $mysqlpass, $mysqldb, $dbprefix);
}
if(file_exists('./project/' . $project_folder . '/config/globalconfig.php')){
    include_once './project/' . $project_folder . '/config/globalconfig.php';
}

if(file_exists('./project/' . $project_folder . '/config/userconfig.php')){
    include_once './project/' . $project_folder . '/config/userconfig.php';
}

include_once './includes/phpmailer/PHPMailerAutoload.php';
include_once './includes/Mobile_Detect.php';
include_once './includes/functions.php';
include_once './includes/functions_global.php';

$filefolder = 'project/' . $project_folder . '/upload/file';
$imagefolder = 'project/' . $project_folder . '/upload/image';
$videofolder = 'project/' . $project_folder . '/upload/video';

$imageTable = 'images';
$imagePrimarykey = 'image_id';

$videoTable = 'videos';
$videoPrimarykey = 'video_id';

$fileTable = 'files';
$filePrimarykey = 'file_id';

$Mobile_Detect = new Mobile_Detect();
$nowTime = date("Y-m-d H:i:s");

$actual_path = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$cururl = parse_url($actual_path);
$actualurl_cms = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$actual_path = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]".$cururl['path'];

$og = array();

function isMobile() {
    //return true;
    global $Mobile_Detect;
    if ($Mobile_Detect->isMobile() || $Mobile_Detect->isTablet()) {
        return true;
    }
    return false;
}

$mysql = new mysqlclass($mysqlhost, $mysqluser, $mysqlpass, $mysqldb, $dbprefix);


if(file_exists('./project/' . $project_folder . '/config/textuser.php')){
    include_once './project/' . $project_folder . '/config/textuser.php';
}

$sysCfg = array();

if ($mysql->tableExists('setting')) {
    $settings = $mysql->getList('setting');
    foreach ($settings as $setting) {
        $sysCfg[$setting['key']] = $setting['value'];
    }
}

function get_nonull($array){
    foreach ($array as $key => $value) {
        if($value){
            return $value;
        }
    }
    return false;
}

function get_content($info, $field, $len = 0, $is_html = false) {
    global $selected_lang;
    if($info[$field]){
        $content = $info[$field];
    } else if ($selected_lang == 'sc') {
        $content = $info[$field . '_sc'];
    } else if ($selected_lang == 'tc') {
        $content = $info[$field . '_tc'];
    } else {
        $content = $info[$field . '_en'];
    }
    if ($len) {
        $content = mb_substr($content, 0, $len, 'utf8');
    }
    if (!$is_html) {
        $content = nl2br(htmlspecialchars($content));
        $content = trim(preg_replace('/\s\s+/', ' ', $content));
    }
    return $content;
}

function get_content_indent($info, $field) {

    $content = get_content($info, $field, 0 , true);
    $content = str_replace("\r\n", "\n", $content);
    $content = explode("\n\n", $content);

    $contentb = "";
    foreach ($content as $contenta) {
        //$contenta = htmlspecialchars($contenta);
        $contenta = nl2br($contenta);
        $contentb .= "<p>$contenta</p>";
    }
    return $contentb;
}

function get_link($info, $field) {
    global $selected_lang;
    if ($selected_lang == 'sc' && $info[$field . '_sc']) {
        return $info[$field . '_sc'];
    } else {
        if ($info[$field . '_tc']) {
            return $info[$field . '_tc'];
        } else {
            return 'javascript:void(0);';
        }
    }
}

function getShareImageUrl($imageData, $index) {
    return getResizeImageUrl($imageData, $index, 600, 600);
}

function getResizeImageUrl($imageData, $index, $w, $h, $type = 'resize', $jpgquality = 100) {
    global $imagefolder, $project_folder;

    $folder = get_folder($imagefolder, $imageData[$index], $imageData['date_added']);
    //$folder = str_pad($imageData[$index], 11, "0", STD_PAD_LEFT);
    if($type == 'resize'){
        $destpath = "$folder/".$w."x".$h."_$imageData[filename_md5].$imageData[type]";
    } else {
        $destpath = "$folder/".$w."x".$h."_c_$imageData[filename_md5].$imageData[type]";
    }
    if(!file_exists($destpath)){
        if ($type == 'resize') {
            ImageResizeV3(getImageUrl($imageData, 'image_id'), $destpath, $imageData['type'], $w, $h);
        } else if ($type == 'crop') {
            ImageCropV3(getImageUrl($imageData, 'image_id'), $destpath, $imageData['type'], $w, $h);
        }
    }
    return $destpath;
}

function getImageUrl($imageData, $index = 'image_id', $fname = null, $fext = null) {
    global $imagefolder;
    $folder = get_folder($imagefolder, $imageData[$index], $imageData['date_added']);
    $fname = $fname?$imageData[$fname]:$imageData['filename_md5'];
    $fext = $fext?$imageData[$fext]:$imageData['type'];
    return "$folder/$fname.$fext";
}

function getFileUrl($fileData, $index) {
    global $filefolder;
    $folder = get_folder($filefolder, $fileData[$index], $fileData['date_added']);
    $fname = $fileData['filename_md5'];
    $fext = $fileData['type'];
    return "$folder/$fname.$fext";
}

function getVideoUrl($videoData, $index)
{
    global $videofolder;
    $folder = get_folder($videofolder, $videoData[$index], $videoData['date_added']);
    return "$folder/$videoData[filename_md5].$videoData[type]";
}

function get_systext($field)
{
    global $selected_lang, $textuser;
    if(isset($textuser[$selected_lang][$field])){
        return $textuser[$selected_lang][$field];
    } else {
        return $field;
    }
}

function encryptPassword($owner, $password) {
    return md5($owner['salt'].$password);
}

function randString($minlength, $maxlength, $useupper = false, $uselower = true, $usenumbers = false, $usespecial = false)
{
    $key = "";
    $charset = "";
    if ($uselower) $charset .= "abcdefghijklmnopqrstuvwxyz";
    if ($useupper) $charset .= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    if ($usenumbers) $charset .= "0123456789";
    if ($usespecial) $charset .= "~@#$%^*()_+-={}|]["; // Note: using all special characters this reads: "~!@#$%^&*()_+`-={}|\\]?[\":;'><,./";
    if ($minlength > $maxlength) $length = mt_rand($maxlength, $minlength);
    else $length = mt_rand($minlength, $maxlength);
    for ($i = 0; $i < $length; $i++) $key .= $charset[(mt_rand(0, (strlen($charset) - 1)))];
    return $key;
}

function remote_ip(){
    if(!empty($_SERVER['HTTP_CLIENT_IP'])){
       $myip = $_SERVER['HTTP_CLIENT_IP'];
    }else if(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
       $myip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    }else{
       $myip= $_SERVER['REMOTE_ADDR'];
    }
    return $myip;
}

function ip_info($ip = NULL, $purpose = "location", $deep_detect = TRUE) {
    $output = NULL;
    if (filter_var($ip, FILTER_VALIDATE_IP) === FALSE) {
        $ip = $_SERVER["REMOTE_ADDR"];
        if ($deep_detect) {
            if (filter_var(@$_SERVER['HTTP_X_FORWARDED_FOR'], FILTER_VALIDATE_IP))
                $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
            if (filter_var(@$_SERVER['HTTP_CLIENT_IP'], FILTER_VALIDATE_IP))
                $ip = $_SERVER['HTTP_CLIENT_IP'];
        }
    }
    $purpose    = str_replace(array("name", "\n", "\t", " ", "-", "_"), NULL, strtolower(trim($purpose)));
    $support    = array("country", "countrycode", "state", "region", "city", "location", "address");
    $continents = array(
        "AF" => "Africa",
        "AN" => "Antarctica",
        "AS" => "Asia",
        "EU" => "Europe",
        "OC" => "Australia (Oceania)",
        "NA" => "North America",
        "SA" => "South America"
    );
    if (filter_var($ip, FILTER_VALIDATE_IP) && in_array($purpose, $support)) {
        $ipdat = @json_decode(file_get_contents("http://www.geoplugin.net/json.gp?ip=" . $ip));
        if (@strlen(trim($ipdat->geoplugin_countryCode)) == 2) {
            switch ($purpose) {
                case "location":
                    $output = array(
                        "city"           => @$ipdat->geoplugin_city,
                        "state"          => @$ipdat->geoplugin_regionName,
                        "country"        => @$ipdat->geoplugin_countryName,
                        "country_code"   => @$ipdat->geoplugin_countryCode,
                        "continent"      => @$continents[strtoupper($ipdat->geoplugin_continentCode)],
                        "continent_code" => @$ipdat->geoplugin_continentCode
                    );
                    break;
                case "address":
                    $address = array($ipdat->geoplugin_countryName);
                    if (@strlen($ipdat->geoplugin_regionName) >= 1)
                        $address[] = $ipdat->geoplugin_regionName;
                    if (@strlen($ipdat->geoplugin_city) >= 1)
                        $address[] = $ipdat->geoplugin_city;
                    $output = implode(", ", array_reverse($address));
                    break;
                case "city":
                    $output = @$ipdat->geoplugin_city;
                    break;
                case "state":
                    $output = @$ipdat->geoplugin_regionName;
                    break;
                case "region":
                    $output = @$ipdat->geoplugin_regionName;
                    break;
                case "country":
                    $output = @$ipdat->geoplugin_countryName;
                    break;
                case "countrycode":
                    $output = @$ipdat->geoplugin_countryCode;
                    break;
            }
        }
    }
    return $output;
}

function get_language_link($lang){
    $para = array();
    foreach ($_GET as $key => $value) {
        if($key == 'lang'){continue;}
        $para[] = "$key=".rawurlencode($value);
    }
    return '?lang='.$lang.'&'.join('&', $para);
}

?>