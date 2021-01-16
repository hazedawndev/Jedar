<?php
class dt_datetime extends data_type {
	public function mysql_field_type(){
        return 'datetime null';
    }
    public function form_html($value, $formerror, $name= false){
		$field = $this->config();
		if($value[$field['field_index']] == '0000-00-00 00:00:00'){
			$value[$field['field_index']] = '';
		}
		return parent::form_html($value, $formerror, $name);
	}
}
?>