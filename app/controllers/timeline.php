<?php
    require_once 'app/core/controller.php';

    class Timeline extends Controller{

        function index_timeline(){
            @$action=$_GET["action"];
            switch($action){
                case 'logout':
                    $this->data['page_title'] = PAGE_NAME;
                    $this->u->logout();
                    $this->render('home', 'home', $this->data);
                break;

                default:
                    $this->data['page_title'] = PAGE_NAME;
                    $this->render('timeline', 'timeline', $this->data);
            }
        }

    }
?>
