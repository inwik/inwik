<?php
    session_start();

    if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'){

		include_once('../../includes/config.php');
		include_once('../../includes/user/User.php');

		$u = new User();

		$status = $_POST['status'];
		$userid = $u->readUser_id($_SESSION["username"]);

		if ($status == 'checked'){
			if($u->deactivateNotifications($userid)){
				echo true;
			}else{
				echo false;
			}
		}else{
			if($u->activateNotifications($userid)){
				echo true;
			}else{
				echo false;
			}
		}
	}
?>
