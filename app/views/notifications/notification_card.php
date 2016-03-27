<div class='notification <?=$this->data["type"]?> <?=$this->data["class"]?>'>
    <a href='<?=$this->url?>'>
        <img src='/resources/notifications/icons/"+ type +".svg'>
        <p class='notification-title'><?=$this->data["title"]?></p>
        <p class='notification-text'><?=$this->data["body"]?></p>
    </a>
</div>
