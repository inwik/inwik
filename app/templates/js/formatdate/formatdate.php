<?php
    function format_date($datetime){
        setlocale(LC_TIME,"spanish");
        $now = date('Y-m-d H:i:s');
        $year = date('Y');
        $month = date('m');
        $day = date('d');
        $hour = date('H');
        $minute = date('i');

        $datetime_year = strftime("%Y",strtotime($datetime));
        $datetime_month = strftime("%m",strtotime($datetime));
        $datetime_day = strftime("%d",strtotime($datetime));
        $datetime_hour = strftime("%H",strtotime($datetime));
        $datetime_minute = strftime("%M",strtotime($datetime));

        $days_diff = $day - $datetime_day;
        $minutes_diff = $minute - $datetime_minute;

        if ($datetime_year == $year){ //Este año
            if (($datetime_month == $month) && ($days_diff == 0)){ //Hoy
                if (($datetime_hour == $hour) && ($minutes_diff < 2)){
                    $datetime="Ahora mismo"; //Hoy hace menos de dos minutos
                }else if(($datetime_hour == $hour) && ($minutes_diff < 59)){
                    $datetime="Hace ". $minutes_diff ." minutos"; //Hoy hace menos de una hora
                }
                else{
                    $datetime=utf8_encode(strftime("Hoy a las %H:%M",strtotime($datetime))); //Hoy hace más de una hora
                }
            }elseif (($datetime_month == $month) && ($days_diff == 1)){
                $datetime=utf8_encode(strftime("Ayer a las %H:%M",strtotime($datetime))); //Ayer
            }elseif (($datetime_month == $month) && ($days_diff <= 7)){
                $datetime=utf8_encode(strftime("El %a. a las %H:%M",strtotime($datetime))); //Esta semana
            }else{
                $datetime=utf8_encode(strftime("El %e de %b. a las %H:%M",strtotime($datetime))); //Más de una semana
            }
        }else{
            $datetime=utf8_encode(strftime("%e %b. %Y a las %H:%M",strtotime($datetime))); //Más de un año
        }
        return $datetime;
    }
?>
