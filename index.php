<?php
    session_start();
    header("Content-type: text/html; charset=UTF-8");

    require_once 'app/core/config.php';
    require_once DIR.'/app/languages/functions.php';
	require_once DIR.'/app/core/controller.php';

    //se instancia al controlador
	$controller = new Controller();

    if (isset($_GET["section"])){
        $section=$_GET['section'];

        switch ($section){
            case __("propuestas"):
                require_once DIR.'/app/controllers/proposals.php';
                $proposal = new Proposal();
                $proposal->index_proposals();
            break;

            case __("proyectos"):
                require_once DIR.'/app/controllers/projects.php';
                $project = new Project();
                $project->index_projects();
            break;

            case __("eventos"):
                require_once DIR.'/app/controllers/events.php';
                $event = new Event();
                $event->index_events();
            break;

            case 'user':
                require_once DIR.'/app/controllers/users.php';
                $user = new User();
                $user->index_users();
            break;
        }
    }else{
        if (!isset($_SESSION["login"])){ //cargamos página de registro y login
            require_once DIR.'/app/controllers/home.php';
            $home = new Home();
            $home->index_home();
        }else{ //cargamos timeline
            require_once 'app/controllers/timeline.php';
            $timeline = new Timeline();
            $timeline->index_timeline();
        }
    }
?>
