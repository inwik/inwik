        <link rel="stylesheet" href="../resources/forum/forum.css">

		<script type="text/javascript">
			$(document).ready(function() {

				$("#comments").hide(); //al principio solo se muestran talks (titulos)

		/*** VIEW FIRST COMMENTS FROM TALKS - VER COMENTARIOS DE PRIMER ORDEN ***/

				$( "#macriforum" ).on( "click", "#talks .talk", function() {

					var talk = $(this).attr('proposaltalk');
				    var varajax_talk =
				    {
				    	//"proposal" : "<?php echo $id; ?>",
				    	"father" : "NULL",
		                "talk" : talk
					};

					//alert ("VARAJAX 0 :"+varajax_talk["father"]+"--"+varajax_talk["talk"]);

				    $.ajax({
				        data: varajax_talk,
				        //url: '../resources/forum/forum_view.php',
                        url: '../resources/forum/forum_view.php',
				        type: 'POST',
				        beforeSend: function () {
				        		$("#talks").hide();
								$("#comments").show();
				                //$("#comments").html("Consultando...");
				                $("#comments").html("<img src='../resources/forum/loading.gif'/>");
				        },
				        success:  function (responses) {
				        		//alert(responses);
				                $("#comments").html(responses);
				        },
				        error:  function () {
				                $("#comments").html("Error ajax2: no se ha podido consultar.");
				        }
				    });
				});

		/*** VIEW COMMENTS FROM COMMENTS - VER COMENTARIOS SECUNDARIOS ***/

				$( "#macriforum" ).on( "click", "#comments .comment_talk, button.commentalk", function() {

					var father = $(this).attr('proposalcomment');
					var talk = $(this).attr('proposaltalk');
				    var varajax_comment =
				    {
				    	"father" : father,
		                "talk" : talk
					};
					//alert ("VARAJAX 1 :"+varajax_comment["father"]+"--"+varajax_comment["talk"]);

				    $.ajax({
				        data: varajax_comment,
				        url: '../resources/forum/forum_view.php',
				        type: 'POST',
				        beforeSend: function () {
				                $("#comments").html("<img src='../resources/forum/loading.gif'/>");
				        },
				        success:  function (responses) {
				                $("#comments").html(responses);
								//$("#talks").hide();
								//$("#comments").show();
				        },
				        error:  function () {
				                $("#talks").html("Error ajax3: no se ha podido consultar.");
				        }
				    });
				});

		/** VIEW TALKS **/
				$( "#macriforum" ).on( "click", "button.talk", function() {
					$("#comments").hide();
					$("#talks").show();
 				});

 		/** AÑADIR TALK/COMENTARIO **/
				$( "#macriforum" ).on( "click", "button.commentadd, button.talkadd", function() {

					var text = "";
					var clase = $(this).attr('class');
					if (clase=='talkadd') text = $('textarea.talkadd').val();
					else text = $('textarea.commentadd').val();
					var talk = $(this).attr('proposaltalk'); //si hay talk se añade comment sino talk
					var father = $(this).attr('proposalcomment');
					var type = "normal";

				    var varajax_add =
				    {
				    	"talk" : talk, //comment
				    	//"creator" : usuario, //talk //comment
				    	"creator" : "<?php if(!empty($_SESSION['username'])) { echo $u->readUser_id($_SESSION['username']); }?>",

				    	"father" : father, //comment
				    	"type" : type, //comment
				    	"text" : text, //talk //comment
		                "proposal" : "<?php echo $id; ?>" //talk
					};
					//alert("talk:"+varajax_add["talk"]+"_creator:"+varajax_add["creator"]+"_father:"+varajax_add["father"]+"_type:"+varajax_add["type"]+"_text:"+varajax_add["text"]+"_proposal:"+varajax_add["proposal"]);

					if (varajax_add["creator"]=="") {
						alert("Para escribir en el foro necesitas una cuenta de usuario.");

					}else if( varajax_add["text"]=="" ){
						alert("Texto vacío.");
					}else{
					    $.ajax({
					        data: varajax_add,
					        url: '../resources/forum/forum_add.php',
					        type: 'POST',
					        beforeSend: function () {
					        		//alert(":|");
					                if (varajax_add["talk"]=="NULL"){
					                	//alert("talks");
					                	$("#talks").append("<img src='../resources/forum/loading.gif'/>");
				                    }else{
					                	//alert("comment");
					                	$("#comments").append("<img src='../resources/forum/loading.gif'/>");
					                }

					        },
					        success:  function (responses) {
					        		//alert(":D");
					               // $("#macriforum").append("Ok:");

					               // alert(responses);

					                if (varajax_add["talk"]=="NULL"){
					                	//alert("talks");
					                	$("#talks").html(responses);
				                    }else{
					                	//alert("comment");
					                	$("#comments").html(responses);
					                }
					        },
					        error:  function () {
					        		//alert(":_(");
					                $("#macriforum").append("Error ajax");
					        }
					    });
					}
 				});
			});
		</script>

		<aside id="macriforum" class="right">
			<div id="talks">
				<?php /*Mostrar talks*/
					$resultado = $p->getProposalTalks($id);

					if($resultado === FALSE) {
					    die(mysql_error());
					}
					for ($i=0; $i<count($resultado); $i++){
						echo "<div class='talk' proposaltalk='".$resultado[$i][0]."'>";
							echo "<h3>".$resultado[$i][1]."</h3>";
							echo "<p>".$resultado[$i][3]."</p>";
							if ($resultado[$i][4]>0) echo "<p>".$resultado[$i][4]." Respuestas</p>";
						echo "</div>";
					}
				echo "<div id='new-comment-text'><textarea class='talkadd'></textarea></div>";
				echo "<button id='forumadd' class='talkadd' proposaltalk='NULL'><strong> + </strong></button>";
				?>
			</div>
			<div id="comments">
			</div>
		</aside>
