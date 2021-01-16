<?php

date_default_timezone_set('Asia/Hong_Kong');

error_reporting(0);

ini_set('display_errors', true);
//error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING & ~E_ERROR);
error_reporting(E_ERROR);
// error_reporting(E_ALL);

if (!defined('STD_PAD_LEFT')) {
    define('STD_PAD_LEFT', 0);
}

// foreach ($_POST as $key => $value) {
//     $_POST[$key] = strip_tags($_POST[$key], '<p><a><i><b><u><hr><h1><h2><h3><h4><h5><h6><img><table><tbody><tr><td><br><ul><li><ol><sup><sub><span><div>');
//     $_POST[$key] = str_replace('$', '&#x24;', $_POST[$key]);
// }

// foreach ($_GET as $key => $value) {
//     $_GET[$key] = strip_tags($_GET[$key]);
//     $_GET[$key] = str_replace('$', '&#x24;', $_GET[$key]);
// }

session_start();

$sysCfg = array();
$config['Website_Title'] = 'CMS';

include_once '../includes/project.php';
include_once 'includes/language_setting.php';
include_once '../includes/mysql.class.php';
include_once '../includes/functions.php';
include_once '../includes/functions_global.php';

if(file_exists('../project/' . $project_folder . '/config/dbconfig.php')){
    include_once '../project/' . $project_folder . '/config/dbconfig.php';
}

if($mysqlhost && $mysqluser && $mysqldb && $dbprefix) {
  $mysql = new mysqlclass($mysqlhost, $mysqluser, $mysqlpass, $mysqldb, $dbprefix);
}

if(file_exists('../project/' . $project_folder . '/config/globalconfig.php')){
    include_once '../project/' . $project_folder . '/config/globalconfig.php';
}

if($mysqlhost && $mysqluser && $mysqldb && $dbprefix) {
  $mysql = new mysqlclass($mysqlhost, $mysqluser, $mysqlpass, $mysqldb, $dbprefix);
}

include_once 'includes/function.php';
if(file_exists('../project/' . $project_folder . '/config/cmsconfig.php')){
    include_once '../project/' . $project_folder . '/config/cmsconfig.php';
}
if(file_exists('../project/' . $project_folder . '/config/cmsconfig_table.php')){
    include_once '../project/' . $project_folder . '/config/cmsconfig_table.php';
}
if (file_exists('../project/' . $project_folder . '/config/textconfig.php')) {
    include_once '../project/' . $project_folder . '/config/textconfig.php';
} else {
    include_once '../project/default/config/textconfig.php';
}

include_once 'includes/cmsconfig.php';

include_once 'includes/login.class.php';
include_once '../includes/phpmailer/PHPMailerAutoload.php';

$nowTime = date("Y-m-d H:i:s");


// process back parameter 
if(isset($_GET['bp'])){
    if(!isset($_SESSION['bp'])){
        $_SESSION['bm'] = array();
        $_SESSION['bp'] = array();
    }
    $bp = json_decode(rawurldecode($_GET['bp']), true);
    if(!isset($_SESSION['bm'][$bp['bm']])){
        array_push($_SESSION['bp'], $_GET['bp']);
        $_SESSION['bm'][$bp['bm']] = true;
    }
}
if(isset($_GET['bc'])){
    $bp = json_decode(array_pop($_SESSION['bp']), true);
    unset($_SESSION['bm'][$bp['bm']]);
}
if(isset($_GET['ca'])){
    unset($_SESSION['bm']);
    unset($_SESSION['bp']);
}
unset($_GET['bp']);
unset($_GET['bc']);
unset($_GET['ca']);

// process back parameter 

// rend admin menu
$menuCFG = $mysql->getListJoin('LEFT JOIN', array('admin_zmenu', 'admin_zconfigtable'), array('admin_zconfigtable_id', 'admin_zconfigtable_id'), array(array('status'=>1)), array('*', array('table_index')), array(array('sort_order')), array(array('ASC')));
$cmsconfig_data = array();
foreach ($menuCFG as $info) {
    $cmsconfig_data[$info['parent_id']][] = $info;
}
function rend_menu($parent_id){
    global $cmsconfig_data, $selected_lang;
    $data = array();
    foreach ($cmsconfig_data[$parent_id] as $info) {
        $ndata = array(
            'id' => $info['admin_zmenu_id'],
            'tid' => $info['admin_zconfigtable_id'],
            'pid' => $info['parent_id'],
            'menu_title' => $info['name_'.$selected_lang]
        );
        if(isset($cmsconfig_data[$info['admin_zmenu_id']])){
            $ndata['submenu'] = rend_menu($info['admin_zmenu_id']);
        }
        $ndata['table_name'] = isset($info['table_name'])?$info['table_name']:'';
        $ndata['table_index'] = isset($info['table_index'])?$info['table_index']:'';
        $data[$info['admin_zmenu_id']] = $ndata;
    }
    return $data;
}

