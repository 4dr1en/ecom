<?php

include_once '../model/clientManager.php';
include_once '../model/commandManager.php';
include_once '../model/contentCommandManager.php';

if(isset($_SESSION['user'])){
    $commandManager= new CommandManager();
    $contentCommandManager= new ContentCommandManager();
    $cartId= $commandManager->getCartId($_SESSION['user']['id'])['id'];
    $contentCart= $contentCommandManager->getContentByCommandId($cartId);
}







$PAGE['title']= 'My Cart';
//$PAGE['additionalCSS']= '/public/css/?.css';
$PAGE['mainSectionHtml']= '../view/myCart_view.php';
include '../view/view.php';