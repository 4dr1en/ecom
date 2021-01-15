<?php

include_once '../model/clientManager.php';
include_once '../model/commandManager.php';

if(isset($_SESSION['user'])){
    $commandManager= new CommandManager();
    var_dump($_SESSION['user']['id']);
    $cartId= $commandManager->getCartId($_SESSION['user']['id']);
    var_dump($cartId);
}







$PAGE['title']= 'My Cart';
//$PAGE['additionalCSS']= '/public/css/?.css';
$PAGE['mainSectionHtml']= '../view/myCart_view.php';
include '../view/view.php';