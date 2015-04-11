$(document).ready(function() {
	var linkcount = 0;
    var xscroll;

	/*ejecuta comando*/
	function action(a,p) {
		if (p == null) p = false;
		$('.focused').focus(document.execCommand(a, null, p));
	};

	$( "body" ).on( "focus", "#text-title, #text-description, .text-section, .title-section, .text-aspect, .text-neutrality, .text-knowledge, .text-progress, .other-platform, .text-event", function() {
		$("*").removeClass("focused");
		$(this).addClass("focused");
		$('#text-size-dropdown ul').hide();
		$("*").removeClass("disabled");
        if($(window).width()<888){
            $("header").hide();
            $("#editor-tools").show();
        }
		var textid = $(this).attr('id');
		var textclass = $(this).attr('class');

		if ((textid=="text-title" || textid=="text-description") && textclass=="focused"){
			$("#text-size-dropdown , #button-bold, #button-italic, #button-removeformat, #button-link, #button-image, #button-video, #button-orderedlist, #button-bulletedlist, #button-indent, #button-outdent").addClass("disabled");
		}

		switch(textclass){
			case "title-section focused": case "text-neutrality focused":
				$("#text-size-dropdown , #button-bold, #button-italic, #button-removeformat, #button-link, #button-image, #button-video, #button-orderedlist, #button-bulletedlist, #button-indent, #button-outdent").addClass("disabled");
			break;

			case "other-platform focused":
				$("#text-size-dropdown, #button-image, #button-video, #button-orderedlist, #button-bulletedlist, #button-indent, #button-outdent").addClass("disabled");
			break;
		}
	});

	$('#button-undo').click(function() {
		if (!$('#button-undo').hasClass("disabled")){
			action('undo');
		}
		return false;
	});

	$('#button-redo').click(function() {
		if (!$('#button-redo').hasClass("disabled")){
			action('redo');
		}
		return false;
	});

/*Selector de cabecera*/
	$('#text-size-selected').click(function() {
		if (!$('#text-size-dropdown').hasClass("disabled")){
			$('#text-size-dropdown ul').toggle();
		}
		return false;
	});

	$('#text-size-dropdown li').click(function() {
		$("#text-size-label").text($(this).text());
		var textid = $(this).attr('id');
		switch (textid){
			case 'normal-text':
				var selection = 'p';
			break;
			case 'level1-text':
				var selection = 'H2';
			break;
			case 'level2-text':
				var selection = 'H3';
			break;
			case 'level3-text':
				var selection = 'H4';
			break;
		}
		$(".focused").focus();
		action('formatBlock',selection);

		$('#text-size-dropdown ul').hide();
	});

	$(".text-description, .text-section, .text-aspect, .text-neutrality").keyup(function(e){
		if(e.keyCode == 13) { /*si pulsas enter*/
			$("#text-size-label").text($("#normal-text").text());
			return false;
		}
	});
/*fin selector de cabecera*/


	$('#button-bold').click(function() {
		if (!$('#button-bold').hasClass("disabled")){
			action('bold');
		}
		return false;
	});

	$('#button-italic').click(function() {
		if (!$('#button-italic').hasClass("disabled")){
			action('italic');
		}
		return false;
	});

/*cargar url*/
	$('#button-link').click(function() {
		if (!$('#button-link').hasClass("disabled")){/*si no tiene la class disabled*/
			if (document.getSelection != ''){
				var word = document.getSelection();
			}
			else{
				var word = '';
			}
			var url = '';
			action('insertHTML',"<a href='#' class='urlclip'>"+ word +"</a>");
			$(".urlclip").after("<span id='urldialog'><div contenteditable='false'><p>Introduce la dirección del enlace</p><input type='url' id='urlinput'></div></span>");
			$("#urlinput").focus();

			$(window).click(function(event) {
				word = $(".urlclip").text();
				url = $("#urlinput").val();
				if (($(event.target).closest('#urldialog')).length>0) {/*para que no se cierre si clickeas en #urldialog*/
					return false;
				}
				else{
					var fstcharurl = url.charAt(0);
					if (fstcharurl != 'h'){
						$(".urlclip").replaceWith(word);
					}
					else{
						linkcount++;
						if (word == ''){
							$(".urlclip").replaceWith("<a href='"+ url +"'>"+ url + "[" + linkcount + "]" + "</a>");
						}
						else{
							$(".urlclip").replaceWith("<a href='"+ url +"'>"+ word + "[" + linkcount + "]" + "</a>");
						}
						$("#reference-links").append(linkcount + ". <a href='"+ url +"'>"+ url +"</a><br>");
					}
					$('#urldialog').fadeOut("fast", function(){ $(this).remove();});
					$(".focused").focus();
				}
			});

			$('#urlinput').keypress(function(e){
				if (e.keyCode == 13){
					$(window).click();
				}
			});

		}
		return false;
	});
/*fin cargar url*/


/*cargar imagen*/
	$('#button-image').click(function() {
		if (!$('#button-image').hasClass("disabled")){
			$( "#imgdialog" ).dialog("open");
		}
		return false;
	});

	$( "#imgdialog" ).dialog({
		autoOpen: false,
		modal: true,
		resizable: false,
		width:'auto',
		buttons:{
			"Aceptar": function(){
				var imgurl = $("#imgdialoginput").val();
				if (imgurl != ''){
					$(".focused").append( "<img src='"+ imgurl +"'>" );
				}
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			$(".focused").focus();
		}
	});
/*fin cargar imagen*/

/*cargar video*/
	$('#button-video').click(function() {
		if (!$('#button-video').hasClass("disabled")){
			$( "#videodialog" ).dialog("open");
		}
		return false;
	});

	$( "#videodialog" ).dialog({
		autoOpen: false,
		modal: true,
		resizable: false,
		width:'auto',
		buttons:{
			"Aceptar": function(){
				var videourl = $("#videodialoginput").val().trim();
				var videocode='';
				if (videourl != ''){
					if (videourl.charAt(0) == 'y'|| videourl.charAt(0) == 'w'){
						videourl = 'http://' + videourl;
					}

					var videoindex = videourl.indexOf('=');
					if (videoindex != -1){ /*es un video de youtube clasico ej.http://www.youtube.com/watch?v=QGnD2LfJ7Ng*/
						videocode = videourl.substring(videoindex+1);
					}
					else if (videourl.charAt(15) == '/'){ /*es un link de youtube corto ej.http://youtu.be/QGnD2LfJ7Ng*/
						videocode = videourl.substring(16);
					}
					if (videocode.length == 11){ /*si es un vídeo de youtube válido*/
						$(".focused").append( "<iframe id=\"ytplayer\" type=\"text/html\" width=\"300\" height=\"168.75\" src=\"https://www.youtube.com/embed/"+ videocode +"?showinfo=0\"	frameborder=\"0\" allowfullscreen>" );
					}

				}

				$( this ).dialog( "close" );
			}
		},

		close: function() {
			$(".focused").focus();
		}
	});

	/*fin cargar video*/

	$('#button-removeformat').click(function() {
		if (!$('#button-removeformat').hasClass("disabled")){
			action('removeFormat');
		}
		return false;
	});

	$('#button-orderedlist').click(function() {
		if (!$('#button-orderedlist').hasClass("disabled")){
			action('insertOrderedList');
		}
		return false;
	});

	$('#button-bulletedlist').click(function() {
		if (!$('#button-bulletedlist').hasClass("disabled")){
			action('insertUnorderedList');
		}
		return false;
	});

	$('#button-indent').click(function() {
		if (!$('#button-indent').hasClass("disabled")){
			action('indent');
		}
		return false;
	});

	$('#button-outdent').click(function() {
		if (!$('#button-outdent').hasClass("disabled")){
			action('outdent');
		}
		return false;
	});

/*Mobile functions-----------*/
    $(function(){
        $("#editor-buttons").swipe({
            swipeStatus:function(event,phase,direction,distance){
                if($(window).width()<810){
                    if(phase=="start"){
                        xscroll=parseInt($("#editor-buttons").css("left"), 10);
                    }
                    switch(direction){
                        case "left":
                            if(parseInt($("#editor-buttons").css("left"), 10) > ($(window).width() - 600 - 110)){
                                $("#editor-buttons").css("left",xscroll-distance+"px");
                            }
                        break;
                        case "right":
                            if(parseInt($("#editor-buttons").css("left"), 10) <= 25){
                                $("#editor-buttons").css("left",xscroll+distance+"px");
                            }
                        break;
                    }
                }
            },
            allowPageScroll:"vertical",
        });

        $(".button-edit").swipe({
            tap:function(){
                $(this).click();
            }
        });
    });

    $(window).resize(function() {
        if($(window).width()>=888){
            $("header, #editor-tools").show();
            $("#editor-buttons").css("left","90px");
        }
        else{
           $("#editor-buttons").css("left","25px");
        }
    });

    $("#button-ok").click(function(){
        $("header").show();
        $("#editor-tools").hide();
    });

/*proposals------*/

    $("#more-section").click(function(){
        $("<button class='erase_section' alt='borrar sección'>x</button><div class='title-section' style='display:none' contenteditable='true'>Título Sección</div><div class='text-section' style='display:none' contenteditable='true'></div>").appendTo($("#proposal-editor #sections")).slideDown("slow");
        return false;
    });

    $("#more-pro").click(function(){
        $("<button class='erase_pro'>x</button><input style='display: none;' type='text' class='text-neutrality'>").appendTo($("#text-pros")).slideDown("fast");
        return false;
    });

    $("#more-con").click(function(){
        $("<button class='erase_con'>x</button><input style='display: none;' type='text' class='text-neutrality'>").appendTo($("#text-cons")).slideDown("fast");
        return false;
    });

    /*erasing...*/
	$( "#editor" ).on( "click", ".erase_section", function() {
 		$(this).next().next(".text-section").remove();
 		$(this).next(".title-section").remove();
 		$(this).remove();
        return false;
    });
	$( "#editor" ).on( "click", ".erase_pro, .erase_con", function() {
 		$(this).next("input").remove();
 		$(this).remove();
        return false;
    });

/*events---------*/
/*metting-events*/
	$("#meeting-check").click(function() {
		if($("#meeting-check").is(':checked')){
			$("#meeting-event").slideDown();
			$('#map').gMap({ address: 'España', zoom:3 });
		}
		else{
			$("#meeting-event").slideUp();
		}
	});

	$('#address-ok').click(function(){
		var addr = $('#address').val();
		var place = $('#place-name').val();
		if (addr || addr.length ){
			$("#map").show().gMap({
				markers: [
				{
					address: addr,
					html: place
                }],
				address: addr, zoom:16
			});
		}
	});

	$('#address').keypress(function(e){
		if (e.keyCode == 13){
			$('#address-ok').click();
		}
	});

	/*virtual-events*/
	$("#virtual-check").click(function() {
		if ($("#virtual-check").is(':checked')){
			$("#virtual-event").slideDown();
		}
		else{
			$("#virtual-event").slideUp();
		}
	});

	$(".event-platform").click(function() {
		var platform = $(this).val();
		if ($(this).is(':checked')){
			$("#"+ platform +"-settings").slideDown();
		}
		else{
			$("#"+ platform +"-settings").slideUp();
		}
	});

});


