<?php
    require_once 'app/core/controller.php';

    class User extends Controller{

        function index_users(){
            @$action=$_GET["action"];
            switch($action){
                case 'delete':

                break;

                case 'follow':
                    $this->u->friend=$_POST["friend"];
                    if($this->u->follow()){
                        echo $this->loadView('user','unfollow_button');
                    }else{
                        echo false;
                    }
                break;

                case 'unfollow':
                    $this->u->friend=$_POST["friend"];
                    if($this->u->unfollow()){
                        echo $this->loadView('user','follow_button');
                    }else{
                        echo false;
                    }
                break;

                default:
                    if($_GET["token"]){
                        $this->data['page_title'] = $_GET["token"];
                        $this->loadModel("user");
                        $u = New Users_Model();
                        $u->user=$_GET["token"];
                        $user=$u->get();
                        $this->data["id"]=$u->id=$this->u->friend=$user["id"];
                        $this->data["name"]=$user["name"];
                        $this->data["description"]=$user["description"];
                        $this->data["studies"]=$user["studies"];
                        $this->data["jobs"]=$user["jobs"];
                        $this->data["residence"]=$user["residence_place"];
                        $this->data["avatar"]=$u->avatar();

                        if($this->u->friend==$this->u->id){ //logged user is same than user's page

                            $this->data["info_button"]=$this->loadView('user','edit_info_button');
                        }else{
                            if($this->u->isFollower()){
                                $this->data["info_button"]=$this->loadView('user','unfollow_button');
                            }else{
                                $this->data["info_button"]=$this->loadView('user','follow_button');
                            }
                        }

                        $this->data["followings"]="";
                        if($followings_list=$u->getFollowings(8)){
                            foreach($followings_list as $following){
                                $u->id=$following["id"];
                                $this->data["user"]=$following["user"];
                                $this->data["friend-avatar"]=$u->avatar();
                                $this->data["followings"].=$this->loadView("user","avatar_link");
                            }
                        }

                        $this->data["followers"]="";
                        if($followers_list=$u->getFollowers(8)){
                            foreach($followers_list as $follower){
                                $u->id=$follower["id"];
                                $this->data["user"]=$follower["user"];
                                $this->data["friend-avatar"]=$u->avatar();
                                $this->data["followers"].=$this->loadView("user","avatar_link");
                            }
                        }

                        if($this->u->areFriends() || $this->u->friend==$this->u->id){ //if are friends or profile_id = session_id
                            $this->data["new-post"]=$this->loadView("user","new_post");
                        }

                        $this->data["post_cards"]="";
                        if($posts_list=$u->getPosts()){
                            foreach($posts_list as $post){
                               $this->data["post_cards"].=$loadView('user','post_card');
                            }
                        }else{
                           $this->data["post_cards"]="<p>No hay posts publicados</p>";
                        }


                        $this->render('user', 'user');
                    }else{
                        echo "error 404";
                    }
            }
        }

    }
?>
