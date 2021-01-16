<?php

error_reporting(0);
ini_set('display_errors', true);


include_once '../includes/project.php';
include_once '../includes/mysql.class.php';

if (file_exists('../project/' . $project_folder . '/config/dbconfig.php')) {
    include_once '../project/' . $project_folder . '/config/dbconfig.php';
}

if($mysqlhost && $mysqluser && $mysqldb && $dbprefix) {
    $mysql = new mysqlclass($mysqlhost, $mysqluser, $mysqlpass, $mysqldb, $dbprefix);
}

if (file_exists('../project/' . $project_folder . '/config/globalconfig.php')) {
    include_once '../project/' . $project_folder . '/config/globalconfig.php';
}
if($mysqlhost && $mysqluser && $mysqldb && $dbprefix) {
    $mysql = new mysqlclass($mysqlhost, $mysqluser, $mysqlpass, $mysqldb, $dbprefix);
}

if (file_exists('../project/' . $project_folder . '/config/textconfig.php')) {
    include_once '../project/' . $project_folder . '/config/textconfig.php';
} else {
    include_once '../project/default/config/textconfig.php';
}

foreach ($_POST as $key => $value) {
    $_POST[$key] = strip_tags($_POST[$key]);
}

foreach ($_GET as $key => $value) {
    $_GET[$key] = strip_tags($_GET[$key]);
}

session_start();

include_once '../includes/language_setting.php';

if (!function_exists("get_sys_text")) {
    function get_systext($field, $lang = null) {
        global $selected_lang, $systext;
        if(isset($systext[$lang?$lang:$selected_lang][$field])){
            return $systext[$lang?$lang:$selected_lang][$field];
        } else {
            return $field;
        }
    }
}

if(!isset($_GET['redirect'])){
  $_GET['redirect'] = '';
}

?><!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><?php echo get_systext(is_array($project_name)?$project_name[$selected_lang]:$project_name); ?> <?php echo get_systext('login_admin'); ?></title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="build/css/custom.css" rel="stylesheet">
    <?php 
        if(file_exists('../project/'.$project_folder.'/admin/css')){
            foreach (scandir('../project/'.$project_folder.'/admin/css') as $file) {
                if( substr($file, strlen($file)-4) == '.css'){
                    ?><link href="<?php echo '../project/'.$project_folder.'/admin/css/'.$file; ?>" rel="stylesheet"><?php
                }
            }
        } 
    ?>
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <?php 
              $logo = '../project/' . $project_folder . '/images/logo.png';
              if (file_exists($logo)) {
                  echo '<img src="'.$logo.'" width="100%" style="margin-bottom:50px;">';
              }
            ?>
            <form action="index.php?redirect=<?php echo $_GET['redirect']; ?>" method="post" name="login_form">
              <input type="hidden" name="stage" value="login"/>
              <h1><?php echo get_systext(is_array($project_name)?$project_name[$selected_lang]:$project_name); ?> <?php echo get_systext('login_admin'); ?></h1>
              <div ><?php if ($_GET['message']) { echo htmlspecialchars($_GET['message']).'<br><br>'; } ?></div>
              <div>
                <input type="text" class="form-control" placeholder="<?php echo get_systext('login_username'); ?>"
                       name="cms_login"/>
              </div>
              <div>
                <input type="password" class="form-control" placeholder="<?php echo get_systext('login_password'); ?>" onkeypress="if(event.keyCode == 13){submit(this);}"
                       name="cms_password"/>
              </div>
              <div>
                <a class="btn btn-default submit" href="javascript:void(0);" onclick="document.forms['login_form'].submit();"><?php echo get_systext('login_login'); ?></a>
                <!-- <a class="reset_pass" href="#"><?php echo get_systext('login_forget_password'); ?></a> -->
              </div>
              <div class="clearfix"></div>
              <div class="separator">
                <?php if ($support_multi_lang) { ?>
                  <p class="change_link">
                    <?php if($selected_lang != 'en' && $support_lang['en']){ ?><a href="login.php?redirect=<?php echo $_GET['redirect']; ?>&lang=en" class="to_register">EN</a><?php } ?>
                    <?php if($selected_lang != 'tc' && $support_lang['tc']){ ?><a href="login.php?redirect=<?php echo $_GET['redirect']; ?>&lang=tc" class="to_register">繁體</a><?php } ?>
                    <?php if($selected_lang != 'sc' && $support_lang['sc']){ ?><a href="login.php?redirect=<?php echo $_GET['redirect']; ?>&lang=sc" class="to_register">简体</a><?php } ?>
                  </p>
                <?php } ?>
                <div class="clearfix"></div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>