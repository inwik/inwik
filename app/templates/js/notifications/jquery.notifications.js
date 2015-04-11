/*DOCUMENTACIÓN NOTIFICACIONES
	notify(title, text, link, type, from, time, classattr);
	title = título de la notificación
	text = mensaje principal
	link = enlace de la notificación, al pinchar sobre ella redirige a este enlace. Con 'default' o '' el link se desactiva.
	type = tipo de notificación (warning, info, wins, proposal, project, event, default)
	from = usuario que realiza la acción del mensaje
	time = tiempo de la animación en ms, 0 para infinito (la notificación no desaparece), default o '' tiempo 7000.
	classattr = clase de la notificación. Permite css y scripts propios.

	Ejemplos:
	notify('Nueva entrada en tu perfil', 'Hola me presento, me llamo albertoi, estoy programando las notificaciones. Un saludo.', '/usuario:albertoi', 'default', '1');
	notify('Trofeo: Master Troll', 'Has ganado un trofeo por trollero. La culpa la tiene Darío.', '/usuario:dariomehr', 'wins');
	notify('¡Aviso!', 'No tienes permisos para realizar esta acción. Para registrarte pincha aquí.', '/', 'warning');
	notify('¡Te has conectado correctamente!', 'En breve estarás dentro y podrás participar en la comunidad','','info', '', '0');
	notify('Nuevo sistema educativo', 'Nueva edición importante en la propuesta a la que estás subscrito','/propuesta:1','proposal');
	notify('Nuevo evento publicado', 'Reunión por mumble 20/07/2014 a las 20:00','/evento:1','event');
	notify('Nuevo proyecto publicado', 'Estatutos para presentación del partido','/proyecto:1','project');*/

var notify = function(title, text, link, type, from, time, classattr) {
	title = "<p class='notification-title'>" + title + "</p>";
	text = "<p class='notification-text'>" + text + "</p>";
	var avatar, icon = '';
	var $message = '';
	if (link == '' || link == 'default' || link == undefined)link='#';
	if (time == '' || time == 'default' || time == undefined)time=7000;

	switch(type){
		case 'warning': case 'info': case 'wins': case 'proposal': case 'project': case 'event':
			icon = "<img src='/resources/notifications/icons/"+ type +".svg'>";
			$message = $("<div class='notification "+ type +" "+ classattr +"'><a href='" + link + "'>" + icon + title + text + "</a></div>");
			sendnotify($message);
		break;

		default:
			if (from!='' || from != undefined || from != '0'){
				whoisfrom(from);
			}else{
				$message = $("<div class='notification "+ classattr +"'><a href='" + link + "'>" + title + text + "</a></div>");
				sendnotify($message);
			}
	}

	function whoisfrom(from){
		var parametros =
		{
			"from" : from
		};

		$.ajax({
			data: parametros,
			url: '/resources/notifications/getFromAvatar.php',
			type: 'POST',
			success:  function (avatar) {
				if (avatar==1){
					var avatar = "<img src='/images/avatar/"+ from + ".jpg'>";
				}
				else{
					var avatar = "<img src='/images/avatar/user.svg'>";
				}
				$message = $("<div class='notification "+ classattr +"'><a href='" + link + "'>" + avatar + title + text + "</a></div>");
				sendnotify($message);
			},
			error:  function () {
				notify('Error', 'No se ha podido cargar correctamente la notificación', '', 'warning');
			}
		});
	}


	function sendnotify($message){
		$('#notifications-wrapper').append($message);
		$message.animate({
		 	right: parseInt($message.css('right'),350) == 0 ?
			-$message.outerWidth() : 0
		}, function() {
			if (time != 0){
				window.setTimeout(function() {
					$message.animate({
						right: parseInt($message.css('right'),0) == 0 ?
						-$message.outerWidth() : 0
					}, function(){
						$message.remove();
					})
				}, time);
			}
		});
	}
}

