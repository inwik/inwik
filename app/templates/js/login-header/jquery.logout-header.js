$(document).ready(function() {
    $("#top-derecha #actions").append("<li><a href='#' rel='tipsy' id='header-logout-button' title='salir'><img src='../skins/common/images/login.svg'/></a></li>");
    $("#options-menu-mobile").append("<li id='logout-header-mobile'><a href='#'><img src='../skins/common/images/login.svg'/><span>Salir</span></a></li>");

    $("#header-logout-button, #logout-header-mobile").click(function (){
        exit();
        return false;
    });

    function exit(){
        $.ajax({
            url: 'resources/login-header/exit.php',
            success:  function (response) {
                    window.location.reload();
            },
            error:  function () {
				notify('Error', 'No se ha podido cerrar la sesión');            }
        });
    }
});
