<?php

// image config type , width , height , accpet format, watermark, limit size MB
$imageConfig = array(
    'cms_trainee_programme_image.trainee_programme_image1' => array('resize', 800, 600, '.jpg,.jpeg,.png', null, 2),
    'cms_trainee_programme_image.trainee_programme_image2' => array('resize', 800, 600, '.jpg,.jpeg,.png', null, 2),
    'cms_trainee_programme_image.trainee_programme_image3' => array('resize', 800, 600, '.jpg,.jpeg,.png', null, 2),
    'cms_intern_programme_image.intern_programme_image1' => array('resize', 800, 600, '.jpg,.jpeg,.png', null, 2),
    'cms_intern_programme_image.intern_programme_image2' => array('resize', 800, 600, '.jpg,.jpeg,.png', null, 2),
    'cms_intern_programme_image.intern_programme_image3' => array('resize', 800, 600, '.jpg,.jpeg,.png', null, 2),
    'cms_trainee_assessment.trainee_assessment_bg' => array('resize', 1142, 563, '.jpg,.jpeg,.png', null, 2),

    'cms_home_discover.home_discover_image1' => array('resize', 800, 600, '.jpg,.jpeg,.png', null, 10),
    'cms_home_discover.home_discover_image2' => array('resize', 800, 600, '.jpg,.jpeg,.png', null, 10),

    'career_talk.image_id' => array('resize', 800, 600, '.jpg,.jpeg,.png', null, 2),

    'banner.image_id' => array('crop', 1600, 700, '.jpg,.jpeg,.png', null, 10),

    'banner2.image_id' => array('crop', 1600, 700, '.jpg,.jpeg,.png', null, 10),
);

$videoConfig = array(
    'banner.video_id' => array('.mp4', 'video/mp4', 10),
    'banner2.video_id' => array('.mp4', 'video/mp4', 10),
);

$fileConfig = array(
    'form_intern.cv' => array(null, null, 10),
    'form_intern.cover_letter' => array(null, null, 10),
    'form_trainee.cv' => array(null, null, 10),
    'form_trainee.cover_letter' => array(null, null, 10),
);

?>