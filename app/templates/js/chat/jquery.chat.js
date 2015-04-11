$(document).ready(function() {

	$('#chat-title').click(function() {
		if ($("#chat").hasClass("chat-expanded")){
			$("#chat").removeClass("chat-expanded");
			$("#max-chat").removeClass("min-chat");
		}
		else{
			$("#chat").addClass("chat-expanded");
			$("#max-chat").addClass("min-chat");
		}
			$("#messages, #messageinput").toggle();
	});

	$('#chat-close').click(function() {
			$("#chat").hide();
	});
});
