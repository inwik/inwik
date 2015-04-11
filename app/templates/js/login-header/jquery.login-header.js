$(document).ready(function() {
    $("#top-derecha #actions").append("<li><a href='#' rel='tipsy' id='header-login-button' title='entrar'><img src='../skins/common/images/login.svg'/></a></li>");
    $("#options-menu-mobile").append("<li id='login-header-mobile'><a href='/'><img src='../skins/common/images/login.svg'/><span>Entrar</span></a></li>");


    $("#header-login-button").click(function (){
			$("#header-login-menu").toggle("fast");
            $("#header-login-menu #user").focus();
            $("#bgtransparent").show("fast");
			return false;
	});

	$("#bgtransparent").click(function (){
			$("#header-login-menu").hide("fast");
			return false;
	});
});
