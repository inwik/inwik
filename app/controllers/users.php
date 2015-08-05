<?php
    require_once 'app/core/controller.php';

    class User extends Controller{

        function index_users(){
            @$action=$_GET["action"];
            switch($action){
                case 'delete':

                break;

                default:
                    if($_GET["token"]){
                        $data['page_title'] = PAGE_NAME;
                        $this->render('user', 'user', $data);
                    }else{
                        echo "error 404";
                    }
            }
        }

    }
?>
