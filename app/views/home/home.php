<div class="bg_home">
   <div class='social_home'>
       <ul>
            <li><a href="https://www.facebook.com/groups/223587212118/" title="facebook" target="_blank"><i class="fa fa-facebook-official"></i></a></li>
            <li><a href="https://github.com/inwik/inwik" title="GitHub" target="_blank"><i class="fa fa-github"></i></a></li>
        </ul>
   </div>
    <div class="home">
        <div class="row">
            <div class="col-md-6">
                <div id="texto" class="nomobile">
                    <header class="title">
                        <h2>Bienvenidos a inwik</h2>
                    </header>
                    <p>Esta es una versión alpha de inwik, es decir, una versión aún muy temprana del proceso de desarrollo. La mayoría de los modulos están incompletos o están parcialmente completados.</p>
                    <p>inwik es un proyecto/plataforma social de desarrollo e investigación sobre democracia participativa. Puedes ver el siguiente TEDx presentado por uno de los desarrolladores del proyecto en el que se resume las ideas sobre el funcionamiento. <b><a href="https://www.youtube.com/watch?v=1g_SQ8YRyRE" title="(Ver vídeo en youtube)" target="_blank" data-toggle="tooltip" data-placement="top" data-original-title="(Ver vídeo en youtube)">Inwik, democracia sostenible</a></b></p>
                    <p>Si deseas ayudar con el testing y desarrollo puedes hacernos llegar tus sugerencias e impresiones través de nuestro grupo abierto de desarrollo en <b><a href="https://www.facebook.com/groups/223587212118/" title="(Grupo de facebook)" target="_blank" data-toggle="tooltip" data-placement="top" data-original-title="(Grupo de facebook)">facebook</a></b>.</p>
                </div>
            </div>
            <div class="col-md-6">
                <div id="login">
                    <form id="login-form" data-toggle="validator" method="post">
                        <h2>¿Tienes una cuenta?</h2>
                        <div class="form-group">
                            <input type="text" class="form-control" name="username" placeholder="Nombre de usuario" maxlength="20" autocomplete="on" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Contraseña" maxlength="20" autocomplete="on" required>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input id="loginrec" type="checkbox" name="loginrec"> Mantener la sesión iniciada
                            </label>
                        </div>
                        <div id="login-error">
                            <p><?=$data["login_error"]?></p>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-default">Entrar</button>
                        </div>
                    </form>
                    <a href="#">¿olvidaste la contraseña?</a>
                </div>
                <div id="reg">
                    <form id="reg-form" data-toggle="validator" method="post">
                        <h2>¡Únete y participa!</h2>
                        <div class="form-group">
                            <input type="text" class="form-control" name="user_reg" placeholder="Nombre de usuario" maxlength="20" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="pass_reg" placeholder="Introduce una contraseña" maxlength="20" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Repite la contraseña" maxlength="20" required>
                        </div>
                        <div class="form-group">
                            <input type="email"  class="form-control" name="email_reg" placeholder="Correo electrónico" size="25" maxlength="50" required>
                        </div>
                        <!--<div class="form-group">
                            <input type=hidden class="form-control" name="recaptcha" value="" required>
                        </div>
                        <div class="g-recaptcha" data-sitekey="6Le_mgUTAAAAACn4uLXz6wDsQL9tR2Fw5AmD3JHU"></div>-->
                        <div id="reg-error">
                            <p><?=$data["reg_error"]?></p>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-default">Continuar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
