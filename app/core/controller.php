<?php
    class Controller {
        private $view = null;
        private $folder = null;
        private $data = array();
        private $modelName;

        public function __construct()
        {
            $this->loadModel('user');
            $this->u = new Users_Model();
        }

        public function loadModel($modelName){
            require_once DIR."/app/models/$modelName.php";
        }

        public function loadHelper($file){
            require DIR."/app/helpers/$file.php";
        }

        public function loadView($folder,$view,$data=false){
            @extract($data);
            ob_start();                      // start capturing output
            @include DIR."/app/views/".$folder."/".$view.".php";   // execute the file
            $page = ob_get_contents();    // get the contents from the buffer
            ob_end_clean();
            return $page;
        }

        /*public function preRender(){
            if(!isset($_SESSION["login"])){
                $this->data["user"]="hola";
            }else{
                $this->data["user"]=$_SESSION["login"]["user"];
            }
        }*/

        public function render($folder, $view, $data=false){
            $page=$this->loadView($folder, $view, $data);
            //$this->preRender();
            require 'app/templates/page.php';
        }
    }

?>
