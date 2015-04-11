<header>
    <div id="bgtransparent"></div>
    <div id="sms_ajaxdb"><div></div><button>Ok</button></div>
    <div id="notifications-panel"><div id="notifications-panel-wrapper"></div><div id="notifications-actions"></div></div>
    <div id="notifications-wrapper"></div>
    <div id="logo">
        <a href="index.php"><img src="app/templates/img/layout/logo-header.svg"/></a>
    </div>
    <nav id="top-menu">
        <ul>
            <li id="tab-prop"><a href="proposals">Propuestas</a></li>
            <li id="tab-proj"><a href="proyectos">Proyectos</a></li>
            <li id="tab-event"><a href="eventos">Eventos</a></li>
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
            <li id="notifications-header"><a href="#" rel="tipsy" title="notificaciones"><img src="app/templates/img/layout/notifications.svg"></a></li>
            <li id="settings-header"><a href="/usuarios:<?=$_SESSION['username']?>/preferencias" rel="tipsy" title="preferencias"><img src="app/templates/img/layout/settings.svg"/></a></li>
<?php
}
?>
            <li id="help-header"><a href="/ayuda" rel="tipsy" title="ayuda"><i class="fa fa-question-circle"></i></a></li>
        </ul>
    </div>
</header>
