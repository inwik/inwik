<?php
	if ($_SERVER['REQUEST_METHOD']=='POST') {

		$string=$_POST['query'];
        $limit=10;

        include_once('../../includes/config.php');
		include_once('../../includes/user/User.php');
		$u = new User();

    	if($answer = $u->searchUsers($string,$limit)){
    	   print json_encode($answer);
        }else{
            print json_encode("error");
        }
    }
?>
