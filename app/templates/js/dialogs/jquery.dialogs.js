function dialog(title, question, cancel, accept){

    var answer = new jQuery.Deferred();

    $("body").append("<div id='dialog'><div class='dialog-bg'></div><div class='dialog-window'><p class='dialog-title'>"+ title +"</p><p class='dialog-question'>"+ question +"</p><div class='dialog-actions'><button class='dialog-cancel'>"+ cancel +"</button><button class='dialog-accept'>"+ accept +"</button></div></div></div>");

    $("body").css("overflow", "hidden");

    $("body").on('click', '.dialog-cancel', function(){
        $("body").css("overflow", "auto");
        $("#dialog").remove();
        answer.resolve (false);
    });

    $("body").on('click', '.dialog-accept', function(){
        $("body").css("overflow", "auto");
        $("#dialog").remove();
        answer.resolve (true);
    });

    return answer.promise();
};
