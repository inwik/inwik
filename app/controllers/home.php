<?php
    require_once 'app/core/controller.php';

    class Home extends Controller{

        public function __construct()
        {
            $this->loadModel('user');
            $this->u = new Users_Model();
        }

        function index_home(){
            if ($_POST){
                if(empty($_POST["user_reg"]) && empty($_POST["email_reg"]) && empty($_POST["pass_reg"])){ //login
                    $user=$_POST["username"];
                    $pass=md5($_POST["password"]);
                    @$loginrec=$_POST['loginrec'];
                    if ($this->u->loginUser($user,$pass,$loginrec)){
                        //mostramos timeline
                    }else{
                        //mostramos de nuevo la pagina de inicio con error
                        $data["reg_error"]="";
                        $data["login_error"]="El nombre de usuario o contraseña no son válidos";
                        $page = $this->loadView('home', $data);
                    }
                }else{//register
                    $this->u->user = $_POST["user_reg"];
                    $this->u->pass = md5($_POST["pass_reg"]);
                    $this->u->email = $_POST["email_reg"];
                    $data["login_error"]="";
                    if ($this->u->registerUser()){
                        $data["reg_error"]="Hemos enviado un email con un enlace para poder activar tu cuenta";
                        $page = $this->loadView('home', $data);
                        //hemos enviado un email, necesitas activarlo
                    }else{
                        $data["reg_error"]="Ya hay un usuario registrado con este nombre o e-mail";
                        $page = $this->loadView('home', $data);
                    }

                }
            }else{
                $page = $this->loadView('home');
                /*$data['prop_list'] = $this->_proposal->get_proposals();*/
            }
            $data['page_title'] = PAGE_NAME;
            $this->render($page, $data);
        }

    }
?>
