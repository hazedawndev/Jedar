<?php

class dt_related extends data_type {
    private $config;
    public function config($field=false){
        if($field){
            $this->clear_config();
            $this->config = parent::config($field);
            $this->config['related_table'] = isset($field['related_table'])?$field['related_table']:$field[5][0];
            $this->config['related_name'] = isset($field['related_name'])?$field['related_name']:$field[5][1];
            $this->config['related_key'] = isset($field['related_key'])?$field['related_key']:$field[5][3];
            $this->config['related_extra_key'] = isset($field['related_extra_key'])?$field['related_extra_key']:$field[5][2];
            $this->config['related_extra_value'] = isset($field['related_extra_value'])?$field['related_extra_value']:$field[5][4];
        }
        return $this->config;
    }

	public function filter_html($value){
		$field = $this->config();
		list($countlist, $selecthtml) = $this->getRelateSelect($field, false, 'filter');
		return $selecthtml;
	}
	// build list value
	public function list_value($values){
		$field = $this->config();
        if (isset($values[$this->get_index()])) {
            return getRelateValue($field, $values[$this->get_index()]);
        } else {
            return '';
        }
	}

	public function form_details($value){
    	return $this->list_value($value);
	}

	// build html form field
    public function form_html($value, $formerror, $name= false){
    	$field = $this->config();
        $fieldOpts = fieldOpt($field['field_options']);
    	list($countlist, $selecthtml) = $this->getRelateSelect($field, false , false, $value[$this->get_index()], $name);
    	$output = $selecthtml;
    	if ($countlist > 5 && !isset($fieldOpts['modify_readonly'])) {
    		$output .= '<script type="text/javascript">';
    		$output .= '$(document).ready(function() {';
    		$output .= '$(".R_'.$field['field_index'].'").select2({';
    		$output .= 'maximumSelectionLength: 10,';
    		$output .= 'allowClear: true,';
            $output .= 'placeholder: ""';
    		$output .= '}); });';
    		$output .= '</script>';
    	}
    	return $output;
    }