$cmsconfig = rend_menu(0);

// rend table config
$tbs = $mysql->getList('admin_zconfigtable', array('status'=>1));
if($mysql->columnExists('admin_zconfigtable_fields', 'list_order') && ($_GET['tt'] == 'list' || $_GET['tt'] == 'sublist' || $_GET['tt'] == 'search' || $_GET['tt'] == 'shortcut' || $_GET['tt'] == 'backlist')){
    $fds = $mysql->getList('admin_zconfigtable_fields', array(), '*', 'list_order', 'ASC');
} else {
    $fds = $mysql->getList('admin_zconfigtable_fields', array(), '*', 'sort_order', 'ASC');
}

$tbIndexByID = array();
$tbCfgs = array();
$fdsCfgByTb = array();
$fieldIndexByID = array();
$fieldExtraOpt = array();
$fieldinlineListOpt = array();
foreach ($fds as $info) {
    $fdsCfgByTb[$info['admin_zconfigtable_id']][] = $info;
    $fieldIndexByID[$info['admin_zconfigtable_fields_id']] = $info['field_index'];
    if($info['admin_zconfigtable_id'] == 34 && $info['field_index'] == 'extra_opt'){
        $fieldExtraOpt[str_replace('extra_opt ', '', $info['field_name'])] = unserialize($info['extra_opt']);
    }
}
//$allow_tables = array();
foreach ($tbs as $info) {
    $allow_tables[] = $info['table_index'];
    $fields = array();
    if(isset($fdsCfgByTb[$info['admin_zconfigtable_id']])){
        foreach ($fdsCfgByTb[$info['admin_zconfigtable_id']] as $field) {
            $fd = $field;
            $fd['field_id'] = $field['admin_zconfigtable_fields_id'];
            $fd['field_options'] = $field['field_options']?explode(',', $field['field_options']):array();
            $fd['extra_opt'] = unserialize($field['extra_opt']);
            $extra = $fd['extra_opt'];
            if($fieldExtraOpt[$fd['field_type']]){
                foreach ($fieldExtraOpt[$fd['field_type']] as $k => $v) {
                    $fd[$v[0]] = $extra[0][$k];
                }
            }
            if($fd['field_type'] == 'tabs'){
                foreach ($extra as $sfkey => $tabs) {
                    $fd['tabs'][$sfkey] = join(',', $tabs);
                }
            } else if($fd['field_type'] == 'serialize' || $fd['field_type'] == 'inlinelist'){
                foreach ($extra as $sfkey => $sfdata) {
                    $fd['fields_cfg'][$sfkey] = $sfdata;
                }
                list($fd['allow_create'], $fd['serialize_key']) = explode(',', $field['serialize_opt']);
            }
            $fields[] = $fd;
        }
    }
    if(isset($fdsCfgByTb[$info['related_id']])){
        $tmp_fields = $fields;
        $fields = array();
        foreach ($fdsCfgByTb[$info['related_id']] as $field) {
            $field_replaced = false;
            foreach ($tmp_fields as $tmp_field) {
                if($field['field_index'] == $tmp_field['field_index']){
                    $fields[] = $tmp_field;
                    $field_replaced = true;
                    break;
                }
            }
            if($field_replaced){ continue; }
            $fd = $field;
            $fd['field_id'] = $field['admin_zconfigtable_fields_id'];
            $fd['field_options'] = $field['field_options']?explode(',', $field['field_options']):array();
            $fd['extra_opt'] = unserialize($field['extra_opt']);
            $extra = $fd['extra_opt'];
            if($fieldExtraOpt[$fd['field_type']]){
                foreach ($fieldExtraOpt[$fd['field_type']] as $k => $v) {
                    $fd[$v[0]] = $extra[0][$k];
                }
            }
            if($fd['field_type'] == 'tabs'){
                foreach ($extra as $sfkey => $tabs) {
                    $fd['tabs'][$sfkey] = join(',', $tabs);
                }
            } else if($fd['field_type'] == 'serialize' || $fd['field_type'] == 'inlinelist'){
                foreach ($extra as $sfkey => $sfdata) {
                    $fd['fields_cfg'][$sfkey] = $sfdata;
                }
                list($fd['allow_create'], $fd['serialize_key']) = explode(',', $field['serialize_opt']);
            }
            $fields[] = $fd;
        }

        // add new fields
        foreach ($tmp_fields as $tmp_field) {
            $field_replaced = false;
            foreach ($fields as $field) {
                if($field['field_index'] == $tmp_field['field_index']){
                    $field_replaced = true;
                    break;
                }
            }
            if(!$field_replaced){
                $fields[] = $tmp_field;
            }
        }
    }
    
    $tbIndexByID[$info['admin_zconfigtable_id']] = $info['table_index'];
    $ncfg = $info;
    $ncfg['title'] = $info['table_title'];
    $ncfg['menu_title'] = $info['table_title'];
    $ncfg['option'] = explode(',', $info['table_option']);
    $ncfg['list_filter'] = $info['list_filter']?explode(',', $info['list_filter']):'';
    $ncfg['search_field'] = $info['search_field']?explode(',', $info['search_field']):'';
    $ncfg['cnt_btns'] = $info['cnt_btns']?explode(',', $info['cnt_btns']):'';
    $ncfg['list_update'] = explode(',', $info['list_update']);
    $ncfg['export_field'] = explode(',', $info['export_field']);
    $ncfg['default_filter'] = unserialize($info['default_filter']);
    $ncfg['fields'] = $fields;
    $tbCfgs[$info['table_index']] = $ncfg;

    $convert_field = array('list_update');
    foreach ($convert_field as $fd_index) {
        if ($tbCfgs[$info['table_index']][$fd_index]) {
            $convertItem = array();
            foreach ($tbCfgs[$info['table_index']][$fd_index] as $item) {
                if(isset($fieldIndexByID[$item])){
                    $convertItem[] = $fieldIndexByID[$item];
                }
            }
            $tbCfgs[$info['table_index']][$fd_index] = $convertItem;
        }
    }
}

