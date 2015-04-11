<?php
	if ($_SERVER['REQUEST_METHOD']=='POST') {

		$talkID=$_POST['talk'];
		$creator=$_POST['creator'];
		$father=$_POST['father'];
		if(!isset($_POST['father'])) $father="NULL";
		$type=$_POST['type'];
		if(!isset($_POST['type'])) $type="normal";
		$text=$_POST['text'];
		$proposal=$_POST['proposal'];

		include_once('../../includes/proposal/Proposal.php');
		$p = new Proposal();

		if($talkID=='NULL'){ //toca añadir talk

			//echo "coas p: $proposal ,t: $text ,c: $creator";

			if ($p->createProposalTalk($proposal, $text, $creator)){

				$resultado = $p->getProposalTalks($proposal); //mostrar talks actualizados.

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

			}else{
				echo "db: error al añadir talk.";
			}


		}else{//toca añadir comment
			//echo "----talk:$talkID --creator:$creator --father:$father --type:$type --text:$text";
			//$porfa = $p->createProposalComment($talkID, $creator, $father, $type, $text);
			//echo $porfa;

			if ($p->createProposalComment($talkID, $creator, $father, $type, $text)){

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


			}else{
				echo "db: error al añadir_ $talkID _comment.";
			}

		}

/*
		include_once('Proposal.php');
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

		include_once('../user/User.php');
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
*/

	}

?>
