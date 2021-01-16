<?php
class dt_html extends data_type {
	// build html form field
    public function form_html($value, $formerror, $name= false){
    	$field = parent::config();
    	return $field['field_name'];
    }
    public function mysql_field_type(){
		return 'text null';
	}
}
?>