$(document).ready(function() {

    $(".g-recaptcha").attr("data-theme","dark");

    $(".g-captcha-response").

$("body").on('change', '#recaptcha-token', function(){
    alert($(".g-recaptcha").data("sitekey"));
    alert($(this).text());

    /*var parametros =
    {
        "secret" : $(".g-recaptcha").data("sitekey");
        "response" : $(this).text();
    };

    $.ajax({
            data: parametros,
            url: '../includes/user/updateComment.php',
            type: 'POST',
            beforeSend: function () {
                //$("#sms_ajaxdb div").html("...");
            },
            success: function (response) {
                if (response == true){
                    comment_text = elcomment.children('.comment-text').html();
                    commentDefault();
                }else{
                    elcomment.html(response);
                }
            },
            error:  function () {
                $("#sms_ajaxdb").fadeIn(500);
                $("#sms_ajaxdb div").html("Error ajax: no se ha podido actualizar la entrada.");
            }
    });*/
});
});
