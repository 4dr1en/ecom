<?php
include '../model/clientManager.php';

if(isset($_SESSION['user'])){

    $editManager = new ClientManager();
    if(isset($_POST['firstName']) && $_POST['firstName'] != '') {
        $editManager->editFirstname($_POST['firstName']);
    }
    elseif(isset($_POST['lastName']) && $_POST['lastName'] != '') {
        $editManager->editLastName('last_name', $_POST['lastName']);
    }
    elseif(isset($_POST['email']) && $_POST['email'] != '') {
        $editManager->editEmail($_POST['email']);
    }
    elseif(isset($_POST['phone']) && $_POST['phone'] != '') {
        $editManager->editPhone($_POST['phone']);
    }
    






    $PAGE['mainSectionHtml']= '../view/account_view.php';
    $PAGE['additionalCSS']= '/public/css/account.css';
}
else{
    $PAGE['mainSectionHtml']= '../view/404_view.php';    
}
include('../view/view.php');