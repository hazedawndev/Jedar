<?php

include_once 'includes/config.php';

// list permission check
if(!isset($adminPris[getPriActID($t, 'allow_list')]) && $login->getAdminID() != 1){
    echo 'permission denied';
    exit;
}
if (isset($_GET['stage']) && $_GET['stage'] == 'publish' && $_GET[$curCfg['table_primarykey']]) {
     // delete permission check
    if(!isset($adminPris[getPriActID($t, 'allow_publish')]) && $login->getAdminID() != 1){
        echo 'permission denied';
        exit;
    }
    $mysql->update($curCfg['table_name'], array($curCfg['table_primarykey'] => $_GET[$curCfg['table_primarykey']]), array('status' => 1));
    log_admin_activity('publish', $curCfg['title'] . '(' . $_GET[$curCfg['table_primarykey']] . ')');
} else if (isset($_GET['stage']) && $_GET['stage'] == 'delete' && $_GET[$curCfg['table_primarykey']]) {
     // delete permission check
    if(!isset($adminPris[getPriActID($t, 'allow_delete')]) && $login->getAdminID() != 1){
        echo 'permission denied';
        exit;
    }
    $error_message = delete_record($_GET[$curCfg['table_primarykey']]);
    if($error_message){
        $error_message = $error_message;
    } else {
        $list_message = 'delete success';
    }
    log_admin_activity('delete', $curCfg['title'] . '(' . $_GET[$curCfg['table_primarykey']] . ')');
    unset($_GET['stage']);
    unset($_GET[$curCfg['table_primarykey']]);
} else if (isset($_POST['form_stage']) && ($_POST['form_stage'] == 'ording' || $_POST['form_stage'] == 'delete_select' || $_POST['form_stage'] == 'insert_select')) {
    if (isset($_POST['del_records']) && $_POST['del_records'] && $_POST['form_stage'] == 'insert_select') {
        // delete permission check
        if(!isset($adminPris[getPriActID($t, 'allow_create')]) && $login->getAdminID() != 1){
            echo 'permission denied';
            exit;
        }
        foreach (explode(',', $_POST['lids']) as $id) {
            foreach ($curCfg['list_update'] as $ufield) {
                if ($curCfg['fbi'][$ufield]['field_type'] == 'onoff' && !$_POST[$ufield.'_'.$id]) {
                    $_POST[$ufield.'_'.$id] = 0;
                }
                // 防止update唔在list 既item
                $fieldOpts = fieldOpt($curCfg['fbi'][$ufield]['field_options']);
                if (!isset($fieldOpts['list']) || !isset($_POST[$ufield.'_'.$id])) { continue; }
                $mysql->update($curCfg['table_name'], array($curCfg['table_primarykey'] => $id), array($ufield => $_POST[$ufield.'_'.$id]));
                log_admin_activity('update', $curCfg['title'] . '(' .$id . ', '. "$ufield => ". $_POST[$ufield.'_'.$id] .')');
            }
        }
        $idlist = explode(',', $_POST['del_records']);
        foreach ($idlist as $id) {
            $id = (int)$id;
            $par = "&order_from=$id";
            header('location: '.get_link('create').$par);
            exit;
        }
    } else if (isset($_POST['del_records']) && $_POST['del_records'] && $_POST['form_stage'] == 'delete_select') {
        // delete permission check
        if(!isset($adminPris[getPriActID($t, 'allow_delete')]) && $login->getAdminID() != 1){
            echo 'permission denied';
            exit;
        }
        $idlist = explode(',', $_POST['del_records']);
        $error_message = array();
        //.$error_message = get_systext('msg_upd') . " $curCfg[title] " . get_systext('msg_suc') . " :" . date('Y-m-d H:i:s');
        foreach ($idlist as $id) {
            $errormsg = delete_record($id);
            if($errormsg){
                $error_message[] = $errormsg;
            }
        }
        if($error_message){
            $error_message = join('<br>', $error_message);
        } else {
            $list_message = 'delete success';
        }
        //$mysql->deleteSelected($curCfg['table_name'], $curCfg['table_primarykey'], $idlist);
        if (isset($curCfg['table_order_field']) && $curCfg['table_order_field'] && isset($curCfg['table_order_type']) && $curCfg['table_order_type'] && $curCfg['table_order_type'] == 'order') {
            reOrder();
        }
        log_admin_activity('delete selected', $curCfg['title'] . '(' . $_POST['del_records'] . ')');
    } else if ($curCfg['table_order_field'] && $curCfg['table_order_type'] == 'order') {
        // modify permission check
        if(!isset($adminPris[getPriActID($t, 'allow_modify')]) && $login->getAdminID() != 1){
            echo 'permission denied';
            exit;
        }
        foreach ($_POST as $key => $value) {
            foreach (explode(',', $curCfg['table_order_field']) as $order_field){
                if (preg_match('/^'.$order_field.'_/i', $key) && is_numeric($_POST[$key])) {
                    $ordid = str_replace($order_field.'_', '', $key);
                    $newOrder = $_POST[$key];
                    $keyfield = $order_field;
                    break;
                }
            }
        }
        if($newOrder){
            $res = $mysql->getList($curCfg['table_name'], getParentQuery(), '*', $keyfield, 'ASC');
            $data = array();
            foreach ($res as $info) {
                $data[] = $info[$curCfg['table_primarykey']];
                if ($ordid == $info[$curCfg['table_primarykey']]) {
                    $oldOrder = $info[$keyfield];
                }
            }
            list($sortdata) = array_splice($data, ($oldOrder - 1), 1);
            $newarray = array_splice($data, 0, $newOrder - 1);
            $newarray[] = $sortdata;
            foreach ($data as $a) {
                $newarray[] = $a;
            }
            $ord = 1;
            foreach ($newarray as $id) {
                $mysql->update($curCfg['table_name'], array($curCfg['table_primarykey'] => $id), array($keyfield => $ord));
                $ord++;
            }
            log_admin_activity('order', $curCfg['title'] . '(' .$oldOrder . ', '. $newOrder .')');
        }
        
    }
} else if (isset($_POST['form_stage']) && $_POST['form_stage'] == 'update' && isset($curCfg['list_update']) && $curCfg['list_update']) {
    // modify permission check
    if(!isset($adminPris[getPriActID($t, 'allow_modify')]) && $login->getAdminID() != 1){
        echo 'permission denied';
        exit;
    }
    foreach (explode(',', $_POST['lids']) as $id) {
        foreach ($curCfg['list_update'] as $ufield) {
            if ($curCfg['fbi'][$ufield]['field_type'] == 'onoff' && !$_POST[$ufield.'_'.$id]) {
                $_POST[$ufield.'_'.$id] = 0;
            }
            // 防止update唔在list 既item
            $fieldOpts = fieldOpt($curCfg['fbi'][$ufield]['field_options']);
            if (!isset($fieldOpts['list'])) { continue; }
            $field = $curCfg['fbi'][$ufield];
            $data_type->{'dt_'.$field['field_type']}->config($field);
            $value = $data_type->{'dt_'.$field['field_type']}->list_update_value($_POST, $id);
            $mysql->update($curCfg['table_name'], array($curCfg['table_primarykey'] => $id), array($ufield => $value));
            log_admin_activity('update', $curCfg['title'] . '(' .$id . ', '. "$ufield => ". $_POST[$ufield.'_'.$id] .')');
        }
    }
    if (isset($_POST['after_update']) && $_POST['after_update']) {
        header('location: '.$_POST['after_update']);
        exit;
    }
    $list_message = get_systext('msg_upd') . " $curCfg[title] " . get_systext('msg_suc') . " :" . date('Y-m-d H:i:s');
}

