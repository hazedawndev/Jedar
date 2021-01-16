<?php
class dt_tabs extends data_type {
    private $config;
    public function config($field=false){
        if($field){
            $this->clear_config();
            $this->config = parent::config($field);
            $this->config['allow_create'] = isset($field['extra']['allow_create'])?$field['extra']['allow_create']:true;
            $this->config['tabs'] = isset($field['tabs'])?$field['tabs']:$field[5];
            $this->config['field_default'] = isset($field['field_default'])?$field['field_default']:$field[6];
        }
        return $this->config;
    }

	public function form_details($value){
		$field = $this->config();
        $output = '<div class="dt-buttons btn-group">';
        $hidejs = '';
        $fn_name = "ct_".generateRandomString(5);

        foreach ($field['tabs'] as $key => $value) {
            list($tab, $label) = explode(',', $value);
            $output .= '<a class="btn btn-default btn-sm btn_'.$tab.'" tabindex="0" aria-controls="datatable-buttons" href="javascript:void(0);"';
            $output .= 'onclick="'.$fn_name.'(\''.$tab.'\');"><span>'.$label.'</span></a>';
            $hidejs .= "$('.$tab').hide();";
            $hidejs .= "$('.btn_$tab').removeClass('active');";
        }
        $output .= '<script type="text/javascript">';
        $output .= 'function '.$fn_name.'(tab) {';
        $output .= $hidejs;
        $output .= "$('.' + tab).show();\n";
        $output .= "$('.btn_' + tab).addClass('active');}\n";
        $output .= '$(function () {';
        $output .= $hidejs;
        $output .= $fn_name.'(\''.$field['field_default'].'\');';
        $output .= '});';
        $output .= '</script></div>';
        return $output;
	}

	// build html form field
    public function form_html($value, $formerror, $name= false){
    	$field = $this->config();
        return $this->form_details($value);
    	ob_start();
    	?><div class="dt-buttons btn-group">
            <?php $hidejs = ''; ?>
            <?php foreach ($field['tabs'] as $key => $value) { ?>
                <?php list($tab, $label) = explode(',', $value); ?>
                <a class="btn btn-default btn-sm btn_<?php echo $tab; ?>" tabindex="0"
                   aria-controls="datatable-buttons" href="javascript:void(0);"
                   onclick="ct_<?php echo $field['field_index']; ?>('<?php echo $tab; ?>');"><span><?php echo $label; ?></span></a>
                <?php $hidejs .= "$('.$tab').hide();"; ?>
                <?php $hidejs .= "$('.btn_$tab').removeClass('active');"; ?>
            <?php } ?>
            <script type="text/javascript">
                function ct_<?php echo $field['field_index']; ?>(tab) {
                    <?php echo $hidejs; ?>
                    $('.' + tab).show();
                    $('.btn_'+ tab).addClass('active');
                }
                $(function () {
                    <?php echo $hidejs; ?>
                    ct_<?php echo $field['field_index']; ?>('<?php echo $field['field_default']; ?>');
                });
            </script>
        </div><?php
        $cms_content = ob_get_contents();
		ob_end_clean();
		return $cms_content;
    }
}
?>