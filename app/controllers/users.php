<?php
    require_once 'app/core/controller.php';

    class User extends Controller{

        function index_users(){
            @$action=$_GET["action"];
            switch($action){
                case 'view':
                    $data['page_title'] = PAGE_NAME;
                    $this->render('user', 'user', $data);
                break;

                default:
                    $data['page_title'] = PAGE_NAME;
                    $this->render('user', 'user', $data);
            }
        }

    }
?>
