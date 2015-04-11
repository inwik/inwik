<?php
    session_start();
	$sw=0;

    if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
        if (isset($_POST["from"])){
			$from = $_POST['from'];
			global $sw;
			$sw = 1;

			include_once('../../includes/config.php');
			include_once('../../includes/user/User.php');
			getFromAvatar($from);
        }
    }

	function getFromAvatar($from){
		$u = new User();

		if($answer = $u->getUser_info($from)){
			global $sw;
			if ($sw==1) {
				echo $answer[1];
			}else{
				return $answer[1];
			}
		}else{
			return false;
		}
	}
?>


