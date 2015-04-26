<?php
    require_once 'app/helpers/database.php';

    class Users_Model extends Database{

        var $user, $email, $pass, $name, $residence, $description, $studies, $jobs;

        function __construct(){
           parent::__construct();
        }

        // Read functions-----------------------------------------------------//

        // Read user id -- leer id del usuario
        function readUser_id($name)
        {
            $query = "SELECT id FROM users WHERE name='$name'";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL)
            return $answer[0];
            return false;
        }

        // Read name -- Leer nombre
        function getUser_name($id)
        {
            $query = "SELECT name FROM users WHERE id='$id'";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL)
            return $answer[0]; //name
            return false;
        }

        // Read usernames like string -- leer nombres like cadena
        function searchUsers($string,$limit){
            $query = "SELECT id, name, avatar FROM users WHERE name LIKE '".$string."%' AND active_account=1 LIMIT ". $limit;
            if($answer=$this->_db->query($query)){
                while($fila = $answer->fetch_row()){
                    $users_list[]=$fila;
                }
                return $users_list;
            }
            return false;
        }

        // Read user info -- leer información del usuario

        function getUser_info($id)
        {
            $query = "SELECT name, avatar FROM users WHERE id='$id'";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL)
            return $answer;
            return false;
        }

        function readUser_info($name)
        {
            $query = "SELECT id, real_name, birthdate, birthplace, residence_place, sex, description, studies, jobs FROM users WHERE name='$name'";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL)
            return $answer;
            return false;
        }

    // Write functions-----------------------------------------------------//

        // Update user info -- Actualizar información de usuario
        function updateUser_info($name, $real_name, $residence, $description, $studies, $jobs)
        {
            $query = "UPDATE users SET real_name='$real_name', residence_place='$residence', description='$description', studies='$studies', jobs='$jobs' WHERE name='$name'";
            if ( $this->_db->query($query))
            return true;
            return false;
        }

        // Update user password -- Actualizar contraseña usuario
        function updateUserPassword($name, $newpassword, $oldpassword){
            $oldpassword=sha1($this->global_token . $oldpassword);
            $newpassword=sha1($this->global_token . $newpassword);
            $query = "SELECT password FROM users WHERE name='$name'";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer[0] == $oldpassword){
                $query = "UPDATE users SET password='$newpassword' WHERE name='$name'";
                if ( $this->_db->query($query))
                return true;
                return false;
            }
            else{
                return false;
            }
        }



    //Posts functions-----------------------------------------------------//

        function publishUser_post($text, $user_publisher, $user_profile){
            $post_date=date ("Y-m-d H:i:s");
            $query = "INSERT INTO profile_posts (post_date, post_publisher, post_text, edition_date) VALUES ('$post_date', '$user_publisher', '$text', '$post_date')";
            if ($this->_db->query($query)){
                $query = "INSERT INTO profile_posts_published (post_date, post_publisher, profile_user, publish_date) VALUES ('$post_date', '$user_publisher', '$user_profile', '$post_date')";
                if ($this->_db->query($query)){
                    return true;
                }
            }
            return false;
        }

        function updateUser_post($post_text, $post_publisher, $post_date){
            $new_date=date ("Y-m-d H:i:s");
            $query = "UPDATE profile_posts SET post_text='$post_text', edition_date='$new_date' WHERE (post_date='$post_date' AND post_publisher='$post_publisher')";
            if ( $this->_db->query($query))
            return true;
            return false;
        }

        function deleteUser_post($post_publisher, $post_profile, $post_date){
            $query = "DELETE FROM profile_posts WHERE post_date='$post_date' AND post_publisher='$post_publisher'";
            if ( $this->_db->query($query)){
                $query = "DELETE FROM profile_posts_published WHERE post_publisher='$post_publisher' AND post_date='$post_date'";
                if ($this->_db->query($query)){
                    $query = "DELETE FROM profile_comments WHERE post_publisher='$post_publisher' AND post_date='$post_date'";
                    if ($this->_db->query($query)){
                        return true;
                    }
                }
            }
            return false;
        }

        function getUser_post($iduser, $limit){
            $query = "SELECT DISTINCT * FROM profile_posts INNER JOIN profile_posts_published ON profile_posts.post_publisher=profile_posts_published.post_publisher AND profile_posts.post_date=profile_posts_published.post_date WHERE profile_posts_published.profile_user=$iduser ORDER BY profile_posts.edition_date DESC LIMIT $limit";
            $answer = $this->_db->query($query)->fetch_row();
            if($answer=$this->_db->query($query)){
                while($fila = $answer->fetch_row()){
                    $post_list[]=$fila;
                }
                return $post_list;
            }
            return false;
        }

        function shareUser_post($post_date, $post_publisher, $user_profile){
            $publish_date=date ("Y-m-d H:i:s");
            $query = "INSERT INTO profile_posts_published (post_date, post_publisher, profile_user, publish_date) VALUES ('$post_date', '$post_publisher', '$user_profile', '$publish_date')";
            if ($this->_db->query($query))
            return true;
            return false;
        }

        function publishComment($post_publisher, $post_date, $comment_publisher, $comment_text){
            $comment_date=date ("Y-m-d H:i:s");
            $query = "INSERT INTO profile_comments (post_date, post_publisher, comment_date, comment_publisher, comment_text) VALUES ('$post_date', $post_publisher, '$comment_date', $comment_publisher, '$comment_text')";
            if ($this->_db->query($query))
            return true;
            return false;
        }

    //Comments functions-----------------------------------------------------//

        function getComments($post_publisher, $post_date, $limit){
            $query = "SELECT * FROM profile_comments WHERE post_publisher='$post_publisher' AND post_date='$post_date' ORDER BY comment_date DESC LIMIT $limit";
            $answer = $this->_db->query($query)->fetch_row();
            if($answer=$this->_db->query($query)){
                while($fila = $answer->fetch_row()){
                    $comment_list[]=$fila;
                }
                return $comment_list;
            }
            return false;
        }

        function countComments($post_publisher, $post_date){
            $query = "SELECT count(*) FROM profile_comments WHERE post_publisher='$post_publisher' AND post_date='$post_date'";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL)
            return $answer[0];
            return false;
        }

        function deleteComment($post_date, $post_publisher, $comment_date, $comment_publisher){
            $query = "DELETE FROM profile_comments WHERE post_date='$post_date' AND post_publisher='$post_publisher' AND comment_date='$comment_date' AND comment_publisher='$comment_publisher'";
            if ( $this->_db->query($query))
            return true;
            return false;
        }

        function updateComment($post_date, $post_publisher, $comment_date, $comment_publisher, $comment_text){
            $new_date=date ("Y-m-d H:i:s");
            $query = "UPDATE profile_comments SET comment_text='$comment_text', edition_date='$new_date' WHERE (post_date='$post_date' AND post_publisher='$post_publisher' AND comment_date='$comment_date' AND comment_publisher='$comment_publisher')";
            if ( $this->_db->query($query))
            return true;
            return false;
        }

    //Avatar functions-----------------------------------------------------//

        // Read if user has avatar -- Comprobar si el usuario tiene avatar
        function readUserAvatar($id){
               //comrpobar si tiene avatar subido, sino se muestra el generico
            $dir="images/avatar";
            $avatar=$dir."/".$id.".jpg";
            $generic_avatar=$dir."/"."user.svg";
            $query = "SELECT avatar FROM users WHERE id='$id'";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer[0]==1){
                $img=$avatar;
            }
            else{
                $img=$generic_avatar;
            }
            return $img;
        }

        //Activate user avatar
        function activateAvatar($id){
            $query = "UPDATE users SET avatar = 1 WHERE id='$id'";
            if ( $this->_db->query($query) )
            return true;
            return false;
        }

        //Deactivate user avatar
        function deactivateAvatar($id){
            $query = "UPDATE users SET avatar = 0 WHERE id='$id'";
            if ( $this->_db->query($query) )
            return true;
            return false;
        }

    //Friends functions-----------------------------------------------------//

        // Send friendly petition -- Enviar solicitud de amistad
        function sendUser_friendly($iduser, $idfriend){
            $query = "INSERT INTO friends VALUES ('$iduser', '$idfriend', default)";
            if ( $this->_db->query($query))
            return true;
            return false;
        }

        // Confirm user friendly -- Confirmar amistad
        function confirmUser_friendly($iduser, $idfriend){
            $date=date ("Y-m-d H:i:s");

            $query = "UPDATE friends SET friendly_date = '$date' WHERE (user1='$idfriend' AND user2='$iduser')";
            if ( $this->_db->query($query))
            return true;
            return false;
        }

        // Count friends -- contar amigos
        function countUser_friends($iduser)
        {
            $query = "SELECT count(*) FROM friends WHERE ((user1='$iduser' OR user2='$iduser') AND friendly_date IS NOT NULL)";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL)
            return $answer[0];
            return false;
        }

        // Read friends -- leer amigos
        function readUser_friends($iduser, $limit)
        {
            $query = "SELECT * FROM friends WHERE ((user1='$iduser' OR user2='$iduser') AND friendly_date IS NOT NULL) ORDER BY friendly_date DESC LIMIT $limit";
            if($answer=$this->_db->query($query)){
                while($fila = $answer->fetch_row()){
                    if($fila[0]!=$iduser){ //vemos si el id del amigo es distinto del id del perfil, si es el mismo se coge $fila[1]
                        $friends_list[]=$fila[0];
                    }else{
                        $friends_list[]=$fila[1];
                    }
                }
                return $friends_list;
            }
            return false;
        }

        // Are friends -- Son amigos
        function areFriends($iduser, $idfriend)
        {
            $query = "SELECT * FROM friends WHERE (((user1='$iduser' AND user2='$idfriend') OR (user1='$idfriend' AND user2='$iduser')) AND friendly_date IS NOT NULL)";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL) //are friends
            return true;
            return false;
        }

        function iHaventConfirmedFriendly($iduser,$idfriend){
            $query = "SELECT * FROM friends WHERE ((user1='$idfriend' AND user2='$iduser') AND friendly_date IS NULL)";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL)
            return true;
            return false;
        }

        function iSendFriendlyPetition($iduser,$idfriend){
            $query = "SELECT * FROM friends WHERE ((user1='$iduser' AND user2='$idfriend') AND friendly_date IS NULL)";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL)
            return true;
            return false;
        }

        //Delete friendly -- Borrar amistad
        function cancelFriendly($iduser, $idfriend)
        {
            $query = "DELETE FROM friends WHERE ((user1='$iduser' AND user2='$idfriend') OR (user1='$idfriend' AND user2='$iduser'))";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL)
            return true;
            return false;
        }

    // Register functions-----------------------------------------------------//

        // Read if user and email is not used -- Comrpueba si nombre y email no estan ya usados
        function existUser_nameoremail($name, $email)
        {
            $query = "SELECT id FROM users WHERE name='$name' OR email='$email'";//revisar
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL)
            return true;
            return false;
        }

        // User register -- Registro de usuario
        function setUser()
        {
            $new_date=date ("Y-m-d H:i:s");
            $pass=sha1(GLOBAL_TOKEN . $this->pass);

            if(isset($_SERVER['HTTP_X_FORWARDED_FOR']) && $_SERVER['HTTP_X_FORWARTDED_FOR'] != '') {
                $creation_ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
            } else {
                $creation_ip = $_SERVER['REMOTE_ADDR'];
            }
            $query = "INSERT INTO users (name, email, password, creation_date, creation_ip) VALUES ('$this->user', '$this->email', '$this->pass', '$new_date', '$creation_ip')";
            if ( $this->_db->query($query) )
            return mysqli_insert_id($this->_db);
            return false;
        }

        // Activation email-- Email de activación
        function activateUser_email($name)
        {
            require_once('../../resources/PHPMailer/PHPMailerAutoload.php');
            $mail = new PHPMailer();
            $query = "SELECT id, email, creation_date FROM users WHERE name='$name'";
            $answer = $this->_db->query($query)->fetch_row();
            $id=$answer[0];
            $to=$answer[1];
            $date=$answer[2];
            $email_key=md5($date . $id . $this->email_token);
            $body="
                <html>
                    <body>
                        <p>Bienvenido/a a ". $this->page_name .", $name.</p>
                        <p>Este es tu código de activación: $email_key</p>
                        <p>¡Entra en este enlace, introduce tus datos y serás parte de esta gran comunidad!</p>
                        <a href='" . $this->page_domain . "/?activation=$email_key'>" . $this->page_domain . "/?activation=$email_key</a>
                        <p>Si tienes algún problema con tu registro ponte en contacto con nosotros a través de esta dirección:</p> <a href='mailto:". $this->contact_email ."'>". $this->contact_email ."</a>
                        <p>¡Bienvenido/a!</p>
                    <body>
                </html>
            ";

            $mail->isSMTP();
            //$mail->SMTPDebug = 2;
            $mail->Host = $this->smtp_server;
            //$mail->SMTPSecure = "ssl";
            $mail->Port = $this->smtp_port;
            $mail->SMTPAuth = true;
            $mail->Username = $this->smtp_username;
            $mail->Password = $this->smtp_password;
            $mail->setFrom($this->noreply_email, $this->page_name);
            $mail->addReplyTo($this->noreply_email, $this->page_name);
            $mail->addAddress($to, $name);
            $mail->Subject = "Activación de cuenta en ". $this->page_name;
            //$mail->AltBody="Cuerpo alternativo del mensaje en solo texto";
            $mail->msgHTML($body);
            //$mail->AddAttachment("ruta/archivoadjunto.jpg");
            $mail->CharSet = "UTF-8";
            //$mail->Encoding = "quotedprintable";
            if ($mail->Send())
            return true;
            return false;
        }

    // Login functions-----------------------------------------------------//
        //Register user
        function registerUser(){
            if($id=$this->setUser()){
                $email_key=md5($id . EMAIL_TOKEN);
                require_once DIR.'/app/models/email.php';
                $e = new Email();
                $e->to = $this->email;
                $e->subject = "Activacion de cuenta en ". PAGE_NAME;
                $e->body = "<html>
                    <body>
                        <p>Bienvenido/a a ". PAGE_NAME .", $this->user.</p>
                        <p>Este es tu código de activación: $email_key</p>
                        <p>¡Entra en este enlace, introduce tus datos y serás parte de esta gran comunidad!</p>
                        <a href='" . DIR . "/?activation=$email_key'>" . PAGE_DOMAIN . "/?activation=$email_key</a>
                        <p>Si tienes algún problema con tu registro ponte en contacto con nosotros a través de esta dirección:</p> <a href='mailto:". CONTACT_EMAIL ."'>". CONTACT_EMAIL ."</a>
                        <p>¡Bienvenido/a!</p>
                    <body>
                </html>";
                if ($e->sendEmail()){
                    return true;
                }else{
                   return false;
                }
            }else{
                return false;
            }
        }

        //Login user
        function loginUser($user, $pass, $loginrec){
            $pass=sha1(GLOBAL_TOKEN.$pass);
            $query = "SELECT password FROM users WHERE name='$user' AND active_account=1";
            $answer = $this->_db->query($query)->fetch_row(); //bd_password
            if ($answer[0] == $pass){
                $this->updateUser_date($user);//actualiza ultimo acceso
                $this->updateUser_ip($user);//actualiza ultima ip
                $_SESSION['username']=$user;
                if($loginrec==1){
                    $usercookie = setcookie("username", $user, strtotime('+15 days'), "/", PAGE_DOMAIN);
                    $passcookie = setcookie("password", $pass, strtotime('+15 days'), "/", PAGE_DOMAIN);
                }
                return true;
            }
            return false;
        }

        // Read if exist name, yes-> true , no-> false
        function existUser_name($name)
        {
            $query = "SELECT id FROM users WHERE name='$name'";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL)
            return true;
            return false;
        }

        // Read if account is active: 1-> true, 0->false
        function getUser_activeaccount($name)
        {
            $query = "SELECT active_account FROM users WHERE name='$name'";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer[0]==1)
            return true; //active
            return false; //not active
        }

        //Active user account
        function activeUser_account($name,$password,$email_key)
        {
            $password=sha1($this->global_token . $password);
            $query = "SELECT id, password, creation_date FROM users WHERE name='$name'";
            $answer = $this->_db->query($query)->fetch_row();
            $newkey=sha1(md5($answer[2] . $answer[0] . $this->email_token) . $answer[1]); //$activation_key= sha1(md5($date . $id . $this->email_token) . $password);
            $oldkey=sha1($email_key . $password); //$email_key=md5($date . $id . $this->email_token);
            if ($newkey==$oldkey){
                $query = "UPDATE users SET active_account=1 WHERE id='$answer[0]'";
                if ( $this->_db->query($query))
                return true;
                return false;
            }
            return false;
        }

        //Update lastDate -- Actualizar último acceso
        function updateUser_date($name)
        {
            $new_date=date ("Y-m-d H:i:s");
            $query = "UPDATE users SET last_date='$new_date' WHERE name='$name'";
            if ( $this->_db->query($query) )
            return true;
            return false;
        }

        //Update lastIP -- Actualizar últimaIP
        function updateUser_ip($name)
        {
            if(isset($_SERVER['HTTP_X_FORWARDED_FOR']) && $_SERVER['HTTP_X_FORWARTDED_FOR'] != '') {
                $last_ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
            } else {
                $last_ip = $_SERVER['REMOTE_ADDR'];
            }

            $query = "UPDATE users SET last_ip='$last_ip' WHERE name='$name'";
            if ( $this->_db->query($query) )
            return true;
            return false;
        }

    // Notifications functions-----------------------------------------------------//

        //Write notification
        function addNotification($userid, $from, $title, $text, $link, $type, $class)
        {
            $notif_date = date ("Y-m-d H:i:s");
            $query = "INSERT INTO notifications (notif_date, notif_user, notif_from, notif_title, notif_text, notif_link, notif_type, notif_class) VALUES ('$notif_date', '$userid', '$from', '$title', '$text', '$link', '$type', '$class')";
            if ($this->_db->query($query))
            return true;
            return false;
        }

        //Get notifications
        function getNotifications($userid)
        {
            $query = "SELECT * FROM notifications WHERE notif_user='$userid' ORDER BY notif_date DESC";
            if($answer=$this->_db->query($query)){
                while($fila = $answer->fetch_row()){
                    $notifications[]=$fila;
                }
                if ($this->watchNotifications($userid)){
                    return $notifications;
                }
            }
            return false;
        }

        //Count not watched notifications
        function countNotifications($userid){
            $query = "SELECT COUNT(*) FROM notifications WHERE notif_user='$userid' AND readon = '0'";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL)
            return $answer[0];
            return false;
        }

        //Get new notifications
        function newNotifications($userid){
            $query = "SELECT * FROM notifications WHERE notif_user='$userid' AND watched = 0";
            if($answer=$this->_db->query($query)){
                while($fila = $answer->fetch_row()){
                    $notifications_list[]=$fila;
                }
                return $notifications_list;
            }
        }


        //Mark as watched
        function watchNotifications($userid)
        {
            $query = "UPDATE notifications SET watched=1 WHERE notif_user='$userid'";
            if ( $this->_db->query($query))
            return true;
            return false;
        }

        //Mark as read
        function readNotifications($date, $userid)
        {
            $query = "UPDATE notifications SET readon=1 WHERE notif_date='$date' AND notif_user='$userid'";
            if ( $this->_db->query($query))
            return true;
            return false;
        }

        //Mark all as read
        function readAllNotifications($userid)
        {
            $query = "UPDATE notifications SET readon=1 WHERE notif_user='$userid'";
            if ( $this->_db->query($query))
            return true;
            return false;
        }

        //Delete old notifications
        function deleteOldNotifications($userid){
            $query = "SELECT COUNT(*) FROM notifications WHERE notif_user='$userid'";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer!=NULL){
                $query = "DELETE FROM notifications WHERE notif_user = '$userid' ORDER BY notif_date DESC LIMIT 21 $answer[0]";
                if ( $this->_db->query($query))
                return true;
                return false;
            }else{
                return false;
            }
        }

        //No disturb status
        function noDisturbStatus($userid){
            $query = "SELECT notification FROM users WHERE id='$userid'";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer[0]==0)
            return true;
            return false;
        }

        //Activate notifications
        function activateNotifications($userid){
            $query = "UPDATE users SET notification = 1 WHERE id='$userid'";
            if ( $this->_db->query($query) )
            return true;
            return false;
        }

        //Deactivate notifications
        function deactivateNotifications($userid){
            $query = "UPDATE users SET notification = 0 WHERE id='$userid'";
            if ( $this->_db->query($query) )
            return true;
            return false;
        }

    }
?>
