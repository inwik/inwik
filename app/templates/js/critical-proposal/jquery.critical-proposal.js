$(document).ready(function() {

	$('.close').click(function(){
		$('#fallacy-dialog').remove();
	});

	$('#social-aspects p, #economic-aspects p, #ecologic-aspects p, #proposal-view-action-local').mouseover(function(){/*al poner el cursor sobre estos apartados*/
		if (!$('#proposal-view-action-local').hasClass('tag-action') && !$('#proposal-view-action-local').hasClass('talk-action') && !$('#bgtransparent').length){
			$('#proposal-view-action-local').remove();
			$(this).after("<div id='proposal-view-action-local'><p>Selecciona una opción</p><a class='proposal-view-action' href='/propuestas/<?php echo $title; ?>'>Edición rápida</a><a class='proposal-view-action' id='tag-button' href='#'>Etiquetar falacia/sesgo</a><a class='proposal-view-action' id='talk-button' href='#'>Discutir</a></div>"); /*se despliega una lista de opciones*/

			$('#tag-button').click(function(){/*al pinchar sobre la opción de etiquetado*/
				$('#proposal-view-action-local').replaceWith("<div id='proposal-view-action-local' class='tag-action'><p>Selecciona el texto a etiquetar con una falacia o sesgo</p></div>");

				$('#social-aspects p, #economic-aspects p, #ecologic-aspects p').mouseup(function(){ /*al señalar el texto a etiquetar*/
					if ($('#proposal-view-action-local').hasClass('tag-action')){
						$(this).attr('contenteditable', 'false');
						var fallacydialog = "<div id='fallacy-dialog' contenteditable='false'><h2>¿Falacia o Sesgo?</h2><div><a href='#'><img id='fallacy-button' src='/resources/critical-proposal/images/falacias.png'></a><a href='#'><img id='bias-button' src='/resources/critical-proposal/images/sesgos.png'></a></div><div><span>Falacia</span><span>Sesgo</span></div></div>";
						var selection = document.getSelection();
						if (selection.toString().length > 20){ /*este numero variará según la información seleccionada mas adelante (hay que hacer una funcion para eso)*/
							$(this).attr('contenteditable', 'true');
							$(this).focus(document.execCommand("insertHTML", null, "<span class='select-text'>" + selection.toString() + "</span>"));/*añade la class select-text para trabajar con el*/
							$(".select-text").before("<div id='bgtransparent'></div>" + fallacydialog);
							$("#proposal-view-action-local").remove();
							$(this).attr('contenteditable', 'false');
						}

						$('#fallacy-button, #bias-button').click(function(){/*al pinchar en falacia o sesgo*/
							$('#bgtransparent, #fallacy-dialog').remove();
							if($(this).attr('id','fallacy-button')){
								$('.select-text').removeClass( "select-text" ).addClass( "fallacy" );
							}
							else{
								$('.select-text').removeClass( "select-text" ).addClass( "bias" );
							}
							return false;
						});
						$('#proposal-view-action-local').remove();
						return false;
					}
				});
				return false;
			});

			$('#talk-button').click(function(){
				$('#proposal-view-action-local').replaceWith("<div id='proposal-view-action-local' class='talk-action'><p>Estas son las discusiones</p></div>");
				return false;
			});

		}
	});

	$('aside').mouseover(function(){
		$('#proposal-view-action-local').remove();
	});

});
