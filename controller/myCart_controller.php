<?php

include_once '../model/commandManager.php';
include_once '../model/contentCommandManager.php';

if(isset($_SESSION['user'])){
    $commandManager= new CommandManager();
    $contentCommandManager= new ContentCommandManager();
    $cartId= $commandManager->getCartId($_SESSION['user']['id']);
    $contentCart= $contentCommandManager->getContentByCommandId($cartId);

    $total= $contentCommandManager->getPrice($contentCart);
    $tva= round((1/6) * $total, 2);
    $ht= $total - $tva;
}







$PAGE['title']= 'My Cart';
//$PAGE['additionalCSS']= '/public/css/?.css';
$PAGE['mainSectionHtml']= '../view/myCart_view.php';
include '../view/view.php';