$(document).ready(function() {
    var query='';
    var keypress=' ';
    var keycode;
    var position=0; //@ position
    var pattern = /(^@|\s@)([a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ_.-]+)/ig;
    var eleditable;


	$("div[contenteditable]").focusin(function(){
		$("#mentiondiv").removeAttr('id');
		$(this).attr('id', 'mentiondiv');
		eleditable = document.getElementById('mentiondiv');
	});

    $("#users-viewer").on('keyup', "#mentiondiv", function(e){
        var savedSel = rangy.getSelection().saveCharacterRanges(eleditable);

        var string = $(this).removeLinks();
        var replaced = string.replace(pattern, " <a href='/usuario:$2' class='mention'>@$2</a>").replace(/^\s+/,"");

        if ($(this).html() != replaced){
            $(this).html(replaced);
        }

        rangy.getSelection().restoreCharacterRanges(eleditable, savedSel);

        if (document.selection){
            var tagobject = document.selection.createRange().parentElement().tagName; // IE
            var textobject = document.selection.createRange().parentElement().textContent;
        }else{
            var tagobject = window.getSelection().anchorNode.parentNode.tagName; // everyone else
            var textobject = window.getSelection().anchorNode.parentNode.textContent;
        }

        //console.log(tagobject);
        if (tagobject == 'A'){
            query = textobject.replace('@','');
            mention(query);
        }

        if(keypress==' ' || keycode==13){
            $("#users-mention").remove();
        }
    });

    $("#users-viewer").on('keypress', "#mentiondiv", function(e){
        keypress = String.fromCharCode(e.which);
        keycode = e.keyCode;
        //console.log('keypress: ' + keypress);
    });

    $.fn.removeLinks = function () {
        var ce = $("<pre />").html(this.html());
        ce.find("a").replaceWith(function() { return this.innerHTML; });
        return ce.html();
    };

    $("#users-viewer").on("click", "#users-mention li",function(e){ //si pinchamos en un resultado insertamos el nombre seleccionado
        e.preventDefault();
        var savedSel = rangy.getSelection().saveCharacterRanges(eleditable);
        var long = query.length;
        var position = getPosition(eleditable);

        var string = $(this).find('span').text();
        var substring = string.substring(long,string.length);
        pasteHtmlAtCaret(substring + '&nbsp;');

        var string = $("#mentiondiv").removeLinks();
        $('#mentiondiv').empty();
        var replaced = string.replace(pattern, " <a href='/usuario:$2' class='mention'>@$2</a>").replace(/^\s+/,"");
        $("#mentiondiv").html(replaced);

        $("#users-mention").remove();
        if (!$('#mentiondiv').is(":focus")){ //firefox fix
            $('#mentiondiv').focus();
        }
        rangy.getSelection().restoreCharacterRanges(eleditable, savedSel);
        rangy.getSelection().move("character", substring.length+1);
    });

    function mention(query){
        if (query !=''){
            var parametros =
            {
                "query" : query
            };

            $.ajax({
				data: parametros,
				url: '/resources/mentions/userListMention.php',
				type: 'POST',
				dataType: "json",
				success:  function (users_list) {
					//$("#sms_ajaxdb").hide();
					$("#users-mention").remove();
					if(users_list.length > 0){

						var users_list_html = '';
						$.each(users_list, function(index, user) {
							if (user[2]==1){
								var avatar=user[0] + '.jpg';
							}
							else{
								var avatar='user.svg';
							}
							users_list_html = users_list_html + "<li><a href='#' data-id='"+ user[0] +"'><img src='/images/avatar/"+ avatar +"'><span>" + user[1] +"</span></a></li>";
						});

						$("#mentiondiv").after("<ul id='users-mention'>"+users_list_html+"</ul>");
					}
				},
				error:  function () {
					$("#sms_ajaxdb").fadeIn(500);
					$("#sms_ajaxdb div").html("Error ajax: no se ha podido consultar.");
				}
            });
        }else{
            $("#users-mention").removeClass('bg').html("");
        }
    }


    function pasteHtmlAtCaret(html) {
        var sel, range;
        if (window.getSelection) {
            // IE9 and non-IE
            sel = window.getSelection();
            if (sel.getRangeAt && sel.rangeCount) {
                range = sel.getRangeAt(0);
                range.deleteContents();

                // Range.createContextualFragment() would be useful here but is
                // non-standard and not supported in all browsers (IE9, for one)
                var el = document.createElement("div");
                el.innerHTML = html;
                var frag = document.createDocumentFragment(), node, lastNode;
                while ( (node = el.firstChild) ) {
                    lastNode = frag.appendChild(node);
                }
                range.insertNode(frag);

                // Preserve the selection
                if (lastNode) {
                    range = range.cloneRange();
                    range.setStartAfter(lastNode);
                    range.collapse(true);
                    sel.removeAllRanges();
                    sel.addRange(range);
                }
            }
        } else if (document.selection && document.selection.type != "Control") {
            // IE < 9
            document.selection.createRange().pasteHTML(html);
        }
    }

    function getPosition() {
        var element = eleditable;
        var caretOffset = 0;
        var doc = element.ownerDocument || element.document;
        var win = doc.defaultView || doc.parentWindow;
        var sel;
        if (typeof win.getSelection != "undefined") {
            var range = win.getSelection().getRangeAt(0);
            var preCaretRange = range.cloneRange();
            preCaretRange.selectNodeContents(element);
            preCaretRange.setEnd(range.endContainer, range.endOffset);
            caretOffset = preCaretRange.toString().length;
        } else if ( (sel = doc.selection) && sel.type != "Control") {
            var textRange = sel.createRange();
            var preCaretTextRange = doc.body.createTextRange();
            preCaretTextRange.moveToElementText(element);
            preCaretTextRange.setEndPoint("EndToEnd", textRange);
            caretOffset = preCaretTextRange.text.length;
        }
        return caretOffset;
    }

});
