<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <meta name="robots" content="noindex,nofollow" >
		<title><?=$data['page_title']?></title>
        <link rel="shortcut icon" sizes="196x196" href="app/templates/img/icons/icon196.png">
        <link rel="shortcut icon" sizes="128x128" href="app/templates/img/icons/icon128.png">
		<link rel="apple-touch-icon-precomposed" href="app/templates/img/icons/icon.png"/>
		<link rel="apple-touch-startup-image" href="app/templates/img/icons/icon.png" />
        <meta name="mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
		<link href='http://fonts.googleapis.com/css?family=Ubuntu:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Ubuntu+Mono' rel='stylesheet' type='text/css'>
       	<link rel="stylesheet" href="vendor/normalize.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
		<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<!--Scripts---------->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src='https://www.google.com/recaptcha/api.js'></script>
		<!--Styles---------------------------------->
		<link rel="stylesheet" href="app/templates/css/common.css">
		<link rel="stylesheet" title="dark" href="app/templates/css/dark.css">
		<link rel="alternate stylesheet" title="light" href="app/templates/css/light.css">
	</head>
	<body>
      <!-- header -->
        <?php
            require_once 'app/templates/header.php';
        ?>
      <!-- end: header -->
      <!-- contenido -->
        <main>
            <?=$page?>
        </main>
      <!-- end: contenido -->
      <!-- footer -->
        <?php
           require_once 'app/templates/footer.php';
        ?>
        <!-- end: footer -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src="vendor/validator.min.js"></script>
        <script src="vendor/cookiechoices/cookiechoices.js"></script>
        <script>
          document.addEventListener('DOMContentLoaded', function(event) {
            cookieChoices.showCookieConsentBar('Utilizamos cookies para proporcionarle un mejor servicio',
              'Cerrar mensaje', 'Más información', 'http://example.com');
          });
        </script>
        <!--<script src="app/templates/js/recaptchaval.js"></script>-->
	</body>
</html>