if(isset($_GET['cc'])){
    // clear parameter 
    unset($_SESSION[$curCfg['table_name'] . '_call']);
    unset($_SESSION[$curCfg['table_name'] . '_asort']);
    unset($_SESSION[$curCfg['table_name'] . '_isort']);
    unset($_SESSION[$curCfg['table_name'] . '_extraLinkjson']);
}

if(isset($_SESSION[$curCfg['table_name'] . '_extraLinkjson'])){
    $extraLink = json_decode($_SESSION[$curCfg['table_name'] . '_extraLinkjson']);
    foreach ($extraLink as $line) {
        list($k, $v) = explode('=', $line);
        $_GET[$k] = rawurldecode($v);
    }
}

$pagebut = new listRecord;
//$pagebut->perPage = $curCfg['perpage_nums']?$curCfg['perpage_nums']:30;

// print_r($curCfg);
// echo $curCfg['perpage_nums'];
// exit;
$pagebut->perPage = $curCfg['perpage_nums'];
$pagebut->callIndex = $curCfg['table_name'] . '_call';

$call = isset($_GET[$pagebut->callIndex])?$_GET[$pagebut->callIndex]:0;

$asort = isset($_GET[$curCfg['table_name'] . '_asort'])?$_GET[$curCfg['table_name'] . '_asort']:0;
$isort = isset($_GET[$curCfg['table_name'] . '_isort'])?$_GET[$curCfg['table_name'] . '_isort']:0;
if ($call == false) {
    $call = isset($_SESSION[$pagebut->callIndex])?$_SESSION[$pagebut->callIndex]:0;
}
if ($asort == false) {
    $asort = isset($_SESSION[$curCfg['table_name'] . '_asort'])?$_SESSION[$curCfg['table_name'] . '_asort']:false;
}
if ($isort == false) {
    $isort = isset($_SESSION[$curCfg['table_name'] . '_isort'])?$_SESSION[$curCfg['table_name'] . '_isort']:false;
}
if ($call == false) {
    $call = 1;
}
if ($asort == false || isset($_GET['cc'])) {
    if ($curCfg['table_order_field']) {
        $asort = $curCfg['table_order_field'];
    } else {
        $asort = $curCfg['table_primarykey'];
    }
}
if ($isort == false || isset($_GET['cc'])) {
    if (isset($curCfg['table_order_default_direction'])) {
        $isort = $curCfg['table_order_default_direction'];
    } else {
        $isort = 'ASC';
    }
}

if(isset($_POST['button']) && $_POST['button'] == 'filter'){
    $call=1;
}

$_SESSION[$pagebut->callIndex] = $call;
$_SESSION[$curCfg['table_name'] . '_asort'] = $asort;
$_SESSION[$curCfg['table_name'] . '_isort'] = $isort;

$call_select = ($pagebut->perPage * $call) - $pagebut->perPage;

$extraLink = array();

if(isset($_POST['ASjMsXL7p']) && $_POST['ASjMsXL7p']){
    $_GET['ASjMsXL7p'] = $_POST['ASjMsXL7p'];

}
if(isset($_GET['ASjMsXL7p']) && $_GET['ASjMsXL7p']){
    $extraLink[] = "ASjMsXL7p=". rawurlencode($_GET['ASjMsXL7p']);
}


$filterQuery = isset($extraQuery)?$extraQuery:getParentQuery();

