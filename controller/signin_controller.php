<?php

include '../model/clientManager.php';
$clientManager= new ClientManager();

$error = false;
$txtErrors = [];
$newUserRegistered= false;
if(isset($_POST['firstname'])){
    //test session
    if(isset($_SESSION['user'])){
        $error = true;
        $txtErrors[] = 'You are already connected';
    }


    //validation firstname, lastname and gender
    if (!isset($_POST['firstname']) || strlen($_POST['firstname']) < 1) {
        $error = true;
        $txtErrors[] = 'You must enter your first name';
    }

    if (!isset($_POST['lastname']) || strlen($_POST['lastname']) < 1) {
        $error = true;
        $txtErrors[] = 'You must enter your last name';
    }

    //validation pwd
    if (!isset($_POST['pwd1'], $_POST['pwd2'])) {
        $error = true;
        $txtErrors[] = 'Passwords reception error';
    } elseif ($_POST['pwd1'] != $_POST['pwd2']) {
        $error = true;
        $txtErrors[] = 'The passwords must be the same';
    } elseif (strlen($_POST['pwd1']) < 8) {
        $error = true;
        $txtErrors[] = 'Your password must be at least 8 characters long';
    }

    //validation phone number
    if (!isset($_POST['phone']) || !preg_match('/([0-9]{2}\.?){4}[0-9]{2}/', $_POST['phone'])) {
        $error = true;
        $txtErrors[] = 'The phone number entered is not valid.';
    }

    //validation email
    if (!isset($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
        $error = true;
        $txtErrors[] = 'The email address entered is not valid.';
    }
    else if($clientManager->emailExist($_POST['email'])){
        $error = true;
        $txtErrors[] = 'This email address is already use.';
    }

    //saving the informations
    if (!$error) {
        $hash = password_hash($_POST['pwd1'], PASSWORD_ARGON2ID);
        $user= [
            'firstname'=> htmlspecialchars($_POST['firstname']),
            'lastname'=> htmlspecialchars($_POST['lastname']),
            'password'=> $hash,
            'phone'=> htmlspecialchars($_POST['phone']),
            'email'=> htmlspecialchars($_POST['email'])
        ];

        $newUserRegistered= $clientManager->setNewUser($user);
    }
}




$PAGE['title']= 'signin';
$PAGE['additionalCSS']= '/public/css/signin.css';
$PAGE['mainSectionHtml']= '../view/signin_view.php';
include '../view/view.php';

