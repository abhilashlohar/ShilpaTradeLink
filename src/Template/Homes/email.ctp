<?php
namespace App\Mailer\Transport;

use Cake\Mailer\AbstractTransport;
use Cake\Mailer\Email;

Email::configTransport('SendGrid', [
'host' => 'smtp.sendgrid.net',
'api_key' => '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',
'port' => 587,
'username' => 'ashish@phppoets.in',
'password' => 'shreeradajibavji@1008',

'client' => 'shantismelting.com',
'className' => 'Mail',
'tls' => null,
'url' => env('EMAIL_TRANSPORT_DEFAULT_URL', null),
]);
$email = new Email();
$email->profile('default');
//$email->deliver('ashishbohara1008@gmail.com', 'Subject', 'Message', ['from' => 'ashishbohara1008@gmail.com']);
$email->from(['ashishbohara1008@gmail.com' => 'Desk'])
->to('ashishbohara1008@gmail.com')
->subject('Desk Requirement')
->send('hello');
/*
$email->profile('default');
		if(is_array($site_url))
		{
			$email->attachments($site_url);
		}
*/
/*$email->from(['ashishbohara1008@gmail.com' => 'Desk'])
->to('ashishbohara1008@gmail.com')
->subject('Desk Requirement')
->send('hello');

*/

?>