if(isset($curCfg['list_filter']) && $curCfg['list_filter']){
    foreach ($curCfg['list_filter'] as $filter) {
        $filter_field = $curCfg['fbid'][$filter];
        $filter_index = $filter_field['field_index']?$filter_field['field_index']:$filter_field['related_table'];
        $filterValue = null;
        if($filter_field['field_type'] == 'date'){
            if($_POST && isset($_POST[$filter_index.'_start']) && $_POST[$filter_index.'_start'] != ''){
                $filter_field['field_index'] = $filter_index.'_start';
                $data_type->{'dt_'.$filter_field['field_type']}->config($filter_field);
                $filterValue_start = $data_type->{'dt_'.$filter_field['field_type']}->list_value($_POST);
            }
            if($_GET && isset($_GET[$filter_index.'_start']) && $_GET[$filter_index.'_start'] != ''){
                $filter_field['field_index'] = $filter_index.'_start';
                $data_type->{'dt_'.$filter_field['field_type']}->config($filter_field);
                $filterValue_start = $data_type->{'dt_'.$filter_field['field_type']}->list_value($_GET);
            }
            if($_POST && isset($_POST[$filter_index.'_end']) && $_POST[$filter_index.'_end'] != ''){
                $filter_field['field_index'] = $filter_index.'_end';
                $data_type->{'dt_'.$filter_field['field_type']}->config($filter_field);
                $filterValue_end = $data_type->{'dt_'.$filter_field['field_type']}->list_value($_POST);
            }
            if($_GET && isset($_GET[$filter_index.'_end']) && $_GET[$filter_index.'_end'] != ''){
                $filter_field['field_index'] = $filter_index.'_end';
                $data_type->{'dt_'.$filter_field['field_type']}->config($filter_field);
                $filterValue_end = $data_type->{'dt_'.$filter_field['field_type']}->list_value($_GET);
            }
            if($filterValue_start != null){
                $extraLink[] = "$filter_index".'_start'."=". rawurlencode($filterValue_start);
            }
            if($filterValue_end != null){
                $extraLink[] = "$filter_index".'_end'."=". rawurlencode($filterValue_end);
            }
        } else {
            if($_POST && isset($_POST[$filter_index]) && $_POST[$filter_index] != ''){
                $filterValue = $_POST[$filter_index];
            }
            if($_GET && isset($_GET[$filter_index]) && $_GET[$filter_index] != ''){
                $filterValue = $_GET[$filter_index];
            }
            if($filterValue != null){
                $extraLink[] = "$filter_index=". rawurlencode($filterValue);
            }
        }
        
        if($filter_field['field_type'] == 'related_multiple'){
            if ($filterValue != null) {
                $related = array();
                if(!$filter_field['field_index'] || $filter_field['related_table']){
                    if($tbCfgs[$filter_field['related_table']]['table_type'] == 'tree'){
                        $ids = get_subtree_ids($tbCfgs[$filter_field['related_table']]['table_index'], $tbCfgs[$filter_field['related_table']]['table_primarykey'], $filterValue);
                        $relateList = $mysql->getList($filter_field['related_to_table'], array($tbCfgs[$filter_field['related_table']]['table_primarykey'] => $ids));
                    } else {
                        $relateList = $mysql->getList($filter_field['related_to_table'], array($tbCfgs[$filter_field['related_table']]['table_primarykey'] => $filterValue));
                    }
                    foreach ($relateList as $rinfo) {
                        $related[] = $rinfo[$filter_field['related_to_mykey']];
                    }
                }
                if(isset($filterQuery[$filter_field['related_to_mykey']])){
                    if(is_array($filterQuery[$filter_field['related_to_mykey']])){
                        $filterQuery[$filter_field['related_to_mykey']] = array_intersect($filterQuery[$filter_field['related_to_mykey']], $related);
                    } else {
                        $related[] = $filterQuery[$filter_field['related_to_mykey']];
                        $filterQuery[$filter_field['related_to_mykey']] = $related;
                    }
                } else if($related) {
                    $filterQuery[$filter_field['related_to_mykey']] = $related;
                } else {
                    $filterQuery[$filter_field['related_to_mykey']] = 0;
                }
                if(!$filterQuery[$filter_field['related_to_mykey']]){
                    $filterQuery[$filter_field['related_to_mykey']] = 0;
                }
            }
        } else if($filter_field['field_type'] == 'date') {
            if($filterValue_start){
                $filterValue_start = str_replace('/', '-', $filterValue_start);
                $filterValue_start = date('Y-m-d', strtotime($filterValue_start));
            }
            if($filterValue_end){
                $filterValue_end = str_replace('/', '-', $filterValue_end);
                $filterValue_end = date('Y-m-d', strtotime($filterValue_end));
            }
            if($filterValue_start != null && $filterValue_start != '' && $filterValue_end != null && $filterValue_end != ''){
                $filterQuery[$filter_index] = 'between'.$filterValue_start.','.$filterValue_end;
            } else if($filterValue_start != null && $filterValue_start != ''){
                $filterQuery[$filter_index] = '>='.$filterValue_start;
            } else if($filterValue_end != null && $filterValue_end != ''){
                $filterQuery[$filter_index] = '<='.$$filterValue_end;
            }
        } else {
            if($filterValue != null && $filterValue != ''){
                $filterQuery[$filter_index] = $filterValue;
            }
        }
    }
}
$searchQuery = array();
if (isset($curCfg['search_field']) && $curCfg['search_field'] && isset($_GET['ASjMsXL7p'])) {
    foreach ($curCfg['search_field'] as $sfid) {
        foreach ($curCfg['fields'] as $sField) {
            if($sField['field_id'] == $sfid){
                $key = $sField['field_index'];
                if($sField['field_type'] == 'related'){
                    // search related table
                    $rtCfg = $tbCfgs[$sField['related_table']];
                    $rtFields = explode(',', $sField['related_name']);
                    $rtQuery = array();
                    foreach ($rtFields as $rtKey) {
                        $rtQuery[$rtKey] = "like%$_GET[ASjMsXL7p]%";
                    }
                    $relatedResult = $mysql->search($rtCfg['table_name'], $rtQuery, null, $sField['related_key'], 0);
                    if($relatedResult){
                        if($searchQuery[$key]){
                            $searchQuery[$key] = array_merge($relatedResult, $searchQuery[$key]);
                        } else {
                            $searchQuery[$key] = $relatedResult;
                        }
                    } else if($rtCfg['table_name'] == 'invoice1' || $rtCfg['table_name'] == 'invoice'){
                        $relatedResult = $mysql->search('invoice', $rtQuery, null, $key, 0);
                        if($relatedResult){
                            if($searchQuery[$key]){
                                $searchQuery[$key] = array_merge($relatedResult, $searchQuery[$key]);
                            } else {
                                $searchQuery[$key] = $relatedResult;
                            }
                        }
                        $relatedResult = $mysql->search('invoice1', $rtQuery, null, $key, 0);
                        if($relatedResult){
                            if($searchQuery[$key]){
                                $searchQuery[$key] = array_merge($relatedResult, $searchQuery[$key]);
                            } else {
                                $searchQuery[$key] = $relatedResult;
                            }
                        }
                    }
                } else {
                    $searchQuery[$key] = "like%$_GET[ASjMsXL7p]%";
                }
            }
        }
    }
}

