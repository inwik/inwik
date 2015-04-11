<?php
    require_once 'app/core/controller.php';

    class Home extends Controller{

        public function __construct()
        {
            $this->loadModel('user');
            $this->u = new Users_Model();
        }

        function index_home(){
            $data['page_title'] = PAGE_NAME;
            $page = $this->loadView('home');
            /*$data['prop_list'] = $this->_proposal->get_proposals();*/
            $this->render($page, $data);
        }

    }
?>
