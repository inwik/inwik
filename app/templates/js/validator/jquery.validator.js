$(document).ready(function() {

    var userval = /^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ_.-]{3,20}$/;
    var emailval = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
    var passval = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}/;
    var usermin = 3;
    var usermax = 20;
    var passmin = 6;
    var passmax = 20;


/*login*/
    $("#login-form :button").click(function (){
        $(".error").remove();
        $("#login-error p, #reg-error p").hide();

        if(!userval.test($("#user").val().trim())){
            $("#user").focus().after("<span class='error'>El nombre tiene que tener como mínimo "+ usermin +" caracteres. Puede contener caracteres alfanuméricos y los símbolos: . - _</span>");
            return false;
        }else if(!passval.test($("#pass").val().trim())){
			$("#pass").focus().after("<span class='error'>La contraseña no es correcta</span>");
			return false;
		}else{
            $("body").css('crosshair', 'progress');
			sendlogin();
		}
	});

    $("#header-login-menu :button").click(function (){
        $(".error").remove();
        $("#login-error p").hide();

        if(!userval.test($("#user").val().trim())){
            $("#user").focus().after("<span class='error'>El nombre tiene que tener como mínimo "+ usermin +" caracteres. Puede contener caracteres alfanuméricos y los símbolos: . - _</span>");
            return false;
        }else if(!passval.test($("#pass").val().trim())){
			$("#pass").focus().after("<span class='error'>La contraseña no es correcta</span>");
			return false;
		}else{
            $("body").css('crosshair', 'progress');
			sendlogin();
		}
	});


    $("#login-form input").keyup(function(e){
		if(e.keyCode == 13) {
            $("#login-form :button").click();
		}
	});

    $("#header-login-menu input").keyup(function(e){
		if(e.keyCode == 13) {
            $("#header-login-menu :button").click();
		}
	});

/*register*/
    $("#reg-form :button").click(function (){
        $(".error").remove();
        $("#login-error p, #reg-error p").hide();

        if(!userval.test($("#user-reg").val().trim())){
            $("#user-reg").focus().after("<span class='error'>El nombre tiene que tener como mínimo "+ usermin +" caracteres. Puede contener caracteres alfanuméricos y los símbolos: . - _</span>");
            return false;
        }else if(!passval.test($("#pass1-reg").val().trim()) ){
			$("#pass1-reg").focus().after("<span class='error'>La clave debe tener al menos 8 caracteres, una minúscula, una mayúscula y un número</span>");
			return false;
        }else if( $("#pass2-reg").val().trim()!= $("#pass1-reg").val().trim() ){
			$("#pass2-reg").focus().after("<span class='error'>Las contraseñas no coinciden</span>");
			return false;
        }else if( $("#email1-reg").val().trim() == "" || !emailval.test($("#email1-reg").val().trim()) ){
            $("#email1-reg").focus().after("<span class='error'>Ingrese un email correcto</span>");
            return false;
		}else if( $("#email2-reg").val().trim() != $("#email1-reg").val().trim() ){
            $("#email2-reg").focus().after("<span class='error'>Los email no coinciden</span>");
            return false;
        }else{
			sendregister();
		}
    });

	$("#reg-form input").keyup(function(e){
		if(e.keyCode == 13) {
            $("#reg-form :button").click();
		}
	});


/*create-new(proposal,project,event)*/
    $("#title-form").submit(function (){
        $(".error").remove();
		if( $("#title").val().trim().length <= 8){
			$("#title").focus().after("<span class='error'>El título de no puede estar en blanco ni ser demasiado corto</span>");
			return false;
		}
    });

/*error-clear*/
	$("#user, #pass, #user-reg, #pass1-reg, #pass2-reg, #email1-reg, #email2-reg, #title").keyup(function(e){
		if(e.keyCode != 13) {
			$(".error, #login-error p, #reg-error p").fadeOut();
			return false;
		}
	});
});
