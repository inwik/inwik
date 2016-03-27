<?php
    class Users_Model extends Database{

        var $id, $user, $email, $pass, $name, $residence, $description, $studies, $jobs, $friend;

        function __construct(){
           parent::__construct();
        }

        // Read functions-----------------------------------------------------//

        // Get user info from username
        function get()
        {
            $query = "SELECT * FROM users WHERE user='$this->user'";
            $answer = $this->_db->query($query)->fetch_assoc();
            if ($answer!=NULL)
            return $answer;
            return false;
        }

        // Get user info from id
        function getWhereId()
        {
            $query = "SELECT * FROM users WHERE id='$this->id'";
            $answer = $this->_db->query($query)->fetch_assoc();
            if ($answer!=NULL)
            return $answer;
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

        function getPosts($limit=false){
            $query = "SELECT DISTINCT * FROM profile_posts INNER JOIN profile_posts_published ON profile_posts.post_publisher=profile_posts_published.post_publisher AND profile_posts.post_date=profile_posts_published.post_date WHERE profile_posts_published.profile_user=$this->id ORDER BY profile_posts.edition_date DESC LIMIT $limit";
            if($answer=$this->_db->query($query)){
                while($fila = $answer->fetch_row()){
                    $posts_list[]=$fila;
                }
                return $posts_list;
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
        function avatar(){
               //comrpobar si tiene avatar subido, sino se muestra el generico
            $avatar=$this->id.".jpg";
            $generic_avatar="user.svg";
            $query = "SELECT avatar FROM users WHERE id='$this->id'";
            $answer = $this->_db->query($query)->fetch_assoc();
            if ($answer["avatar"]==1){
                $img=$avatar;
            }
            else{
                $img=$generic_avatar;
            }
            return $img;
        }

        //Activate user avatar
        function activateAvatar(){
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

    //Follow functions-----------------------------------------------------//

        function follow(){
            $date=date ("Y-m-d H:i:s");
            $query = "INSERT INTO follows VALUES ('$this->id', '$this->friend', '$date')";
            if ( $this->_db->query($query))
            return true;
            return false;
        }

        function getFollowings($limit=false)
        {
            $query = "SELECT * FROM users WHERE id = (SELECT follower FROM follows WHERE following='$this->id') LIMIT $limit";
            if($answer=$this->_db->query($query)){
                while($fila = $answer->fetch_assoc()){
                    $followings_list[]=$fila;
                }
                if(!empty($followings_list)){
                    return $followings_list;
                }
            }
            return false;
        }

        function getFollowers($limit=false)
        {
            $query = "SELECT * FROM users WHERE id = (SELECT following FROM follows WHERE follower='$this->id') LIMIT $limit";
            if($answer=$this->_db->query($query)){
                while($fila = $answer->fetch_assoc()){
                    $followers_list[]=$fila;
                }
                if(!empty($followers_list)){
                    return $followers_list;
                }
            }
            return false;
        }

        function isFollower()
        {
            $query = "SELECT * FROM follows WHERE follower='$this->id' AND following='$this->friend'";
            $answer = $this->_db->query($query)->fetch_assoc();
            if ($answer!=NULL)
            return true;
            return false;
        }

        function isFollowing()
        {
            $query = "SELECT * FROM follows WHERE follower='$this->friend' AND following='$this->id'";
            $answer = $this->_db->query($query)->fetch_assoc();
            if ($answer!=NULL)
            return true;
            return false;
        }

        function areFriends()
        {
            if($this->isFollower() && $this->isFollowing())
            return true;
            return false;
        }

        function unfollow()
        {
            $query = "DELETE FROM follows WHERE follower='$this->id' AND following='$this->friend'";
            if ( $this->_db->query($query))
            return true;
            return false;
        }

    // Register & login functions-----------------------------------------------------//

        // Insert User
        function set()
        {
            $new_date=date ("Y-m-d H:i:s");
            $pass=sha1(GLOBAL_TOKEN.$this->pass);

            if(isset($_SERVER['HTTP_X_FORWARDED_FOR']) && $_SERVER['HTTP_X_FORWARTDED_FOR'] != '') {
                $creation_ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
            } else {
                $creation_ip = $_SERVER['REMOTE_ADDR'];
            }
            $query = "INSERT INTO users (user, email, password, creation_date, creation_ip) VALUES ('$this->user', '$this->email', '$pass', '$new_date', '$creation_ip')";
            if ( $this->_db->query($query) )
            return mysqli_insert_id($this->_db);
            return false;
        }

        //Register user
        function register(){
            if($id=$this->set()){
                $email_key=md5($id . sha1(GLOBAL_TOKEN.$this->pass) . EMAIL_TOKEN);
                require_once DIR.'/app/models/email.php';
                $mail = new Email();
                $mail->to = $this->email;
                $mail->subject = "Activacion de cuenta en ". PAGE_NAME;
                $mail->getEmail("register.php");
                $mail->body = str_replace("{PAGE_NAME}", PAGE_NAME, $mail->body);
                $mail->body = str_replace("{USER}", $this->user, $mail->body);
                $mail->body = str_replace("{EMAIL_KEY}", $email_key, $mail->body);
                $mail->body = str_replace("{PAGE_DOMAIN}", PAGE_DOMAIN, $mail->body);
                $mail->body = str_replace("{CONTACT_EMAIL}", CONTACT_EMAIL, $mail->body);
                if ($mail->sendEmail()){
                    return true;
                }else{
                   return false;
                }
            }else{
                return false;
            }
        }

        //Login user
        function login($loginrec=false){
            $pass=sha1(GLOBAL_TOKEN.$this->pass);
            $query = "SELECT password FROM users WHERE user='$this->user' AND active_account=1";
            $answer = $this->_db->query($query)->fetch_assoc(); //bd_password
            if ($answer["password"] == $pass){
                $this->updateUser_date();//actualiza ultimo acceso
                $this->updateUser_ip();//actualiza ultima ip
                $_SESSION['login']['user']=$this->user;
                $_SESSION['login']['pass']=$this->pass; //password solo con el md5

                if($loginrec=='on'){
                    setcookie("user", $this->user, strtotime('+15 days'));
                    setcookie("pass", $this->pass, strtotime('+15 days'));
                }
                return true;
            }
            return false;
        }

        //Login user
        function logout(){
            unset($_SESSION["login"]);
            session_destroy();
            setcookie("user", $this->user, strtotime('-15 days'));
            setcookie("pass", $this->pass, strtotime('-15 days'));
			Header("Location: ".PAGE_DOMAIN);
        }

        // Read if account is active: 1-> true, 0->false
        function getUser_activeaccount()
        {
            $query = "SELECT active_account FROM users WHERE user='$this->user'";
            $answer = $this->_db->query($query)->fetch_row();
            if ($answer[0]==1)
            return true; //active
            return false; //not active
        }

        //Active user account
        function activate($email_key)
        {
            //$email_key=md5($id . sha1(GLOBAL_TOKEN . $this->pass) . EMAIL_TOKEN);

            $pass=sha1(GLOBAL_TOKEN . $this->pass);
            $query = "SELECT id FROM users WHERE user='$this->user' AND password='$pass'";
            $answer = $this->_db->query($query)->fetch_assoc();
            if ($answer!=NULL){
                $newkey=md5($answer["id"] . $pass . EMAIL_TOKEN);
                if ($newkey==$email_key){
                    $query = "UPDATE users SET active_account=1 WHERE id='".$answer["id"]."'";
                    if ( $this->_db->query($query))
                    return true;
                    return false;
                }
                return false;
            }else{
                return false;
            }
        }

        //Update lastDate -- Actualizar último acceso
        function updateUser_date()
        {
            $new_date=date ("Y-m-d H:i:s");
            $query = "UPDATE users SET last_date='$new_date' WHERE user='$this->user'";
            if ( $this->_db->query($query) )
            return true;
            return false;
        }

        //Update lastIP -- Actualizar últimaIP
        function updateUser_ip()
        {
            if(isset($_SERVER['HTTP_X_FORWARDED_FOR']) && $_SERVER['HTTP_X_FORWARTDED_FOR'] != '') {
                $last_ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
            } else {
                $last_ip = $_SERVER['REMOTE_ADDR'];
            }

            $query = "UPDATE users SET last_ip='$last_ip' WHERE user='$this->user'";
            if ( $this->_db->query($query) )
            return true;
            return false;
        }
    }
?>
