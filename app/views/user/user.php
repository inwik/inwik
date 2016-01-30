<div class="container full_width">
    <aside class='aside_left'>
        <h4><i class="fa fa-users"></i> <?=("Redes sociales")?></h4>
        <p><?=("Siguiendo")?></p>
        <?=$this->data["followings"]?>
        <a href="#" title="<?=_("Ver más")?>"><i class="fa fa-plus"></i></a>
        <p><?=("Seguidores")?></p>
        <?=$this->data["followers"]?>
        <a href="#" title="<?=_("Ver más")?>"><i class="fa fa-plus"></i></a>
        <h4><i class="fa fa-trophy"></i> Logros</h4>
        <p></p>
        <p></p>
        <p></p>
        <a href="#" title="<?=_("Ver más")?>"><i class="fa fa-plus"></i></a>
        <h4><i class="fa fa-calendar-check-o"></i> Eventos próximos</h4>
        <p></p>
        <p></p>
        <p></p>
        <a href="#" title="<?=_("Ver más")?>"><i class="fa fa-plus"></i></a>
        <h4><i class="fa fa-star"></i> Subscripciones</h4>
        <p></p>
        <p></p>
        <p></p>
        <a href="#" title="<?=_("Ver más")?>"><i class="fa fa-plus"></i></a>
        <h4><i class="fa fa-user-secret"></i> Modo anónimo</h4>
    </aside>
    <section class='section_main full_width'>
        <div id="user-profile" data-profileid="<?=$this->data["id"]?>">
            <h3 id="realname" placeholder="Nombre real" contenteditable="false"><?=$this->data["name"]?></h3>
            <p id="description" placeholder="Descripción" contenteditable="false"><?=$this->data["description"]?></p>
            <div class="row">
                <div class="col-md-3" id="user-avatar">
                    <img class="img-circle" src="/app/templates/img/avatar/<?=$this->data["avatar"]?>" name="avatar">
                    <p id="username" contenteditable="false"><?=$_GET["token"]?></p>
                </div>
                <div class="col-md-9">
                    <ul id="user-info">
                        <li class="studies"><span class="glyphicon glyphicon-education" aria-hidden="true"></span><div placeholder="Estudios o conocimientos" contenteditable="false"><?=$this->data["studies"]?></div></li>
                        <li class="jobs"><span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span><div placeholder="Trabajos" contenteditable="false"><?=$this->data["jobs"]?></div></li>
                        <li class="residence"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span><div placeholder="Ubicación" contenteditable="false"><?=$this->data["residence"]?></div></li>
                        <?=$this->data["info_button"]?>
                    </ul>
                </div>
            </div>
        </div>
        <?=$this->data["new-post"]?>
        <section id="user-posts">
            <?=$this->data["post_cards"]?>
        </section>
    </section>
</div>
<script src="/app/views/user/user.js"></script>
