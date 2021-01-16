<?php

// password enctyption key
$encryptKey = 'ASDF1234$#%^SDFwertG';



// email setting , below setting for gmail this email client use phpmailer file in /includes/phpmailer
$emailConfig = array(
    'type' => 'smtp', // smtp or mail
    'smtp' => array(
        'Host' => 'smtp.gmail.com',
        'Port' => 587,
        'SMTPSecure' => 'tls',
        'SMTPAuth' => TRUE,
        'Username' => 'example@gmail.com',
        'Password' => 'example'
    )
);

?>