    function getRelateSelect($field, $show_title = false, $type = '', $value = false, $name= false) {
        global $tbCfgs, $selected_lang, $formerror, $_POST, $curCfg, $permission;
        $rtCfg = $tbCfgs[$field['related_table']];
        $rtOpts = tableOpt($rtCfg['option']);
        $fieldOpts = fieldOpt($field['field_options']);
        $html = '<select '.(isset($fieldOpts['modify_readonly'])?' disabled="true" ':'').' class="R_'.$field['field_index'].' '. (isset($formerror[$field['field_index']])?'parsley-errorr ':'') .'form-control" jf="'.$field['field_index'].'" name="'.($name?$name:$field['field_index']).'" id="'.$field['field_index'].'">';
        if($type == 'filter') {
            $html .= '<option value="">'.$field['field_name'].':'.get_systext('filter_all').'</option>';
        } else if($show_title) {
            $html .= '<option value="">'.get_systext($field['field_name']).'</option>';
        } else if($field['field_index'] == 'parent_id') { 
            $html .= '<option value="0"></option>';
        } else {
            $html .= '<option value=""></option>';
        }
        if(isset($rtCfg['table_type']) && $rtCfg['table_type'] == 'sublist' && $tbCfgs[$field['related_table']]['parent_table']){
            $selectList = array();
            $parentQuery = array();
            $parentCfgs = $tbCfgs[$tbCfgs[$field['related_table']]['parent_table']];
            if($field['related_extra_key'] && $field['related_extra_value']){
                $parentQuery[$field['related_extra_key']] = explode(',', $field['related_extra_value']);
            } else if($field['related_extra_key'] && !$field['related_extra_value']){
                $parentQuery[$field['related_extra_key']] = $_GET[$field['related_extra_key']];
            }
            if($parentCfgs['parent_related_key']){
                foreach (explode(',', $parentCfgs['parent_related_key']) as $key) {
                    $parentQuery[$key] = $_GET[$key];
                }
            }
            $mainList = $this->mysql->getList($parentCfgs['table_name'], $parentQuery, '*', $parentCfgs['table_order_field'], $parentCfgs['table_order_default_direction']);
            if($field['related_show_main']){
                $selectList = array_merge($selectList, $mainList);
            }
            foreach ($mainList as $minfo) {
                if($parentCfgs['table_name'] == $rtCfg['table_name']){
                    $subList = $this->mysql->getList($rtCfg['table_name'], array($tbCfgs[$field['related_table']]['parent_related_key'] => $minfo[$tbCfgs[$field['related_table']]['table_primarykey']]),
                    '*', $tbCfgs[$field['related_table']]['table_order_field'], $tbCfgs[$field['related_table']]['table_order_default_direction']);
                } else {
                    $related_keys = explode(',', $tbCfgs[$field['related_table']]['parent_related_key']);
                    $related_query = array();
                    foreach ($related_keys as $related_key){
                        $related_query[$related_key] = $minfo[$related_key];
                    }
                    $subList = $this->mysql->getList($rtCfg['table_name'], $related_query,
                    '*', $tbCfgs[$field['related_table']]['table_order_field'], $tbCfgs[$field['related_table']]['table_order_default_direction']);
                }
                $selectList = array_merge($selectList, $subList);
            }
        } else if (isset($curCfg['table_type']) && $curCfg['table_type'] == 'tree' && $field['field_type'] == 'related' && $field['field_index'] == 'parent_id') {
            if (isset($curCfg['parent_table']) && $curCfg['parent_table']) {
                $related_keys = explode(',', $curCfg['parent_related_key']);
                $related_query = array();
                foreach ($related_keys as $related_key){
                    $related_query[$related_key] = $_GET[$related_key];
                }
                $selectList = $this->mysql->getList($curCfg['table_name'], $related_query, '*', $curCfg['table_order_field']);
            } else {
                $selectList = $this->mysql->getList($curCfg['table_name'], null, '*', array($curCfg['table_order_field']));
            }
        } else if (isset($field['related_extra_key']) && $field['related_extra_key'] && isset($field['related_key']) && $field['related_key'] && isset($field['related_extra_value']) && $field['related_extra_value'] != '') {
            $selectList = $this->mysql->getList($rtCfg['table_name'], array($field['related_extra_key']=>explode(',', $field['related_extra_value'])), '*', $rtCfg['table_order_field'], $rtCfg['table_order_default_direction']);
        } else if (isset($field['related_extra_key']) && $field['related_extra_key'] && isset($_GET[$field['related_extra_key']])) {
            $selectList = $this->mysql->getList($rtCfg['table_name'], $field['related_extra_key'] . "=" . $_GET[$field['related_extra_key']] . " OR " . $field['related_extra_key'] . "=0", '*', $rtCfg['table_order_field'], $rtCfg['table_order_default_direction']);
        } else if (isset($field['related_extra_key']) && $field['related_extra_key']) {
            $selectList = $this->mysql->getList($rtCfg['table_name'], $field['related_extra_key'], '*', $rtCfg['table_order_field'], $rtCfg['table_order_default_direction']);
        } else {
            if($field['related_name'] && isset($rtOpts['support_language'])  && !$rtOpts['support_language']){
                $selectList = $this->mysql->getList($rtCfg['table_name'], null, $field['related_name'].','.$field['related_key'], $rtCfg['table_order_field'], $rtCfg['table_order_default_direction']);
            } else {
                $selectList = $this->mysql->getList($rtCfg['table_name'], null, '*', $rtCfg['table_order_field'], $rtCfg['table_order_default_direction']);
            }
        }
        $fieldType = '';
        foreach ($rtCfg['fields'] as $reField) {
            if ($reField['field_index'] == $field['related_name']) {
                $fieldType = $reField['field_type'];
            }
        }
        if (!$field['related_key']) {
            $field['related_key'] = $field['field_index'];
        }
        foreach ($selectList as $info) {
            if ($field['field_index'] == 'parent_id' && $info[$curCfg['table_primarykey']] == $_GET[$curCfg['table_primarykey']]) {
                continue;
            }
            if(isset($permission) && !isset($permission[$info[$field['related_key']]]) && $type == 'filter') {continue;}

            $html .= '<option '.($fieldType == 'image'?' data-imagesrc="' . getImageUrl($info[$field['related_name']]) . '"':'');
            if (($value && $value == $info[$field['related_key']]) || (isset($_POST[$field['field_index']]) && $info[$field['related_key']] == $_POST[$field['field_index']])) { 
                $html .= ' selected '; 
            }

            $titles = array();
            $values = array();

            if (preg_match('/\,/is', $field['related_name'])) {
                foreach (explode(',', $field['related_name']) as $fieldname) {
                    $key = isset($rtOpts['support_language']) && $rtOpts['support_language'] && $info[$fieldname . '_' . $selected_lang] ? $fieldname . '_' . $selected_lang : $fieldname;
                    $val = $info[$key];
                    if($rtCfg['fbi'][$key]['field_type'] == 'related'){
                        $val = getRelateValue($rtCfg['fbi'][$key], $val);
                    }
                    $values[] = $val;
                } 
            } else {
                $key = isset($rtOpts['support_language']) && $rtOpts['support_language'] && $info[$field['related_name'] . '_' . $selected_lang] ? $field['related_name'] . '_' . $selected_lang : $field['related_name'];
                $val = $info[$key];
                if($rtCfg['fbi'][$key]['field_type'] == 'related'){
                    $val = getRelateValue($rtCfg['fbi'][$key], $val);
                }
                $values[] = $val;
            }
            $html .= 'value="'.$info[$field['related_key']].'" title="'.join('', $titles).'">'.join(' ', $values).'</option>';  
        }
        $html .= '</select>';
        return array(count($selectList), $html);
    }
}
?>