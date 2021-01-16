<?php

if(isset($_SESSION['user'])){
    $PAGE['mainSectionHtml']= '../view/account_view.php';
    $PAGE['additionalCSS']= '/public/css/account.css';
}
else{
    $PAGE['mainSectionHtml']= '../view/404_view.php';    
}
include('../view/view.php');