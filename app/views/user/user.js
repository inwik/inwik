$(document).ready(function() {
    $("#edit-info-button").click(function(){
       alert("por hacer");
    });

    $("body").on('click', "#follow-button", function(){
        var parametros={
            "friend": $("#user-profile").data("profileid")
        }

       $.ajax({
            url: '/index.php?section=user&action=follow',
            type: 'POST',
            data: parametros,
            success:  function (response) {
                if (response!=false){
                    $("#follow-button").replaceWith(response);
                }else{
                    alert("Ha habido un error");
                }
            },
            error:  function () {
                alert('Error ajax.');
            }
        });
    });

    $("body").on('click', "#unfollow-button", function(){
        var parametros={
            "friend": $("#user-profile").data("profileid")
        }

       $.ajax({
            url: '/index.php?section=user&action=unfollow',
            type: 'POST',
            data: parametros,
            success:  function (response) {
                if (response!=false){
                    $("#unfollow-button").replaceWith(response);
                }else{
                    alert("Ha habido un error");
                }
            },
            error:  function () {
                alert('Error ajax.');
            }
        });
    });
});
