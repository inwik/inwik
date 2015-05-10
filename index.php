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
            case 'proposals':
                require_once 'app/controllers/proposals.php';
                $p = new Proposal();
                $p->index_proposals();
            break;

            case 'projects':
                require_once 'app/controllers/projects.php';
                $p = new Project();
                $p->index_projects();
            break;

            case 'events':
                require_once 'app/controllers/events.php';
                $p = new Event();
                $p->index_events();
            break;

            case 'user':
                require_once 'app/controllers/users.php';
                $p = new User();
                $p->index_users();
            break;
        }
    }else{
        if (!isset($_SESSION["login"])){ //cargamos página de registro y login
            require_once 'app/controllers/home.php';
            $h = new Home();
            $h->index_home();
        }else{ //cargamos timeline
            require_once 'app/controllers/timeline.php';
            $t = new Timeline();
            $t->index_timeline();
        }
    }
?>
