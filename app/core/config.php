<?php
    //Muestra de errores en hosting, solo para debug
    error_reporting(E_ALL);
    ini_set('display_errors', '1');

    //INFO-----------------------------------------------------
    define("PAGE_NAME", "inwik");
    define("DIR", dirname(dirname( __DIR__ )));
    define("PAGE_DOMAIN", "http://inwik.org");

    //Server information----------------------------------------
    define("DB_USER", "");
    define("DB_PASS", "");
    define("DB_NAME", "");
    define("DB_SERVER", "");

    //email information------------------------------------------
    define("CONTACT_EMAIL", "info@inwik.org");
    define("NOREPLY_EMAIL", "noreply@inwik.org");

    //TOKEN------------------------------------------------------
    define("GLOBAL_TOKEN", "INWIK");
    define("EMAIL_TOKEN", "INWIK");

    //TimeZone
    $time_zone="TZ=Europe/Madrid";
    putenv($time_zone);
?>
