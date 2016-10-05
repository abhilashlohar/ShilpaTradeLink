<?php
use Cake\Mailer\Email;

// Sample Mail configuration
Email::configTransport('default', [
    'className' => 'Mail'
]);

// Sample smtp configuration.
Email::configTransport('gmail', [
    'host' => 'ssl://smtp.gmail.com',
    'port' => 465,
    'username' => 'abhilashlohar01@gmail.com',
    'password' => 'Veerhanuman@1abhijaimatadi',
    'className' => 'Smtp'
]);

$email = new Email('default');
$email->from(['abhilashlohar01@gmail.com' => 'Abhilash Lohar'])
    ->to('abhilashlohar01@outlook.com')
    ->subject('About')
    ->send('My message');
?>