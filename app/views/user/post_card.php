<article class="post_card card">
    <div class="card-title"><?=$data['prop_title']?></div>
    <div class="card-date"><?=$data['prop_date']?></div>
    <div class="card-text"><p><?=$data['prop_description']?></p></div>
    <div class="card-actions"><a href="/<?=__('propuestas')?>/<?=$data['prop_url']?>?action=subscribe"><i class="fa fa-star"></i>Subscribirse</a><a href="/<?=__('propuestas')?>/<?=$data['prop_url']?>?action=share"><i class="fa fa-share-square-o"></i>Compartir</a><a href="/<?=__('propuestas')?>/<?=$data['prop_url']?>"><i class="fa fa-newspaper-o"></i>Leer más</a></div>
</article>
