                <?php if (isset($curCfg['parent_table']) && $curCfg['parent_table'] && isset($tbCfgs[$curCfg['parent_table']]['oi']['sublist_shortcut'])) { ?>
                <div class="x_title">
                    <h2>
                            <?php
                            $parentTN = $curCfg['parent_table'];
                            echo get_systext($tbCfgs[$parentTN]['title']).':';

                            if($_GET['sl_id']){
                                foreach ($tbCfgs[$parentTN]['fields'] as $field) {
                                    if($_GET['sl_id'] == $field['admin_zconfigtable_fields_id']){
                                        $fieldInfo = $field;
                                        break;
                                    }
                                }
                                $key = $field['related_my_key']?$field['related_my_key']:$field['related_key'];
                                $parentInfo = $mysql->getData($tbCfgs[$parentTN]['table_name'], array($key => $_GET[$field['related_key']]));
                                $primarykey = $key . '=' . $_GET[$field['related_key']];
                            } else if(false) {
                                $parentInfo = $mysql->getData($tbCfgs[$parentTN]['table_name'], array($tbCfgs[$parentTN]['table_primarykey'] => $_GET[$curCfg['parent_related_key']]));
                                $primarykey = $tbCfgs[$parentTN]['table_primarykey'] . '=' . $_GET[$tbCfgs[$parentTN]['table_primarykey']];
                            }
                            
                            $mtOpts = tableOpt($tbCfgs[$parentTN]['option']);

                            if (is_string($curCfg['parent_show_title']) && !preg_match('/,/', $curCfg['parent_show_title'])) {
                                echo isset($mtOpts['support_language'])&&$mtOpts['support_language']? get_systext($parentInfo[$curCfg['parent_show_title'] . '_' . $selected_lang]) : get_systext($parentInfo[$curCfg['parent_show_title']]);
                            } else {
                                if(!is_array($curCfg['parent_show_title'])){
                                    $curCfg['parent_show_title'] = explode(',', $curCfg['parent_show_title']);
                                }
                                $titles = array();
                                foreach ($curCfg['parent_show_title'] as $title) {
                                    if(isset($tbCfgs[$parentTN]['fbi'][$title]['field_type']) && $tbCfgs[$parentTN]['fbi'][$title]['field_type'] == 'text'){
                                        if($parentInfo[$title]){
                                            $titles[] = $parentInfo[$title];
                                        }
                                    } else if(isset($tbCfgs[$parentTN]['fbi'][$title]['field_type']) && $tbCfgs[$parentTN]['fbi'][$title]['field_type'] == 'related'){
                                        if(getRelateValue($tbCfgs[$parentTN]['fbi'][$title], $parentInfo[$title])){
                                            $titles[] = getRelateValue($tbCfgs[$parentTN]['fbi'][$title], $parentInfo[$title]);
                                        }
                                    }
                                }
                                echo join(',', $titles);
                            }
                            ?><br>
                            <a href="<?php echo isset($tbCfgs[$parentTN]['modify_url']) && $tbCfgs[$parentTN]['modify_url']?'project_file.php?file='.str_replace('.php', '', $tbCfgs[$parentTN]['modify_url']):'content.php?'; ?><?php echo "&m=$m&t=".$tbCfgs[$parentTN]['table_index']; ?>&stage=modify&<?php echo $primarykey ?>"><span class="badge bg-green"><?php echo get_systext($tbCfgs[$parentTN]['title']); ?>&nbsp;<?php echo get_systext('list_details'); ?></span></a>
                            <?php foreach ($tbCfgs[$parentTN]['fields'] as $field) { ?>
                                <?php $fieldOpts = fieldOpt($field['field_options']); ?>
                                <?php $fieldClass = array(); ?>
                                <?php if(isset($fieldOpts['show_desktop'])){$fieldClass[] = 'show_desktop';} ?>
                                <?php if ($field['field_type'] == 'sublist') { ?>
                                    <?php $data_type->{'dt_'.$field['field_type']}->config($field); ?>
                                    <?php echo $data_type->{'dt_'.$field['field_type']}->list_value(array($tbCfgs[$parentTN]['table_primarykey'] => $_GET[$tbCfgs[$parentTN]['table_primarykey']]), true); ?>
                                <?php } ?>
                            <?php }  ?>

                            <a href="<?php echo get_link('backlist'); ?>"><span
                                    class="badge bg-green"><?php echo get_systext('btn_back'); ?><!--  <?php echo get_systext($tbCfgs[$parentTN]['title']); ?> <?php echo get_systext('btn_list'); ?> --></span></a>
                        &nbsp;&nbsp;
                    </h2>
                    <div class="clearfix"></div>
                </div>
                <?php } ?>