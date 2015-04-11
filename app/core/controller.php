<?php
    class Controller {
        var $modelName;

        public function loadModel($modelName){
            require "app/models/$modelName.php";
        }

        public function loadHelper($file){
            require "app/helpers/$file.php";
        }

        public function loadView($file){
            ob_start();                      // start capturing output
            include "app/views/".$file.".php";   // execute the file
            $page = ob_get_contents();    // get the contents from the buffer
            ob_end_clean();
			return $page;
        }

        public function render($page, $data = false, $error = false){
            require 'app/templates/page.php';
        }
    }

?>




