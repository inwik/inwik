<?php

    class Email
    {
        var $to;//receptor
        var $subject;//asunto
		var $body;//cuerpo email

        function getEmail($file)
        {
            ob_start();                      // start capturing output
            include($file);   // execute the file
            $content = ob_get_contents();    // get the contents from the buffer
            ob_end_clean();
			$this->body=$content;
        }

        function sendEmail()
        {
            require_once DIR.'/vendor/PHPMailer/PHPMailerAutoload.php';
            $mail = new PHPMailer();
			$mail->isMail();
            $mail->setFrom(NOREPLY_EMAIL, PAGE_NAME);
            $mail->addReplyTo(NOREPLY_EMAIL, PAGE_NAME);
            $mail->addAddress($this->to, $this->to);
            $mail->Subject = $this->subject;
            //$mail->AltBody="Cuerpo alternativo del mensaje en solo texto";
            $mail->msgHTML($this->body);
            //$mail->AddAttachment("ruta/archivoadjunto.jpg");
            $mail->CharSet = "UTF-8";
            //$mail->Encoding = "quotedprintable";
            if ($mail->Send())
            return true;
            return false;
        }

    }
?>
