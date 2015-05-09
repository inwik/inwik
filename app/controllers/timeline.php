<?php
    require_once 'app/core/controller.php';

    class Timeline extends Controller{

        function index_timeline(){
            $data['page_title'] = PAGE_NAME;
            $this->render('timeline', $data);
        }

    }
?>
