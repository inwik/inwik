<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <meta name="robots" content="noindex,nofollow" >
		<title><?=$this->data['page_title']." | ".PAGE_NAME?></title>
        <link rel="shortcut icon" sizes="196x196" href="<?=PAGE_DOMAIN?>/app/templates/img/icons/icon196.png">
        <link rel="shortcut icon" sizes="128x128" href="<?=PAGE_DOMAIN?>/app/templates/img/icons/icon128.png">
		<link rel="apple-touch-icon-precomposed" href="<?=PAGE_DOMAIN?>/app/templates/img/icons/icon.png"/>
		<link rel="apple-touch-startup-image" href="<?=PAGE_DOMAIN?>/app/templates/img/icons/icon.png" />
        <meta name="mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,400italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Ubuntu+Mono' rel='stylesheet' type='text/css'>
       	<link rel="stylesheet" href="<?=PAGE_DOMAIN?>/vendor/normalize.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<!--Scripts---------->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src='https://www.google.com/recaptcha/api.js'></script>
		<!--Styles---------------------------------->
		<link rel="stylesheet" href="<?=PAGE_DOMAIN?>/app/templates/css/common.css">
		<link rel="stylesheet" title="dark" href="<?=PAGE_DOMAIN?>/app/templates/css/dark.css">
		<link rel="alternate stylesheet" title="light" href="<?=PAGE_DOMAIN?>/app/templates/css/light.css">
	</head>
	<body>
      <!-- header -->
        <?php
            require_once DIR.'/app/templates/header.php';
        ?>
      <!-- end: header -->
      <!-- contenido -->
        <main>
            <?=$page?>
        </main>
      <!-- end: contenido -->
      <!-- footer -->
        <?php
           require_once DIR.'/app/templates/footer.php';
        ?>
        <!-- end: footer -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="<?=PAGE_DOMAIN?>/vendor/validator.min.js"></script>
        <script src="<?=PAGE_DOMAIN?>/vendor/cookiechoices/cookiechoices.js"></script>
        <script src="<?=PAGE_DOMAIN?>/app/templates/js/notify.js"></script>
        <script>
            $(document).ready(function(){
                $('[data-toggle="tooltip"]').tooltip();
            });

            document.addEventListener('DOMContentLoaded', function(event) {
                cookieChoices.showCookieConsentBar('Utilizamos cookies para proporcionarle un mejor servicio', 'Cerrar mensaje', 'Más información', 'http://example.com');
            });
        </script>
        <!--<script src="app/templates/js/recaptchaval.js"></script>-->
	</body>
</html>
