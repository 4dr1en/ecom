<?php
include '../model/clientManager.php';
if(isset($_POST['email'], $_POST['password'])){
    $resultMsg= '<div class="errorMsg"><p>error, please verify your email or password</p></div>';
    if(isset($_SESSION['user'])){
        $resultMsg= '<div class="errorMsg"><p>error, you are already connected</p></div>';
    }
    else{
        $clientManager= new ClientManager();
        $user= $clientManager->getUserByEmail($_POST['email']);
        if($user && password_verify($_POST['password'], $user['password'])){
            $_SESSION['user']= $user;
            $resultMsg= '<div class="successMsg"><p>you logged in successfully</p></div>';
        }
    }
    

}
$PAGE['title']= 'Log In';
$PAGE['additionalCSS']= '/public/css/login.css';
$PAGE['mainSectionHtml']= '../view/login_view.php';
include '../view/view.php';
