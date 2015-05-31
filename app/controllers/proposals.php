<?php
    require_once 'app/core/controller.php';

    class Proposal extends Controller{

        public function __construct()
        {
            $this->loadModel('proposal');
            $this->p = new Proposals_Model();
        }

        function proposals_home(){
            $data['page_title'] = 'Propuestas';
            /*$data['prop_list'] = $this->_proposal->get_proposals();*/
            $this->render('proposals','home', $data);
        }

    }
?>
