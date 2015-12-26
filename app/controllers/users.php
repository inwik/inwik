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
                        $data['page_title'] = $_GET["token"];
                        $this->loadModel("user");
                        $u = New Users_Model();
                        $u->user=$_GET["token"];
                        $user=$u->get();
                        $data["id"]=$u->id=$this->u->friend=$user["id"];
                        $data["name"]=$user["name"];
                        $data["description"]=$user["description"];
                        $data["studies"]=$user["studies"];
                        $data["jobs"]=$user["jobs"];
                        $data["residence"]=$user["residence_place"];
                        $data["avatar"]=$u->avatar();

                        if($this->u->friend==$this->u->id){ //logged user is same than user's page

                            $data["info_button"]=$this->loadView('user','edit_info_button');
                        }else{
                            if($this->u->isFollower()){
                                $data["info_button"]=$this->loadView('user','unfollow_button');
                            }else{
                                $data["info_button"]=$this->loadView('user','follow_button');
                            }
                        }

                        $data["followings"]="";
                        if($followings_list=$u->getFollowings(8)){
                            foreach($followings_list as $following){
                                $u->id=$following["id"];
                                $data["user"]=$following["user"];
                                $data["friend-avatar"]=$u->avatar();
                                $data["followings"].=$this->loadView("user","avatar_link",$data);
                            }
                        }

                        $data["followers"]="";
                        if($followers_list=$u->getFollowers(8)){
                            foreach($followers_list as $follower){
                                $u->id=$follower["id"];
                                $data["user"]=$follower["user"];
                                $data["friend-avatar"]=$u->avatar();
                                $data["followers"].=$this->loadView("user","avatar_link",$data);
                            }
                        }

                        $data["post_cards"]="";
                        if($posts_list=$u->getPosts()){
                            foreach($posts_list as $post){
                               $data["post_cards"].=$loadView('user','post_card',$data);
                            }
                        }else{
                           $data["post_cards"]="<p>No hay posts publicados</p>";
                        }


                        $this->render('user', 'user', $data);
                    }else{
                        echo "error 404";
                    }
            }
        }

    }
?>
