        <ul>
            <li id="share-header"><a href="#" title="compartir" data-toggle="tooltip" data-placement="bottom"><i class="glyphicon glyphicon-share-alt"></i></a></li>
<?php
    if(!isset($_SESSION["login"])){
?>
            <li id="login-header"><a href="#" title="entrar" data-toggle="tooltip" data-placement="bottom"><i class="glyphicon glyphicon-off"></i></a></li>
        </ul>
<?php
    }else{
        $this->u->user=$_SESSION["login"]["user"];
?>
            <li id="user-header">
                <a href="<?=$this->u->user?>" title="Perfil Social" data-toggle="tooltip" data-placement="bottom">
                    <img src="app/templates/img/avatar/user.svg" />
                    <span><?=$this->u->user?></span>
                </a>
            </li>
            <li id="notifications-header"><a href="#" title="Notificaciones" data-toggle="tooltip" data-placement="bottom"><i class="glyphicon glyphicon-bell"></i></a></li>
            <!--<li id="settings-header"><a href="/usuarios:usuario/preferencias" title="preferencias"><i class="fa fa-cog"></i></a></li>-->
            <!--<li id="help-header"><a href="/ayuda" title="ayuda"><i class="fa fa-question-circle"></i></a></li>-->
            <li id="login-header"><a href="#" title="Salir" data-toggle="tooltip" data-placement="bottom"><i class="glyphicon glyphicon-off"></i></a></li>
<?php
    }
?>
        </ul>
