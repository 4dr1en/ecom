<?php
include '../model/clientManager.php';

if(isset($_SESSION['user'])){
    $editManager = new ClientManager();
    $pInfo =  $editManager->getPersonalinfo();
    var_dump($pInfo);
    if(isset($_POST['firstName']) && $_POST['firstName'] != '') {
        $editManager->editFirstname($_POST['firstName']);
        $_SESSION['user']['first_name'] = $pInfo['first_name'];
    }
    if(isset($_POST['lastName']) && $_POST['lastName'] != '') {
        $editManager->editLastName($_POST['lastName']);
        $_SESSION['user']['last_name'] = $pInfo['last_name'];
    }
    if(isset($_POST['email']) && $_POST['email'] != '') {
        $editManager->editEmail($_POST['email']);
        $_SESSION['user']['email'] = $pInfo['email'];
    }
    if(isset($_POST['phone']) && $_POST['phone'] != '') {
        $editManager->editPhone($_POST['phone']);
        $_SESSION['user']['phone'] = $pInfo['phone'];
    }

    if(isset($_POST['currentPassword']) && password_verify($_POST['currentPassword'], $pInfo['password']))
    {
        if($_POST['newPassword'] === $_POST['confirmPassword']) {
            echo("trololo");
            $hash = password_hash($_POST['newPassword'], PASSWORD_ARGON2ID);
            $editManager->editPassword($_POST['newPassword']);
            $return = "Your Password has been modified";
        }
        else 
            $return = "The confirm Password isn't the same, please retry";
    }
    elseif(isset($_POST['currentPassword']) && (!password_verify($_POST['currentPassword'], $pInfo['password'])))
        $return = "Current Password isn't valid";
    

    $PAGE['mainSectionHtml']= '../view/account_view.php';
    $PAGE['additionalCSS']= '/public/css/account.css';
}




else{
    $PAGE['mainSectionHtml']= '../view/404_view.php';    
}
include('../view/view.php');