// security check $_GET['t'], $_GET['m']
if(isset($_GET['t']) && !in_array($_GET['t'], $allow_tables)){
    echo 'allow_tables';
    exit;
}
$_GET['m'] = (int)$_GET['m'];

if($_GET['stage'] && !preg_match('/^[A-Z]|_+$/i', $_GET['stage'])){
    return false;
}

$login = new loginModule;
//$login->sessionKey = $project_folder . md5($_SERVER['REQUEST_URI']) . 'usersession_';
$login->sessionKey = $project_folder  . 'usersession_';
$login->proname = $project_folder . 'cms';
$login->tableName = 'admin';
if (isset($_GET['logout'])) {
   $login->logoutTag = $_GET['logout'];
}

$cms_login = $cms_password = $signin_checkbox = '';
if(isset($_POST['cms_login'])){
    $cms_login = $_POST['cms_login'];
}
if(isset($_POST['cms_password'])){
    $cms_password = $_POST['cms_password'];
}
if(isset($_POST['signin-checkbox'])){
    $signin_checkbox = $_POST['signin-checkbox'];
}

$login->setMysql($mysql);
//$_SESSION[$login->sessionKey . 'admin_id'] = 1;
$login->check($cms_login ,$cms_password ,$signin_checkbox);

if (isset($_GET['logout'])) {
    $login->logOut();
}

$regGolbal = array('m', 't');
foreach ($regGolbal as $value) {
    if (isset($_GET[$value])) {
        $$value = $_GET[$value];
    }
    if (isset($_POST[$value])) {
        $$value = $_POST[$value];
    }
}
foreach ($cmsconfig as $mc => $scs) {
    if (isset($scs['table_index'])) {
        $tbCfgs[$scs['table_index']]['menu_title'] = $scs['menu_title'];
        $tbCfgs[$scs['table_index']]['title'] = $tbCfgs[$scs['table_index']]['title']?$tbCfgs[$scs['table_index']]['title']:$scs['menu_title'];
    } else if (isset($scs['submenu'])) {
        foreach ($scs['submenu'] as $sc => $scv) {
            $tbCfgs[$scv['table_index']]['menu_title'] = $scv['menu_title'];
            $tbCfgs[$scv['table_index']]['title'] = $tbCfgs[$scv['table_index']]['title']?$tbCfgs[$scv['table_index']]['title']:$scv['menu_title'];
        }
    }
}
foreach ($tbCfgs as $tname => $toption){
    if (isset($tbCfgs[$tname]['option'])) {
       $tbCfgs[$tname]['option_hash'] = tableOpt($tbCfgs[$tname]['option']);
    }
}

