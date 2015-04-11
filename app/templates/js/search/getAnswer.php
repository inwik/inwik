<?php
    if ($_SERVER['REQUEST_METHOD']=='POST') {
        include_once('../../includes/config.php');
        if (isset ($_POST["propsearch"])){
            $propsearch=trim($_POST["propsearch"]);
            $limit=$_POST["limit"];

            include_once('../../includes/proposal/Proposal.php');
            $p = new Proposal();
            $answer = $p->searchProposals($propsearch, $limit);
        }
        else if (isset ($_POST["usersearch"])){
            $usersearch=trim($_POST["usersearch"]);
            $limit=$_POST["limit"];

            include_once('../../includes/user/User.php');
            $u = new User();
            $answer = $u->searchUsers($usersearch,$limit);
        }
        print json_encode($answer);
    }

    else{
        echo "no hagas trampa";
    }

?>
