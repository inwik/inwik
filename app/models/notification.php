<?php
class Notifications_Model extends Database{

    var $to, $from, $title, $body, $url, $type, $class;

    function __construct(){
       parent::__construct();
    }
    //Write notification
    function addNotification()
    {
        $notif_date = date ("Y-m-d H:i:s");
        $query = "INSERT INTO notifications (date, to, from, title, body, url, type, class) VALUES ('$this->date', '$this->to', '$this->from', '$this->title', '$this->body', '$this->url', '$this->type', '$this->class')";
        if ($this->_db->query($query))
        return true;
        return false;
    }

    //Get notifications
    function getNotifications()
    {
        $query = "SELECT * FROM notifications WHERE to='$this->to' ORDER BY notif_date DESC";
        if($answer=$this->_db->query($query)){
            while($fila = $answer->fetch_row()){
                $notifications[]=$fila;
            }
            if ($this->watchNotifications()){
                return $notifications;
            }
        }
        return false;
    }

    //Count not watched notifications
    function countNotifications(){
        $query = "SELECT COUNT(*) FROM notifications WHERE to='$this->to' AND read = '0'";
        $answer = $this->_db->query($query)->fetch_row();
        if ($answer!=NULL)
        return $answer[0];
        return false;
    }

    //Get new notifications
    function newNotifications($userid){
        $query = "SELECT * FROM notifications WHERE notif_user='$this->to' AND watched = 0";
        if($answer=$this->_db->query($query)){
            while($fila = $answer->fetch_row()){
                $notifications_list[]=$fila;
            }
            return $notifications_list;
        }
    }


    //Mark as watched
    function watchNotifications()
    {
        $query = "UPDATE notifications SET watched=1 WHERE to='$this->to'";
        if ( $this->_db->query($query))
        return true;
        return false;
    }

    //Mark as read
    function readNotification()
    {
        $query = "UPDATE notifications SET readon=1 WHERE date='$this->date' AND to='$this->to'";
        if ( $this->_db->query($query))
        return true;
        return false;
    }

    //Mark all as read
    function readAllNotifications()
    {
        $query = "UPDATE notifications SET readon=1 WHERE to='$this->to'";
        if ( $this->_db->query($query))
        return true;
        return false;
    }

    //Delete old notifications
    function deleteOldNotifications(){
        $query = "SELECT COUNT(*) FROM notifications WHERE to='$this->to'";
        $answer = $this->_db->query($query)->fetch_row();
        if ($answer!=NULL){
            $query = "DELETE FROM notifications WHERE to = '$this->to' ORDER BY date DESC LIMIT 21 $answer[0]";
            if ( $this->_db->query($query))
            return true;
            return false;
        }else{
            return false;
        }
    }

    //No disturb status
    function noDisturbStatus($userid){
        $query = "SELECT notification FROM users WHERE id='$this->to'";
        $answer = $this->_db->query($query)->fetch_row();
        if ($answer[0]==0)
        return true;
        return false;
    }

    //Activate notifications
    function activateNotifications($userid){
        $query = "UPDATE users SET notification = 1 WHERE id='$this->to'";
        if ( $this->_db->query($query) )
        return true;
        return false;
    }

    //Deactivate notifications
    function deactivateNotifications($userid){
        $query = "UPDATE users SET notification = 0 WHERE id='$this->to'";
        if ( $this->_db->query($query) )
        return true;
        return false;
    }
}
