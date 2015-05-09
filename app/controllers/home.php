<?php
    require_once 'app/core/controller.php';

    class Home extends Controller{

        function index_home(){
            $data['page_title'] = PAGE_NAME;
            if ($_POST){
                if(empty($_POST["user_reg"]) && empty($_POST["email_reg"]) && empty($_POST["pass_reg"])){ //login
                    $this->u->user=$_POST["username"];
                    $this->u->pass=md5($_POST["password"]);
                    @$loginrec=$_POST['loginrec'];
                    if ($this->u->loginUser($loginrec)){
                        //mostramos timeline
                        $this->render('timeline', $data);
                    }else{
                        //mostramos de nuevo la pagina de inicio con error
                        $data["reg_error"]="";
                        $data["login_error"]="El nombre de usuario o contraseña no son válidos";
                        $this->render('home', $data);
                    }
                }else{//register
                    $this->u->user = $_POST["user_reg"];
                    $this->u->pass = md5($_POST["pass_reg"]);
                    $this->u->email = $_POST["email_reg"];
                    $data["login_error"]="";
                    if ($this->u->registerUser()){
                        $data["reg_error"]="Hemos enviado un email con un enlace para poder activar tu cuenta";
                        $this->render('home', $data);
                        //hemos enviado un email, necesitas activarlo
                    }else{
                        $data["reg_error"]="Ya hay un usuario registrado con este nombre o e-mail";
                        $this->render('home', $data);
                    }

                }
            }else{
                $this->render('home', $data);
                /*$data['prop_list'] = $this->_proposal->get_proposals();*/
            }
        }

    }
?>
