<?php
    class Proposal extends Controller{

        function index_proposals(){
            $this->loadModel('proposal');
            $p = New Proposals_Model();
            $this->data['page_title'] = PAGE_NAME.' - '.__("Propuestas");

            @$action=$_GET["action"];
            switch($action){
                case 'delete':

                break;

                default:
                    if(isset($_GET["token"])){
                        $this->data['proposal_title']=$_GET["token"];
                        $this->render('proposals','proposal',$this->data);
                    }else{
                        $this->data['proposal_list']="";
                        /*$prop_list = $this->_proposal->getList(order,sort,limit);
                        foreach($prop_list as $proposal){*/
                            $this->data['prop_title']="Lorem ipsum";
                            $this->data['prop_url']="lorem_ipsum";
                            $this->data['prop_date']="martes 18 de junio a las 17:26h";
                            $this->data['prop_description']="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus tempus ullamcorper augue, eget tristique tortor tincidunt in. Fusce eget nunc ac leo elementum mattis quis aliquet nunc. Proin a suscipit lacus. Donec gravida pharetra hendrerit. Ut sed dolor venenatis, bibendum urna at, ultrices leo. Phasellus iaculis leo et sem egestas, at mattis mi pellentesque. Quisque ut dolor et tellus hendrerit porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus tempus ullamcorper augue, eget tristique tortor tincidunt in.";
                            $this->data['proposal_list'].=$this->loadView('proposals','proposal_card',$this->data);
                        /*}*/
                        $this->render('proposals', 'home', $this->data);
                    }
            }
        }

    }
?>
