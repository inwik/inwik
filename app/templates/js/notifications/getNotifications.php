<?php
    session_start();

    if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'){
		include_once('../../includes/config.php');
		include_once('../../includes/user/User.php');
        $u = new User();
		$to = $u->readUser_id($_SESSION["username"]);

        if($notifications_list=$u->getNotifications($to)){
			@include_once('../formatdate/formatdate.php');
			$message ="";
            foreach($notifications_list as $notification){
				$date = "<p class='notification-date'>".format_date($notification[0])."</p>";
				$from = $notification[2];
				$title = "<p class='notification-title'>". $notification[3] ."</p>";
				$text = "<p class='notification-text'>". $notification[4] ."</p>";
				if ($notification[5]!=''){$link = "href='".$notification[5]."'";}else{$link='';}
				$type = $notification[6];
				$class = $notification[7];
				$data = "data-date='$notification[0]'";
				if($notification[8] == 1){$read='read';}else{$read='';}

				switch($type){
					case 'warning': case 'info': case 'wins': case 'proposal': case 'project': case 'event':
						$icon = "<img src='/resources/notifications/icons/". $type .".svg'>";
						$message = $message. "<div class='notification ". $type ." ". $class ." ". $read ."' $data><a $link>". $icon . $title . $text . $date ."</a></div>";
					break;

					default:
						if ($from!='' || $from != '0'){
							include('getFromAvatar.php');
							$avatar = getFromAvatar($from);
							if ($avatar==1){
								$avatar = "<img src='/images/avatar/". $from .".jpg'>";
							}
							else{
								$avatar = "<img src='/images/avatar/user.svg'>";
							}
							$message = $message. "<div class='notification ". $class ." ". $read ."' $data><a $link>". $avatar . $title . $text . $date ."</a></div>";

						}else{
							$message = $message ."<div class='notification ". $notification[7] ." ". $read ."' $data><a $link>". $title . $text . $date ."</a></div>";
						}
				}

            }
			echo $message;
        }else{
        	echo "<p class='no_notifications'>No hay notificaciones</p>";
        }
    }
?>
