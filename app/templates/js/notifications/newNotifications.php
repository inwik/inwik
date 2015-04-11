<?php
    session_start();

    if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'){

		include_once('../../includes/config.php');
		include_once('../../includes/user/User.php');

		$u = new User();

		$userid = $u->readUser_id($_SESSION["username"]);

		$answer = $u->newNotifications($userid);
		print json_encode($answer);
	}
?>
