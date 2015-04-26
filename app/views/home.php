<div class="row">
    <div class="col-md-8">
        <div id="video">
            <iframe id="ytplayer" width="500" height="281.25" src="//www.youtube.com/embed/1g_SQ8YRyRE?showinfo=0&autohide=1" frameborder="0" allowfullscreen></iframe>
        </div>
        <div id="texto">
            <h2>Atención, software en construcción</h2>
            <p>
                Esta es una versión alpha de inwik, es decir, una versión aún muy temprana del proceso de desarrollo.</br>
                La mayoría de los modulos están incompletos o están parcialmente completados.</br>
                Puedes probar la parte de registro, perfil, timeline y propuestas inclusive su creación, edición y visionado.</br>
                Si deseas ayudar con el testing y desarrollo puedes hacernos llegar tus sugerencias e impresiones través de nuestro grupo abierto de desarrollo en <b><a href="https://www.facebook.com/groups/223587212118/">facebook</a></b>.
            </p>
            <h2>¿Qué es inwik?</h2>
            <p>
                Es un proyecto de software libre desarrollado por <b><a href="http://wikipartido.es">WikiPartido</a></b>
                para la construcción de una plataforma social online que permita la participación ciudadana desde cualquier lugar e instante.
                Es la primera plataforma que combinará un sistema de voto junto con un sistema de deliberación colectiva de forma inteligente y crítica.</br></br>
                Con inwik será posible la redacción de propuestas de ley de forma horizontal y descentralizada, conviertiendolas en vinculantes de forma automatizada
                gracias al algoritmo critic-rank que estamos desarrollando para hacer posible que sea una plataforma escalable en la que puedan participar en asamblea permanente millones de personas.</br></br>
                En el código fuente de este software está arraigado	el fomento del pensamiento crítico, herramienta esencial para conseguir rigor argumental para los debates y evitar la manipulación de la ciudadanía con sesgos o falacias.
                Inwik es la primera plataforma que no solo proporcionará horizontabilidad y transparencia, sino también un modelo sostenible de democracia en la que se evite de forma efectiva la demagogia y oclocracia, y un sistema eficiente y escalable masivamente.
                </br></br>
                ¿Dudas? ¿Sugerencias? ¿Críticas? No dudes en hacernoslas llegar a través de info@wikipartido.es, twitter o facebook.
            </p>
        </div>
    </div>
    <div class="col-md-4">
        <div id="login">
            <form id="login-form" data-toggle="validator" method="post" action="">
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
                    <p><p><?=$data["reg_error"]?></p></p>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-default">Continuar</button>
                </div>
            </form>
        </div>
    </div>
</div>
