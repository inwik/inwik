<?php
    if(!isset($_SESSION["login"])){
?>
        <ul>
            <li id="share-header"><a href="#" title="compartir"><i class="glyphicon glyphicon-share-alt"></i></a></li>
            <li id="login-header"><a href="#" title="entrar"><i class="glyphicon glyphicon-off"></i></a></li>
        </ul>
<?php
    }else{
        $this->u->user=$_SESSION["login"]["user"];
?>
        <ul>
            <li id="user-header">
                <a href="/usuario:<?=$this->u->user?>" title="perfil social">
                    <img src="app/templates/img/avatar/user.svg" />
                    <span><?=$this->u->user?></span>
                </a>
            </li>
            <li id="notifications-header"><a href="#" title="notificaciones"><i class="glyphicon glyphicon-bell"></i></a></li>
            <!--<li id="settings-header"><a href="/usuarios:usuario/preferencias" title="preferencias"><i class="fa fa-cog"></i></a></li>-->
            <li id="share-header"><a href="#" title="compartir"><i class="glyphicon glyphicon-share-alt"></i></a></li>
            <!--<li id="help-header"><a href="/ayuda" title="ayuda"><i class="fa fa-question-circle"></i></a></li>-->
            <li id="login-header"><a href="#" title="salir"><i class="glyphicon glyphicon-off"></i></a></li>
        </ul>
<?php
    }
?>
