$(document).ready(function() {
    var propsanswer='';
    var usersanswer='';
    var answer='';

    $("#top-derecha").prepend("<div id='search'><input class='search-input' name='buscar' type='text' size='30' placeholder='Búsqueda'/><div class='search-answer'><ul></ul></div><button class='search-button' type='submit'><img title='buscar' src='../skins/common/images/search.svg'/></button></div>");

    $(".search-button").click(function(){
        $(".search-input").show().focus();
    });

    var delay = (function(){
        var timer = 0;
        return function(callback, ms){
            clearTimeout (timer);
            timer = setTimeout(callback, ms);
        };
    })();

    $(".search-input").keyup(function(){
        $(".search-answer ul").html("<li>Buscando...</li>");
        delay(function(){

            var query = $(".search-input").val();
            if (query.trim()!=''){
                $(".search-answer").show();
                propsearch(query);
            }
            else{
                $(".search-answer").hide();
            }
        }, 500 );
    });

    function propsearch(query){
        var parametros =
        {
            "propsearch" : query,
            "limit" : 10
        };

        $.ajax({
            data: parametros,
            url: '/resources/search/getAnswer.php',
            type: 'POST',
            dataType: "json",
            beforeSend: function () {
                    //$("#sms_ajaxdb").fadeIn(500);
                    //$("#sms_ajaxdb div").html("Consultando...");
            },
            success:  function (proposals_list) {
                //$("#sms_ajaxdb div").html(proposals_list);
                propsanswer='';
                if(proposals_list!==null && proposals_list.length!== 0){
                    $.each(proposals_list, function(index, proposal) {
                        propsanswer = propsanswer + "<li><a href='/propuesta:"+ proposal[0] + "->" + proposal[1] + "'>"+ proposal[1].replace(/[_]/g," ") +"</a></li>";
                    });
                    propsanswer = "<li class='search-title'><h3>PROPUESTAS</h3></li>" + propsanswer;
                }
                usersearch(query);
            },
            error:  function () {
                $("#sms_ajaxdb div").html("Error ajax: no se ha podido consultar las propuestas.");
            }
        });
    }

    function usersearch(query){
        var parametros =
        {
            "usersearch" : query,
            "limit" : 10
        };


        $.ajax({
            data: parametros,
            url: '/resources/search/getAnswer.php',
            type: 'POST',
            dataType: "json",
            beforeSend: function () {
                    //$("#sms_ajaxdb").fadeIn(500);
                    //$("#sms_ajaxdb div").html("Consultando...");
            },
            success:  function (users_list) {
                usersanswer='';
                if(users_list!==null && users_list.length!== 0){
                    $.each(users_list, function(index, user) {
                        if (user[2]==1){
                            var avatar=user[0] + '.jpg';
                        }
                        else{
                            var avatar='user.svg';
                        }
                        usersanswer = usersanswer + "<li><a href='/usuario:"+ user[1] +"'><img src='/images/avatar/"+ avatar +"'>"+ user[1] +"</a></li>";
                    });
                    usersanswer = "<li class='search-title'><h3>USUARIOS</h3></li>" + usersanswer;
                }
                getanswer();
            },
            error:  function () {
                    $("#sms_ajaxdb div").html("Error ajax: no se ha podido consultar.");
            }
        });
    }

    function getanswer(){
        var answer = propsanswer + usersanswer;
        if (answer.trim() != ''){
            $(".search-answer ul").html(answer);
        }else{
            $(".search-answer ul").html("<li>No se encontraron coincidencias</li>");
        }
    }

	$('body').click(function() {
		$(".search-input, .search-answer").hide();
	});

	$("#search").click(function(e){
		e.stopPropagation();
	});

});
