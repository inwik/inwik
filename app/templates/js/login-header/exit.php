<?
    session_start();
    @include_once('../../includes/config.php');
    setcookie("username", $name, strtotime('-15 days'), "/", $page_index);
    setcookie("password", $password, strtotime('-15 days'), "/", $page_index);
    unset($_SESSION["username"]);
    unset($_SESSION["password"]);
    session_destroy();
?>