if (isset($_POST['form_stage']) && $_POST['form_stage'] == 'export'){
    if($_POST['del_records']){
        $filterQuery[$curCfg['table_primarykey']] = explode(',', $_POST['del_records']);
    }
    $results = $mysql->search($curCfg['table_name'], $searchQuery, $filterQuery, '*', 0);
    $fields = $curCfg['export_field'];

    $fi = array();
    foreach ($fields as $field) {
        $fi[$field] = true;
    }
    $fields_name = array();
    $exportdata = array();
    foreach ($results as $mem) {
        $data = array();
        foreach ($curCfg['fields'] as $field) {
            $field_index = $field['field_index'];
            if(isset($fi[$field['field_id']])){
                $fields_name[$field['field_id']] = $field['field_name']?$field['field_name']:$field['field_index'];
                if(isset($mem[$field_index])){
                    if($field['field_type'] == 'file'){
                        $fileData = $mysql->getData($fileTable, array($filePrimarykey => $mem[$field_index]));
                        $folder = get_folder($admin_filefolder, $mem[$field_index], $fileData['date_added']);
                        $data[$field['field_id']] = "$folder/$fileData[filename_md5].$fileData[type]";
                    } else {
                        $data_type->{'dt_'.$field['field_type']}->config($field);
                        if($field['field_index'] == 'first_name' || $field['field_index'] == 'family_name'){
                            $data[$field['field_id']] = strtoupper($data_type->{'dt_'.$field['field_type']}->list_value(array($field_index=>$mem[$field_index])));
                        } else {
                            $data[$field['field_id']] = $data_type->{'dt_'.$field['field_type']}->list_value(array($field_index=>$mem[$field_index]));
                        }
                    }
                } else {
                    $data[$field_index] = '';
                }
            }
        }
        $exportdata[] = $data;
    }
    download_send_headers($curCfg['table_name'].'_'.date('Ymd').'.csv');
    if (function_exists('mb_convert_encoding')) {
        echo chr(255) . chr(254);
        echo mb_convert_encoding(array2csv($exportdata, true, $fields_name), 'UTF-16LE', 'UTF-8');
    } else if (function_exists('iconv')) {
        echo chr(255) . chr(254);
        echo iconv('UTF-8', 'UTF-16LE', array2csv($exportdata, true, $fields_name));
    } else {
        echo array2csv($exportdata, true, $fields_name);
    }
    die();
}
if(!$curCfg['table_name']){
    header('location: ./');
    exit;
}

$rowCount = $mysql->searchCount($curCfg['table_name'], $searchQuery, $filterQuery);

$button = $pagebut->pageButton($call, $rowCount, "?". join('&', $extraLink) . get_link());

//$extraLink[] = $curCfg['table_name'] . '_call='.$call;
if($extraLink){
    $_SESSION[$curCfg['table_name'] . '_extraLinkjson'] = json_encode($extraLink);
}
$sort_related = false;
$sort_stmt = array();
$table_name = $mysql->sql_prefix.$curCfg['table_name'];
foreach (explode(',', $asort) as $asorti) {
    foreach ($curCfg['fields'] as $field) {
        if($field['field_index'] == $asorti){
            if($field['field_type'] == 'related'){
                $sort_related = $field;
                $retable_name = $mysql->sql_prefix.$sort_related['related_table'];
                foreach (explode(',', $sort_related['related_name']) as $related_name) {
                    $refield_name[] = $retable_name.'.'.$related_name;
                    $sort_stmt[] = $retable_name.'.'.$related_name.' '.$isort;
                }
            } else {
                $sort_stmt[] = $table_name.'.'.$asorti.' '.$isort;
            }
        }
    }
}
if($sort_related){
    
    $where_statment = $mysql->getSearchStatment($searchQuery, $filterQuery);
    $where_statment = str_replace(' `', ' '.$table_name.'.`', $where_statment);
    
    $sql = "SELECT $table_name.*, ".join(',', $refield_name)." FROM $table_name LEFT JOIN $retable_name ON $table_name.$sort_related[field_index]=$retable_name.$sort_related[related_key] $where_statment ORDER BY ".join(', ', $sort_stmt)." LIMIT $call_select,$pagebut->perPage";

    $stmt = $mysql->prepare($sql);
    $querys = array();
    if ($searchQuery != null && is_array($searchQuery)) {
        $query_data_n = array();
        foreach ($searchQuery as $qk => $qv) {
            $query_data_n['search_'.$qk] = $qv;
        }
        $querys = $mysql->getQuerys($query_data_n);
    }
    if ($filterQuery != null && is_array($filterQuery)) {
        $search_data_n = array();
        foreach ($filterQuery as $sk => $sv) {
            $search_data_n['query_'.$sk] = $sv;
        }
        $querys = array_merge($querys, $mysql->getQuerys($search_data_n));
    }
    $stmt->execute($querys);
    $res = $stmt->fetchAll(PDO::FETCH_ASSOC);

} else {
    $res = $mysql->search($curCfg['table_name'], $searchQuery, $filterQuery, '*', $asort, $isort, "$call_select,$pagebut->perPage");
}


