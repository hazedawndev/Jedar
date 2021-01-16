<?php
class dt_keyindex extends data_type {
	// 處理  before form submit
    public function form_validate($value){
        global $_POST;
        $sqlskip = false;
        $data = false;
        $error = false;
        $field = parent::config();
        $data = $value[$field['field_index']];
        $data = $this->key_replace($data);
        return array($sqlskip, $data, $error);
    }
    // build list update value
    public function list_update_value($values, $primaryid){
        $field = $this->config();
        $data = $this->key_replace($values[$field['field_index']. '_' . $primaryid]);
        return $data;
    }

    private function key_replace($data){
        $delete_chars = array('$', '.', ',', '"', '(', ')', '+', '!', '@', '#', '%', '^', '&', '*', '=', '+', '[', ']', '{', '}', '|', '\\', '/', '`', '~', ';', ':', '<', '>', '?', '\'', '“', '”', '’');
        $data = trim($data);
        $data = str_replace('  ', ' ', $data);
        $data = str_replace('  ', ' ', $data);
        $data = str_replace('  ', ' ', $data);
        $data = str_replace('  ', ' ', $data);
        $data = str_replace('  ', ' ', $data);
        $data = str_replace(' ', '_', $data);
        $data = str_replace('-', '_', $data);
        $data = str_replace($delete_chars, '', $data);
        return $data;
    }
}
?>