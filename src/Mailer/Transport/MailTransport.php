<?php
namespace App\Mailer\Transport;

use Cake\Mailer\AbstractTransport;
use Cake\Mailer\Email;

class MailTransport extends AbstractTransport
{
    public function send(Email $email)
    {
       // $yourInstance = $email->transport('SendGrid')->transportClass();
		//$yourInstance->myCustomMethod();
		$email->send();
    }
}
?>