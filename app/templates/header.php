<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="robots" content="noindex,nofollow" >
		<title>inwik</title>
        <link rel="shortcut icon" sizes="196x196" href="../images/icons/icon196.png">
        <link rel="shortcut icon" sizes="128x128" href="../images/icons/icon128.png">
		<link rel="apple-touch-icon-precomposed" href="../images/icons/icon.png"/>
		<link rel="apple-touch-startup-image" href="../images/icons/icon.png" />
        <meta name="mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
		<link href='http://fonts.googleapis.com/css?family=Ubuntu:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Ubuntu+Mono' rel='stylesheet' type='text/css'>
		<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<!--Scripts---------->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
		<link rel="stylesheet" href="../resources/jquery-ui-inwik/jquery-ui-1.10.3.custom.min.css" />
		<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
        <!--TouchSwipe-->
        <script type="text/javascript" src="../resources/TouchSwipe/jquery.touchSwipe.min.js"></script>
        <!--PasteText-->
        <script type="text/javascript" src="../resources/pastetext/jquery.pastetext.js"></script>
        <script>pastetext()</script>
		<!--Chosen-->
		 <link rel="stylesheet" href="../resources/chosen/chosen.css">
        <!--Notifications-->
		<script src='../resources/notifications/jquery.notifications.js'></script>
		<link rel="stylesheet" href="../resources/notifications/notifications.css">
        <!--Dialogs-->
		<script src='../resources/dialogs/jquery.dialogs.js'></script>
		<link rel="stylesheet" href="../resources/dialogs/dialogs.css">
		<!--Styles---------------------------------->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />

		<link rel="stylesheet" href="../skins/common/common.css">
		<link rel="stylesheet" title="dark" href="../skins/dark/dark.css">
		<link rel="alternate stylesheet" title="light" href="../skins/light/light.css">
		<!--Tipsy-->
		<script src='../skins/common/resources/tipsy/jquery.tipsy.js'></script>
		<link rel="stylesheet" href="../skins/common/resources/tipsy/tipsy.css">
		<script type='text/javascript'>
			 $(function() {
			   $('a[rel=tipsy]').tipsy({fade: true, gravity: $.fn.tipsy.autoNS});
			 });
		</script>
		<!--Options-->
		<script src='../skins/common/resources/options/jquery.options.js'></script>
        <link rel="stylesheet" href="../skins/common/resources/options/options.css">
		<!--Menu-->
		<script src='../skins/common/resources/menu/jquery.menu.js'></script>
        <link rel="stylesheet" href="../skins/common/resources/menu/menu.css">
		<!--PerfectScrollbars-->
		<script src="../skins/common/resources/perfect-scrollbar-0.4.10/min/perfect-scrollbar-0.4.10.min.js"></script>
		<script src="../skins/common/resources/perfect-scrollbar-0.4.10/min/perfect-scrollbar-0.4.10.with-mousewheel.min.js"></script>
		<link rel='stylesheet' href="../skins/common/resources/perfect-scrollbar-0.4.10/min/perfect-scrollbar-0.4.10.min.css">
		<!--ResizeContainer-->
		<script src='../skins/common/resources/asideheight/jquery.asideheight.js'></script>
	</head>
	<body>
		<div id='wrapper'></div>
		<header>
			<div id="bgtransparent"></div>
			<div id="sms_ajaxdb"><div></div><button>Ok</button></div>
			<div id="notifications-panel"><div id="notifications-panel-wrapper"></div><div id="notifications-actions"></div></div>
			<div id="notifications-wrapper"></div>
			<div id="logo">
				<a href="/"><img src="../skins/common/images/logo-header.svg"/></a>
			</div>
			<a href="#" id="menu-button-mobile">
				<nav id="menu-icon-mobile"><button></button></nav>
				<span href="#" id="logo-mobile"><img src="../skins/common/images/logo-header.svg"/></span>
			</a>
			<nav id="top-menu">
				<ul>
					<li id="tab-prop"><a href="/propuestas">Propuestas</a></li>
					<li id="tab-proj"><a href="/proyectos">Proyectos</a></li>
					<li id="tab-event"><a href="/eventos">Eventos</a></li>
				</ul>
			</nav>
			<div id="top-derecha">
				<ul id='actions'>
<?php
    if(!empty($_SESSION['username'])) {
        include_once('user/User.php');
        $u = new User();
        $id = $u->readUser_id($_SESSION["username"]);
?>
					<li id="user-header">
						<a href="/usuario:<?=$_SESSION['username']?>" rel="tipsy" title="perfil social">
							<img src="../<?=$u->readUserAvatar($id)?>" />
							<span><?=$_SESSION['username']?></span>
						</a>
					</li>
					<li id="notifications-header"><a href="#" rel="tipsy" title="notificaciones"><img src="../skins/common/images/notifications.svg"></a></li>
					<li id="settings-header"><a href="/usuarios:<?=$_SESSION['username']?>/preferencias" rel="tipsy" title="preferencias"><img src="../skins/common/images/settings.svg"/></a></li>
<?php
    }
?>
					<li id="help-header"><a href="/ayuda" rel="tipsy" title="ayuda"><img src="../skins/common/images/help.svg"/></a></li>
				</ul>
			</div>
			<div id="top-derecha-mobile">
				<ul>
<?php
    if(!empty($_SESSION['username'])) {
?>
					<li id="notifications-header-mobile"><a href="#"><img src="../skins/common/images/notifications.svg"></a></li>
<?php
	}
?>
					<li id="search-header-mobile"><a href="#"><img src="../skins/common/images/search.svg"></a></li>
					<li id="options-button-mobile"><a href="#"><img src="../skins/common/images/options.svg"></a></li>
				</ul>
			</div>
			<ul id="options-menu-mobile">
<?php
    if(!empty($_SESSION['username'])) {

?>
				<li id="user-header-mobile"><a href="/usuario:<?=$_SESSION['username']?>"><img src="../<?=$u->readUserAvatar($id)?>" width="20px"/><span><?=$_SESSION['username']?></span></a></li>
				<li id="settings-header-mobile"><a href="/usuario:<?=$_SESSION['username']?>/preferencias"><img src="../skins/common/images/settings.svg"/><span>Preferencias</span></a></li>
<?php
    }
?>
				<li id="share-header-mobile"><a href="#" class="social-share"><img src="../skins/common/images/share.svg"/><span>Compartir</span></a></li>
				<li id="help-header-mobile"><a href="/ayuda"><img src="../skins/common/images/help.svg"/><span>Ayuda</span></a></li>
			</ul>
		</header>