$(document).ready(function() {
	newNotifications();
	countNotifications();

	setInterval(function(){
		countNotifications();
		newNotifications();
	}, 40000);

	//Contar notificaciones y añadir al icono
	function countNotifications(){
		$(".notifications-count").remove();

		$.ajax({
			url: '/resources/notifications/countNotifications.php',
			type: 'POST',
			success:  function (count) {
				if (count>0){
					$("<div class='notifications-count'><p>"+count+"</p></div>").appendTo("#notifications-header a").fadeIn(1000);
					$("<div class='notifications-count'><p>"+count+"</p></div>").appendTo("#notifications-header-mobile a").fadeIn(1000);
				}
			},
			error:  function () {
				notify('Error', 'No se han podido consultar las notificaciones', '', 'warning');
			}
		});
	}

	//Buscar nuevas notificaciones
	function newNotifications(){
		$.ajax({
			url: '/resources/notifications/newNotifications.php',
			type: 'POST',
			dataType: "json",
			success:  function (notifications_list) {
				$.each(notifications_list, function(index, notification) {
					notify(notification[3], notification[4], notification[5], notification[6], notification[2], '', notification[7]);
				});
				watchNotifications();
			},
			error:  function () {
				notify('Error', 'No se han podido consultar las nuevas notificaciones', '', 'warning');
			}
		});
	}

	//Marcar como vistas
	function watchNotifications(){
		$.ajax({
			url: '/resources/notifications/markAsWatched.php',
			type: 'POST',
			success:  function (response) {
				if (response == true){
					//notify('Información', 'Todas las notificaciones se han marcado como vistas', '', 'info');
				}else{
					notify('Error', 'No se han podido marcar como vistas las nuevas notificaciones', '', 'warning');
				}
			},
			error:  function () {
				notify('Error', 'No se han podido marcar como vistas las nuevas notificaciones', '', 'warning');
			}
		});
	}

	$("#notifications-header a, #notifications-header-mobile a").click(function(e){
		e.preventDefault();
		if ($("#notifications-panel").is(':visible')){
			$("#notifications-panel-wrapper, #notifications-actions").empty();
			$("#notifications-panel").hide();
		}else{
			$.ajax({
				url: '/resources/notifications/noDisturbStatus.php',
				type: 'POST',
				success:  function (nodisturb) {
					getNotifications(nodisturb);
				},
				error:  function () {
					notify('Error', 'No se han podido consultar las notificaciones', '', 'warning');
				}
			});

			function getNotifications(nodisturb){
				if (nodisturb == true){
					nodisturb = 'checked';
				}else{
					nodisturb = '';
				}

				$.ajax({
					url: '/resources/notifications/getNotifications.php',
					type: 'POST',
					success:  function (response) {
						$("#notifications-panel").show();
						$("#notifications-panel-wrapper").append(response);
						$("#notifications-actions").append( "<p id='no-disturb'>No molestar</p><div class='onoffswitch'><input type='checkbox' name='onoffswitch' class='onoffswitch-checkbox no-disturb' id='myonoffswitch'"+ nodisturb +"><label class='onoffswitch-label' for='myonoffswitch'><span class='onoffswitch-inner'></span><span class='onoffswitch-switch'></span></label></div><a href='#' id='markallasread'>Marcar todas como leías</a>");
					},
					error:  function () {
						notify('Error', 'No se han podido consultar las notificaciones', '', 'warning');
					}
				});
			}
		}
	});

	$("#notifications-panel").on('click', '.notification', function(e){
		var elnotification = $(this);
		var parametros =
		{
			"date" : elnotification.data('date')
		};

		$.ajax({
			data: parametros,
			url: '/resources/notifications/markAsRead.php',
			type: 'POST',
			success:  function (response) {
				if (response == true){
					elnotification.addClass('read');
					countNotifications();
					//notify('Información', 'Notificación marcada como leía correctamente', '', 'info');
				}else{
					notify('Error', 'No se ha podido marcar la notificación como leída', '', 'warning');
				}
			},
			error:  function () {
				//notify('Error', 'No se ha podido marcar la notificación como leída', '', 'warning');
			}
		});
	});

	$("#notifications-panel").on('change', '.no-disturb', function(e){
		if($(this).is(':checked')) {
			var status = 'checked';
		}else{
			var status = 'nochecked';
		}

		var parametros =
		{
			"status" : status
		};

		$.ajax({
			data: parametros,
			url: '/resources/notifications/changeNoDisturb.php',
			type: 'POST',
			success:  function (response) {
				if (response == true){
					//notify('Información', 'Opción de no molestar cambiada correctamente', '', 'info');
				}else{
					notify('Error', 'No se ha podido cambiar la opción de no molestar', '', 'warning');
				}
			},
			error:  function () {
				notify('Error', 'No se ha podido cambiar la opción de no molestar', '', 'warning');
			}
		});
	});

	$("#notifications-panel").on('click', '#markallasread', function(e){
		e.preventDefault();
		var elnotification = $(this);

		$.ajax({
			url: '/resources/notifications/markAllAsRead.php',
			type: 'POST',
			success:  function (response) {
				if (response == true){
					$("#notifications-panel .notification").addClass('read');
					$("#notifications-count").fadeOut('fast', function() {$(this).remove();} );
					countNotifications();
					//notify('Información', 'Todas las notificaciones se han marcado como leídas', '', 'info');
				}else{
					notify('Error', 'No se han podido marcar las notificaciones como leídas', '', 'warning');
				}
			},
			error:  function () {
				notify('Error', 'No se ha podido marcar las notificaciones como leídas', '', 'warning');
			}
		});
	});

	$('body').click(function() {
		$("#notifications-panel-wrapper, #notifications-actions").empty();
		$("#notifications-panel").hide();
	});

	$("#notifications-panel").click(function(e){
		e.stopPropagation();
	});

	$("#notifications-panel-wrapper").perfectScrollbar({
	  wheelSpeed: 20,
	  wheelPropagation: false,
	  scrollXMarginOffset: 5,
	  includePadding: true,
	  minScrollbarLength: 20
	})

});