// check perssion table
function getPriActID($section, $action){
    global $PRIS;
    if (!isset($PRIS[$section]) || !isset($PRIS[$section][$action])) {
       return null;
    }
    return $PRIS[$section][$action];
}
$PRIS = array();
foreach ($mysql->getList($permissionTable, null, '*', 'parent_id', 'ASC') as $pri) {
    if($pri['parent_id'] == 0){
        $PRIS['admin_permission_id'][$pri['permission_index']] = $pri['admin_permission_id'];
        $PRIS['permission_index'][$pri['admin_permission_id']] = $pri['permission_index'];
    } else {
        $pindex = $PRIS['permission_index'][$pri['parent_id']];
        $PRIS[$pindex][$pri['permission_index']] = $pri['admin_permission_id'];
    }
}

// setup permission
if(isset($permissionTable) && $_GET['t'] == 'admin_group'){
    function createPri($table_index, $name = ''){
        global $mysql, $permissionTable, $tbCfgs;
        $tableCfg = $tbCfgs[$table_index];
        $lastrecord = $mysql->getData($permissionTable, array(), '*', array('sort_order'), 'DESC');
        $lastord = $lastrecord['sort_order'];
        $lastord++;
        $name = $name?$name:$table_index;
        if($tableCfg['parent_table']){
            $parentCFG = $tbCfgs[$tableCfg['parent_table']];
            $name = ($parentCFG['table_title']?$parentCFG['table_title']:$parentCFG['table_name']).'/'.$name;
        }
        $data = array(
            'name_en' => $name,
            'name_tc' => $name,
            'name_sc' => $name,
            'permission_index' => $table_index,
            'sort_order' => $lastord,
            'status' => 1
        );
        return $mysql->create($permissionTable, $data);
    }
    function createPriAct($sec_id, $action){
        global $mysql, $permissionTable, $tbCfgs;
        $lastrecord = $mysql->getData($permissionTable, array('admin_permission_id' => $sec_id), '*', array('sort_order'), 'DESC');
        $lastord = $lastrecord['sort_order'];
        $lastord++;
        $data = array(
            'parent_id' => $sec_id,
            'name_en' => get_systext($action, 'en'),
            'name_tc' => get_systext($action, 'tc'),
            'name_sc' => get_systext($action, 'sc'),
            'permission_index' => $action,
            'sort_order' => $lastord,
            'status' => 1
        );
        return $mysql->create($permissionTable, $data);
    }
    function deletePri($section){
        global $mysql, $permissionTable, $tbCfgs;
        $delinfo = $mysql->getData($permissionTable, array('permission_index'=>$section));
        deletePriAct($delinfo['admin_permission_id']);
        $mysql->delete($permissionTable, array('permission_index'=>$section));
    }
    
    function deletePriAct($sec_id, $action = null){
        global $mysql, $permissionTable, $permissionRelateTable, $tbCfgs;
        $acts = array();
        if(!$action){
            $dellist = $mysql->getList($permissionTable, array('parent_id'=>$sec_id));
            foreach ($dellist as $del){
                $acts[] = $del['permission_index'];
            }
        } else {
            $acts[] = $action;
        }
        foreach ($acts as $act) {
            $delinfo = $mysql->getData($permissionTable, array('permission_index'=>$act, 'parent_id'=>$sec_id));
            $mysql->delete($permissionTable, array('permission_index'=>$act, 'parent_id'=>$sec_id));
        }
        $res = $mysql->getList($permissionTable, array('parent_id'=>$sec_id), '*', 'sort_order', 'ASC');
        $ord = 1;
        foreach ($res as $info) {
            $mysql->update($permissionTable, array('admin_permission_id' => $info['admin_permission_id']), array('sort_order' => $ord));
            $ord++;
        }
    }
    function checkActBySec($table_index){
        global $mysql, $permissionTable, $tbCfgs, $PRIS;
        if(isset($tbCfgs[$table_index]['option'])){
            foreach ($tbCfgs[$table_index]['option'] as $option) {
                if(!isset($PRIS[$table_index][$option]) || !$PRIS[$table_index][$option]){
                    $PRIS[$table_index][$option] = createPriAct($PRIS['admin_permission_id'][$table_index], $option);
                }
            }
        }
    }
    
    $ccBySec = array(); //cmsconfig
    // check perssion table to create
    foreach ($tbCfgs as $table_index => $scs) {
        $ccBySec[$table_index] = $scs;
        if(!isset($PRIS['admin_permission_id'][$table_index])){
            $id = createPri($table_index, $scs['table_title']);
            $PRIS['admin_permission_id'][$table_index] = $id;
            $PRIS['permission_index'][$id] = $table_index;
        }
        checkActBySec($table_index);
    }
    foreach ($PRIS['permission_index'] as $index ){
        if(!isset($ccBySec[$index])){
            deletePri($index);
        }
    }
    // check perssion to delete
    foreach ($PRIS as $index => $actions) {
        if($index == 'admin_permission_id' || $index == 'permission_index'){continue;}
        foreach ($actions as $action) {
            if(!isset($tbCfgs[$index]['option_hash'][$action])){
                deletePriAct($PRIS['admin_permission_id'][$index], $action);
            }
        }
    }
}
$adminPris = $login->getPermission();