function control_width($oi){
    global $selected_lang;
    $items = 0;
    if(isset($oi['allow_delete'])){
        $items++;
    }
    if(isset($oi['allow_details'])){
        $items++;
    }
    if(isset($oi['allow_modify'])){
        $items++;
    }
    if(isset($oi['allow_duplicate'])){
        $items++;
    }
    if(isset($oi['allow_preview'])){
        $items++;
    }
    if ($selected_lang == 'en') {
        $width = 65;
    } else {
        $width = 55;
    }
    if(($width*$items) < 100){
        return 'width: 100px;';
    } else {
        return 'width:'.($width*$items).'px;';
    }
}

ob_start();
?>
    <div class="row">
        <div class="<?php echo $curCfg['listwidth_class'] ? $curCfg['listwidth_class'] : 'col-md-12'; ?>">
            <div class="x_panel">
                <div class="breadcrumb row">
                <?php foreach ($_SESSION['bp'] as $bp) { ?>
                    /<?php $json = json_decode($bp, true); echo $tbCfgs[$json['t']]['table_title']; ?>
                <?php } ?>
                /<?php echo $tbCfgs[$_GET['t']]['table_title']; ?>
                </div>
                <!--  list header start -->
                <?php include_once 'related_section.php'; ?>
                <!--  list header end -->
                <div class="x_content">
                    <div id="datatable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                        <?php if (isset($list_message) || $error_message) { ?>
                            <div class="form-group has-success">
                                <?php if(isset($list_message)){ ?><label class="control-label" for="inputSuccess"><i class="fa fa-check"></i> <?php echo htmlspecialchars($list_message); ?></label><?php } ?>
                                <?php if(isset($error_message)){ ?><label class="control-label" for="inputSuccess"><span style="color: red;"><?php echo htmlspecialchars($error_message); ?></span></label><?php } ?>
                            </div>
                        <?php } ?>
                        <div class="row">
                            <!-- list filter , create delete control end -->
                            <div style="display: inline-block;">
                                <form action="multiupload.php.php?<?php echo get_link(); ?>" id="multiform" method="POST" enctype="multipart/form-data">
                                <div class="dt-buttons btn-group">
                                    <?php if (isset($curCfg['oi']['allow_create'])) { ?>
                                        <a class="btn btn-default btn-sm" id="create_btn" tabindex="0" aria-controls="datatable-buttons"
                                           href="<?php echo get_link('create'); ?>"><span><?php echo get_systext('list_create'); ?> <!-- <?php echo get_systext($curCfg['title']); ?> --></span></a>
                                    <?php } ?>
                                    <?php if (isset($curCfg['oi']['allow_insert']) && $curCfg['table_order_type'] == 'order') { ?>
                                        <a class="btn btn-default btn-sm" id="insert_btn" tabindex="0" aria-controls="datatable-buttons"
                                           href="#" onclick="if(countChecked() == 0){alert('<?php echo get_systext('list_del_no_record_selected'); ?> <?php echo get_systext($curCfg['title']); ?>')} else {$('#form_stage').val('insert_select');$('#order_form').submit();}"><span><?php echo get_systext('list_insert'); ?> <!-- <?php echo get_systext($curCfg['title']); ?> --></span></a>
                                    <?php } ?>
                                    <?php if (isset($curCfg['oi']['allow_delete'])) { ?>
                                        <a class="btn btn-default btn-sm" id="delete_selected_btn" tabindex="0" aria-controls="datatable-buttons"
                                           href="#"
                                           onclick="if(countChecked() == 0){alert('<?php echo get_systext('list_del_no_record_selected'); ?> <?php echo get_systext($curCfg['title']); ?>')} else {if(confirm('<?php echo get_systext('list_del_selected'); ?> <?php echo get_systext($curCfg['title']); ?>?')){$('#form_stage').val('delete_select');$('#order_form').submit();} else { return false; } }"><span><?php echo get_systext('list_del_selected'); ?><!--  <?php echo get_systext($curCfg['title']); ?> --></span></a>
                                    <?php } ?>
                                    <?php if (isset($curCfg['oi']['allow_export'])) { ?>
                                        <a class="btn btn-default btn-sm" id="export_btn" tabindex="0" aria-controls="datatable-buttons"
                                           href="javascript:void(0);" 
                                           onclick="export_list();"><span><?php echo get_systext('list_export'); ?><!--  <?php echo get_systext($curCfg['title']); ?> --></span></a>
                                    <?php } ?>
                                    <?php if (isset($curCfg['list_update']) && $curCfg['list_update']) { ?>
                                        <a class="btn btn-default btn-sm" id="update_btn" tabindex="0" aria-controls="datatable-buttons"
                                           href="javascript:void(0);" 
                                           onclick="update_list();"><span><?php echo get_systext('list_update'); ?></span></a>
                                    <?php } ?>
                                    <?php if (isset($curCfg['table_type']) && $curCfg['table_type'] == 'imagelist') { ?>
                                        <a class="btn btn-default btn-sm fileinput-button" id="fileinput_btn" tabindex="0" aria-controls="datatable-buttons"
                                           href="javascript:void(0);"><span><?php echo get_systext('upload_image'); ?></span>
                                           <input type="file" name="files[]" multiple="" id="multiple_upload" accept="<?php echo $imageConfig[$curCfg['index'] . '.' . $curCfg['image_field']][3]; ?>"></a>
                                    <?php } ?>
                                    <?php if (isset($curCfg['extra_listbtn'])) { echo $curCfg['extra_listbtn']; } ?>
                                </div>
                                </form>
                            </div>
                            <script type="text/javascript">
                                function export_list(){
                                    $('#filter_form > input[name=del_records]').val($('#order_form input[name=del_records]').val());
                                    $('#filter_form_stage').val('export');
                                    $('#filter_form').attr('target', '_blank');
                                    $('#filter_form').submit();
                                    setTimeout(function(){window.location.reload();}, 1000);
                                }
                                function update_list(){
                                    $('#form_stage').val('update');
                                    $('#order_form').submit();
                                }
                                <?php if (isset($curCfg['table_type']) && $curCfg['table_type'] == 'imagelist') { ?>
                                $(document).ready(function(){
                                    $('#multiple_upload').change(function(){
                                        var txt = "";
                                        var total_upload_limit = <?php echo max_file_upload_in_bytes()?max_file_upload_in_bytes():0; ?>;
                                        var total_size = 0;
                                        for (var i = 0; i < this.files.length; i++) {
                                            var file = this.files[i];
                                            total_size += file.size;
                                            if ('name' in file) {
                                                txt += "name: " + file.name + "<br>";
                                            }
                                            if ('size' in file) {
                                                txt += "size: " + file.size + " bytes <br>";
                                            }
                                        }
                                        $('#multiform').attr('action', 'multiupload.php?<?php echo get_link(); ?>');
                                        if(total_size > total_upload_limit && total_upload_limit > 0){
                                            alert('max upload limit at once (<?php echo formatBytes(max_file_upload_in_bytes());?>)');
                                        } else {
                                            $('#multiform').submit();
                                        }
                                    });
                                });
                                <?php } ?>
                                $(document).ready(function(){
                                    // $('.cms_list_row').dblclick(function(){
                                    //     if($(this).attr('dblclick') != ''){
                                    //         window.location=$(this).attr('dblclick');
                                    //     }
                                    // });
                                });
                            </script>

                            <!-- list filter , create delete control start -->
                            <div class="pull-right col-xs-12">
                                <form action="?<?php echo get_link('search'); ?>&cc=1" method="POST" id="filter_form">
                                    <input id="filter_form_stage" type="hidden" name="form_stage" value="filter">
                                    <input type="hidden" name="del_records" value="">
                                    <div id="datatable_filter" class="dataTables_filter">
                                    <?php if (isset($curCfg['search_field']) && $curCfg['search_field']) { ?>
                                        <input
                                                autocomplete="off"
                                                style="width:120px"
                                                id="search_ASjMsXL7p"
                                                action="?<?php echo get_link('search'); ?>"
                                                name="ASjMsXL7p"
                                                type="search" class="form-control input-sm"
                                                placeholder="<?php echo get_systext('list_keyword'); ?>"
                                                aria-controls="datatable"
                                                value="<?php echo isset($_GET['ASjMsXL7p'])?$_GET['ASjMsXL7p']:''; ?>">
                                    <?php } ?>
                                    <?php if (isset($curCfg['list_filter']) && $curCfg['list_filter']) { ?>
                                        <?php foreach ($curCfg['list_filter'] as $key => $filter) { ?>
                                            <?php $filter_index = $curCfg['fbid'][$filter]['field_index']?$curCfg['fbid'][$filter]['field_index']:$curCfg['fbid'][$filter]['related_table']; ?>
                                            <?php $field = isset($curCfg['fbid'][$filter])?$curCfg['fbid'][$filter]:0; ?>
                                            <?php if(!$field){continue;} ?>
                                            <?php $data_type->{'dt_'.$field['field_type']}->config($field); ?>
                                            <?php 
                                            if(isset($_GET[$filter_index]) && $_GET[$filter_index]){
                                                $_POST[$filter_index] = $_GET[$filter_index];
                                            }
                                            $filter_value = isset($_POST[$filter_index])&&$_POST[$filter_index]!=''?$_POST[$filter_index]:(isset($_GET[$filter_index])?$_GET[$filter_index]:null);
                                            if($field['field_type'] == 'date'){
                                                $filter_start = isset($_POST[$filter_index.'_start'])&&$_POST[$filter_index.'_start']!=''?$_POST[$filter_index.'_start']:(isset($_GET[$filter_index.'_start'])?$_GET[$filter_index.'_start']:null);
                                                $filter_end = isset($_POST[$filter_index.'_end'])&&$_POST[$filter_index.'_end']!=''?$_POST[$filter_index.'_end']:(isset($_GET[$filter_index.'_end'])?$_GET[$filter_index.'_end']:null);
                                                $filter_value = $filter_start.','.$filter_end;
                                            } else {
                                                $filter_value = isset($_POST[$filter_index])&&$_POST[$filter_index]!=''?$_POST[$filter_index]:(isset($_GET[$filter_index])?$_GET[$filter_index]:null);
                                            } ?>
                                            <?php echo $data_type->{'dt_'.$field['field_type']}->filter_html($filter_value); ?>
                                        <?php } ?>
                                    <?php } ?>
                                    <?php if ((isset($curCfg['search_field']) && $curCfg['search_field']) || (isset($curCfg['list_filter']) && $curCfg['list_filter'])){ ?>
                                        <button type="submit"
                                            class="btn btn-success" name="button" value="filter"><?php echo get_systext('list_filter'); ?></button>
                                        <button type="button"
                                            class="btn btn-success" onclick="window.location='?<?php echo get_link(); ?>&cc=1';"><?php echo get_systext('list_clear'); ?></button>
                                    <?php } ?>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <form action="?<?php echo get_link(); ?>" method="POST" id="order_form">
                                <table id="datatable-checkbox"
                                   class="table table-striped table-bordered dataTable no-footer bulk_action list_<?php echo $_GET['t']; ?>"
                                   role="grid" aria-describedby="datatable_info">
                                    <input id="after_update" type="hidden" name="after_update" value="">
                                    <input id="form_stage" type="hidden" name="form_stage" value="ording">
                                    <input type="hidden" name="del_records" value="">
                                    <thead>
                                    <tr role="row">
                                        <?php if (isset($curCfg['oi']['allow_delete'])||isset($curCfg['oi']['allow_select'])) { ?>
                                            <th style="width:25px;vertical-align:middle;text-align: center;" align="center" valign="middle"><input type="checkbox" id="check-all" class="flat"></th>
                                        <?php } ?>
                                        <?php foreach ($curCfg['fields'] as $field) { ?>
                                            <?php $fieldOpts = fieldOpt($field['field_options']); ?>
                                            <?php if (!isset($fieldOpts['list'])) { continue; } ?>
                                            <?php $fieldClass = array(); ?>
                                            <?php if(isset($fieldOpts['show_desktop'])){$fieldClass[] = 'show_desktop';} ?>
                                            <?php if(isset($fieldOpts['sorting'])){
                                                if ($isort == 'ASC'){
                                                    $fieldClass[] = 'sorting_asc';
                                                } else {
                                                    $fieldClass[] = 'sorting_desc';
                                                }
                                            } ?>
                                            <?php if(isset($fieldOpts['sorting'])) { ?>
                                                <th class="<?php echo join(' ', $fieldClass); ?>"
                                                    onclick="window.location='?<?php echo get_link(); ?>&<?php echo $curCfg['table_name'] . '_asort'; ?>=<?php echo $field['field_index']; ?>&<?php echo $curCfg['table_name'] . '_isort'; ?>=<?php if ($asort == $field['field_index'] && $isort == 'ASC') { ?>DESC<?php } else { ?>ASC<?php } ?>';"
                                                    <?php if ($field['list_width']) { ?> style="width: <?php echo $field['list_width']; ?>;"<?php } ?>
                                                ><?php echo get_systext($field['field_name'])?get_systext($field['field_name']):get_systext($field['field_index']); ?></th>
                                            <?php } else { ?>
                                                <th class="<?php echo join(' ', $fieldClass); ?>"<?php if ($field['list_width']) { ?> style="width: <?php echo $field['list_width']; ?>;"<?php } ?>><?php echo get_systext($field['field_name'])?get_systext($field['field_name']):get_systext($field['field_index']); ?></th>
                                            <?php } ?>
                                        <?php } ?>
                                        <?php if (isset($curCfg['oi']['allow_delete']) || isset($curCfg['oi']['allow_details']) || isset($curCfg['oi']['allow_modify'])) { ?>
                                            <th style="<?php echo control_width($curCfg['oi']); ?>"><?php echo get_systext('list_control'); ?></th>
                                        <?php } ?>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <?php if (isset($curCfg['list_update'])) { ?>
                                        <?php $updateFields = fieldOpt($curCfg['list_update']); ?>
                                    <?php } ?>
                                    <?php $lids = array(); // list all ids ?>
                                    <?php foreach ($res as $row => $rowInfo) { ?>
                                        <?php $lids[] = $rowInfo[$curCfg['table_primarykey']]; ?>
                                        <tr class="<?php if(isset($hlList[$rowInfo[$curCfg['table_primarykey']]])){ ?>highlight<?php } ?> cms_list_row list_id_<?php echo $rowInfo[$curCfg['table_primarykey']]; ?>" dblclick="<?php echo get_link('modify'); ?>&<?php echo $curCfg['table_primarykey'] . '=' . $rowInfo[$curCfg['table_primarykey']]; ?>" data-pkey="<?php echo $rowInfo[$curCfg['table_primarykey']]; ?>">
                                            <?php if (isset($curCfg['oi']['allow_delete'])||isset($curCfg['oi']['allow_select'])) { ?>
                                                <td align="center" valign="middle" style="vertical-align:middle;"><input type="checkbox" class="flat table_records"
                                                           value="<?php echo $rowInfo[$curCfg['table_primarykey']]; ?>"
                                                           id="table_records"></td><?php } ?>
                                            <?php foreach ($curCfg['fields'] as $field) { ?>
                                                <?php $fieldOpts = fieldOpt($field['field_options']); ?>
                                                <?php $fieldClass = array(); ?>
                                                <?php if(isset($fieldOpts['show_desktop'])){$fieldClass[] = 'show_desktop';} ?>
                                                <?php if(!isset($fieldOpts['list'])) { continue; } ?>
                                                <?php if(isset($curCfg['table_order_field']) && isset($curCfg['table_order_type']) && in_array($field['field_index'], explode(',', $curCfg['table_order_field'])) && 'order' == $curCfg['table_order_type']) { ?>
                                                    <td class="<?php echo join(' ', $fieldClass); ?> td_<?php echo $field['field_index']; ?>" style="vertical-align:middle;">
                                                        <input class="order_field" type="text" placeholder="<?php echo $rowInfo[$field['field_index']]; ?>"
                                                               name="<?php echo $field['field_index'].'_'.$rowInfo[$curCfg['table_primarykey']]; ?>" 
                                                               <?php echo strlen($rowInfo[$field['field_index']])>3?'style="width:'.(strlen($rowInfo[$field['field_index']])*10).'px"':''; ?>>
                                                        <a href="javascript:$('#order_form').submit();"><span
                                                                class="badge bg-gray"><?php echo get_systext('list_order'); ?></span></a>
                                                    </td>
                                                <?php } else { ?>
                                                    <td class="<?php echo join(' ', $fieldClass); ?> td_<?php echo $field['field_index']; ?>" row="<?php echo $row; ?>" style="vertical-align:middle;">
                                                        <?php $data_type->{'dt_'.$field['field_type']}->config($field); ?>
                                                        <?php if (isset($updateFields[$field['field_index']])) { ?>
                                                            <?php echo $data_type->{'dt_'.$field['field_type']}->list_update_field($rowInfo, array(), $rowInfo[$curCfg['table_primarykey']]); ?>
                                                        <?php } else { ?>
                                                            <?php echo $data_type->{'dt_'.$field['field_type']}->list_value($rowInfo); ?>
                                                        <?php } ?>
                                                    </td>
                                                <?php } ?>
                                            <?php } ?>
                                            <?php if (isset($curCfg['oi']['allow_delete']) || isset($curCfg['oi']['allow_details']) || isset($curCfg['oi']['allow_modify']) || isset($curCfg['oi']['allow_preview'])) { ?>
                                                <td class="<?php echo join(' ', $fieldClass); ?>" align="center" valign="middle" style="vertical-align:middle;">
                                                    <?php if (isset($curCfg['table_type']) && $curCfg['table_type'] == 'publish' && $rowInfo['status'] != 1) { ?>
                                                        <a href="?<?php echo get_link(); ?>&stage=publish&<?php echo $curCfg['table_primarykey'] . '=' . $rowInfo[$curCfg['table_primarykey']]; ?>"
                                                        onclick="return confirm('<?php echo 'publish'; ?> <?php echo $rowInfo[$curCfg['table_title_field']]; ?> <?php echo htmlspecialchars($curCfg['title']); ?>?');">
                                                        <span class="badge bg-blue"><?php echo 'publish'; ?></span>
                                                        </a>
                                                    <?php } ?>
                                                    <?php if (isset($curCfg['oi']['allow_preview'])) { ?>
                                                        <a target="_blank" href="<?php echo $curCfg['preview_url']; ?>&<?php echo $curCfg['table_primarykey'] . '=' . $rowInfo[$curCfg['table_primarykey']]; ?>"><span class="badge bg-green"><?php echo get_systext('list_preview'); ?></span></a>
                                                    <?php } ?>
                                                    <?php if (isset($curCfg['oi']['allow_modify'])) { ?>
                                                        <a href="<?php echo get_link('modify'); ?>&<?php echo $curCfg['table_primarykey'] . '=' . $rowInfo[$curCfg['table_primarykey']]; ?>"><span class="badge bg-gray"><?php echo get_systext('list_modify'); ?></span></a>
                                                    <?php } ?>
                                                    <?php if (isset($curCfg['oi']['allow_duplicate'])) { ?>
                                                        <a href="<?php echo get_link('duplicate'); ?>&<?php echo $curCfg['table_primarykey'] . '=' . $rowInfo[$curCfg['table_primarykey']]; ?>&<?php echo $curCfg['table_primarykey'] . '_from=' . $rowInfo[$curCfg['table_primarykey']]; ?>">
                                                        <span class="badge bg-gray"><?php echo get_systext('list_duplicate'); ?></span></a>
                                                    <?php } ?>
                                                    <?php if (isset($curCfg['oi']['allow_details'])) { ?>
                                                        <a href="<?php echo get_link('details'); ?>&<?php echo $curCfg['table_primarykey'] . '=' . $rowInfo[$curCfg['table_primarykey']]; ?>"><span class="badge bg-gray"><?php echo get_systext('list_details'); ?></span></a>
                                                    <?php } ?>
                                                    <?php if (isset($curCfg['oi']['allow_delete'])) { ?>
                                                        <a href="?<?php echo get_link(); ?>&stage=delete&<?php echo $curCfg['table_primarykey'] . '=' . $rowInfo[$curCfg['table_primarykey']]; ?>&tt=<?php echo $_GET['tt']; ?>"
                                                        onclick="return confirm('<?php echo get_systext('list_delete'); ?> <?php echo get_systext($curCfg['title']); ?>?');">
                                                        <span class="badge bg-red"><?php echo get_systext('list_delete'); ?></span></a>
                                                    <?php } ?>
                                                    <?php if (isset($curCfg['oi']['allow_publish']) && $rowInfo['status'] != 1) { ?>
                                                        <a href="?<?php echo get_link(); ?>&stage=publish&<?php echo $curCfg['table_primarykey'] . '=' . $rowInfo[$curCfg['table_primarykey']]; ?>"
                                                        onclick="return confirm('<?php echo get_systext('list_publish'); ?> <?php echo get_systext($curCfg['title']); ?>?');">
                                                        <span class="badge bg-red"><?php echo get_systext('list_publish'); ?></span></a>
                                                    <?php } ?>
                                                </td>
                                            <?php } ?>
                                        </tr>
                                    <?php } ?>
                                    <input type="hidden" name="lids" value="<?php echo join(',', $lids); ?>">
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <div class="row">
                            <div class="clearfix"></div>
                            <div class="col-sm-5">
                                <div class="dataTables_info" id="datatable_info" role="status" aria-live="polite">
                                    <?php echo str_replace(array('txt_from', 'txt_toind', 'txt_total'), array($call_select + 1, $call_select + count($res), $rowCount), get_systext('list_show')); ?>
                                </div>
                            </div>
                            <div class="col-sm-7">
                                <?php echo $button; ?>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


<?php

if (isset($cms_content)) {
    $cms_content .= ob_get_contents();
} else {
    $cms_content = ob_get_contents();
}

ob_end_clean();

include 'template.php';
?>