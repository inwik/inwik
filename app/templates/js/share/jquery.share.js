$(document).ready(function() {

    $("#help-header").before("<li id='share-header'><a href='#' rel='tipsy' title='compartir' class='social-shar'><img src='../skins/common/images/share.svg'/></a></li>");

    $("header").on('click', '#share-header', function (){
        $("#social-bar").toggle("fast");
        $("#bgtransparent, #options-menu-mobile").hide();
        return false;
	});

    $(".social-share").click(function (){
        $("#social-bar").toggle("fast");
        $("#bgtransparent, #options-menu-mobile").hide();
        return false;
	});


	$("#social-bar-close").click(function (){
        $("#social-bar").hide("fast");
        return false;
	});
});


