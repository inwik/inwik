<?php

	if ($_SERVER['REQUEST_METHOD']=='POST') {

		$talkID=$_POST['talk'];
		$father=$_POST['father'];
		if(!isset($_POST['father'])) $father="NULL";

		//$propID=$_POST['proposal'];
/*
			?>
			<script type="text/javascript">
				$(document).ready(function() {
					alert('<?php echo "padre:".$father; ?>');
				});
			</script>
			<?php
*/
		include_once('../../includes/proposal/Proposal.php');
		$p = new Proposal();
		$resultado = $p->getProposalComments($talkID, $father);
		if($resultado === FALSE) {
		    die(mysql_error());
		}

		//BOTON ATRAS: si el padre es NULL -> vamos a talks
		//BOTON ATRAS: si el padre es algo -> vamos al padre
		if ($father=='NULL'){
			$grandpa = -1; //arriba solo estaría talks.
			$classs = "talk"; //-> reaparecen los talks
		}else{
			$grandpa = $p->getProposalFatherIDComment($father);
			if ($grandpa<1) $grandpa="NULL";
			$classs = "commentalk"; //-> ejecutará la segunda funcion on.click (js)
		}
		echo "<button id='forumback' class='$classs' proposalcomment='$grandpa' proposaltalk='$talkID' ><strong> < </strong></button>";

		include_once('../../includes/user/User.php');
		$u = new User();

		for ($i=0; $i<count($resultado); $i++){
			echo "<div class='comment_talk' proposalcomment='".$resultado[$i][0]."' proposaltalk='$talkID'>";
				echo "<p><strong>".$u->getUser_name($resultado[$i][1])."</strong>:  ";
				echo $resultado[$i][4]."</p>";
				echo "<p class='details'>".$resultado[$i][2]." ";
				if ($resultado[$i][5]>0) echo " Respuestas: ".$resultado[$i][5];
				echo "</p>";
			echo "</div>";
		}

		echo "<div id='new-comment-text'><textarea class='commentadd'></textarea></div>";
		echo "<button id='forumadd' class='commentadd' proposaltalk='$talkID' proposalcomment='$father' ><strong> + </strong></button>";

		//id, creator, fecha, type, texto y el numero de hijos.


	}

?>
