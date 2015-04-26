<?php
    session_start();
    header("Content-type: text/html; charset=UTF-8");

    require_once 'app/core/config.php';
	require_once 'app/core/controller.php';

    //se instancia al controlador
	$controller = new Controller();

    if (isset($_GET["section"])){
        $section=$_GET['section'];

        switch ($section){
            case 'propuestas':
                require_once 'app/controllers/proposals.php';
                $p = new Proposal();
                $p->proposals_home();
            break;
        }
    }else{
        if (!isset($_SESSION["login"])){ //cargamos página de registro y login
            require_once 'app/controllers/home.php';
            $h = new Home();
            $h->index_home();
        }else{ //cargamos timeline

        }
    }
?>
