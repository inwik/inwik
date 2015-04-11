<!--Header-login-->
<?php
    if(!empty($_SESSION['username'])) {
?>
    <script src='/resources/login-header/jquery.logout-header.js'></script>
<?php
    }else{
        if ($_SERVER['REQUEST_URI'] != '/' && !$_GET['activation']){
?>
    <script src='/resources/login-header/jquery.login-header.js'></script>
    <script src='/resources/validator/jquery.validator.js'></script>
    <link rel="stylesheet" href="/resources/validator/validator.css">
    <script src='/includes/login/jquery.sendLogin.js'></script>
    <script src='/includes/login/jquery.resendActivation.js'></script>

    <link rel="stylesheet" href="/resources/login-header/login-header.css">
    <div id="header-login-menu">
        <h4>Introduce tus datos para entrar</h4>
        <form>
            <p><input type="text" placeholder="Nombre de usuario" id="user" required></p>
            <p><input type="password" placeholder="Contraseña" id="pass" required></p>
            <div id="login-error">
                <p></p>
            </div>
            <div class='login-menu-options'>
                <p class='loginrec'><input id="loginrec" type="checkbox" name="loginrec"/> Recordar</p>
                <p><input type="button" value="Entrar"></p>
            </div>
        </form>
        <p><a href="/">No estoy registrado</a></p>
    </div>
<?php
        }
    }
?>
