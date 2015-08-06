<style>
    article.proposal_card{
       padding:25px;
    }
</style>


<article class="proposal_card">
    <div class="link-proposal"><a href="/<?=__('propuestas')?>/<?=$data['prop_url']?>"><?=$data['prop_title']?></a></div><div class="date-proposal"><?=$data['prop_date']?></div>
    <p class="description-proposal"><?=$data['prop_description']?></p>
    <p class="action-proposal"><a href="/<?=__('propuestas')?>/<?=$data['prop_url']?>?action=subscribe"><i class="fa fa-star"></i>Subscribirse</a><a href="/<?=__('propuestas')?>/<?=$data['prop_url']?>?action=share"><i class="fa fa-share-square-o"></i>Compartir</a><a href="/<?=__('propuestas')?>/<?=$data['prop_url']?>"><i class="fa fa-newspaper-o"></i>Leer más</a></p>
</article>