if($login->getAdminID() != 1){
    foreach ($cmsconfig as $mc => $scs) {
        if (isset($scs['table_index']) && $scs['table_index']) {
            if(!isset($adminPris[getPriActID($scs['table_index'], 'allow_list')])){
                unset($cmsconfig[$mc]);
            }
        } else if (isset($scs['submenu']) && $scs['submenu']) {
            foreach ($scs['submenu'] as $sc => $scv) {
                if(!isset($adminPris[getPriActID($scv['table_index'], 'allow_list')])){
                    unset($cmsconfig[$mc]['submenu'][$sc]);
                }
            }
        }
    }
    foreach ($tbCfgs as $table_index => $table){
        $tbOpt = isset($table['option'])?$table['option']:array();
        $opts = array();
        foreach ($tbOpt as $opt) {
            if(isset($adminPris[getPriActID($table_index, $opt)])){
                $opts[] = $opt;
            }
        }
        $tbCfgs[$table_index]['option'] = $opts;
        $tbCfgs[$table_index]['option_hash'] = tableOpt($opts);
    }
}
foreach ($tbCfgs as $tn => $table) {
    if(isset($table['fields']) && is_array($table['fields'])){
        // fbi // field by index
        $tbCfgs[$tn]['fbi'] = array();
        $tbCfgs[$tn]['fbid'] = array();
        foreach ($table['fields'] as $field) {
            $tbCfgs[$tn]['fbi'][$field['field_index']] = $field;
            $tbCfgs[$tn]['fbid'][$field['field_id']] = $field;
        }
    }
    if (isset($table['option']) && is_array($table['option'])) {
        // oi // option by index
        $tbCfgs[$tn]['oi'] = array();
        foreach ($tbCfgs[$tn]['option'] as $opt) {
            $tbCfgs[$tn]['oi'][$opt] = true;
        }
    }
}

if(isset($t)){
    $curCfg = $tbCfgs[$t];
    $curCfg['table_name'] = isset($curCfg['table_name'])?$curCfg['table_name']:$t;
    $curCfg['index'] = $t;
}

// init data_type
require_once('data_type/data_type.php');
$data_type = new data_type();
$data_type->mysql = $mysql;

if (isset($curCfg)) {
    $data_type->config_table = $curCfg;
}

// echo $_GET['t'];
// exit;

$project_data_type = '../project/'.$project_folder.'/admin/data_type/';
if(file_exists($project_data_type)){
    if ($handle = opendir($project_data_type)) {
        while (false !== ($entry = readdir($handle))) {
            if(substr($entry, 0, 1) == '.' || $entry == 'data_type.php'){continue;}
            include_once($project_data_type.$entry);
            list($classname, $ext) = explode('.', $entry);
            $data_type->$classname = new $classname($data_type);
        }
        closedir($handle);
    }
}
if ($handle = opendir('data_type')) {
    while (false !== ($entry = readdir($handle))) {
        if(substr($entry, 0, 1) == '.' || $entry == 'data_type.php'){continue;}
        if(file_exists($project_data_type.$entry)){continue;}
        include_once("data_type/$entry");
        list($classname, $ext) = explode('.', $entry);
        $data_type->$classname = new $classname($data_type);
    }
    closedir($handle);
}
?>