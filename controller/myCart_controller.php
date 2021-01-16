<?php

include_once '../model/commandManager.php';
include_once '../model/contentCommandManager.php';

if(isset($_SESSION['user'])){
    $commandManager= new CommandManager();
    $contentCommandManager= new ContentCommandManager();
    $cartId= $commandManager->getCartId($_SESSION['user']['id']);
    
    //cart modification
    if(isset($_POST['saveCart'])){
        foreach ($_POST as $key => $value) { //get couple: id product->quantity
            if(preg_match('/^Quantity/', $key) && $value <= 9 && $value > 0){
                $idProduct= explode('-', $key)[1];
                $contentCommandManager->updateItemQuantity($cartId, $idProduct, $value); //save the quantity
            }
        }
    }

    //delet item in cart
    if(isset($_GET['action'], $_GET['idItem']) && $_GET['action'] == 'removeItem'){
        $contentCommandManager->removeItem($cartId, $_GET['idItem']);
    }
    
    
    $contentCart= $contentCommandManager->getContentByCommandId($cartId);
    if(count($contentCart)){
        $total= $contentCommandManager->getPrice($contentCart);
        $tva= round((1/6) * $total, 2);
        $ht= $total - $tva; 
    }


    
}







$PAGE['title']= 'My Cart';
$PAGE['additionalCSS']= '/public/css/mycart.css';
$PAGE['additionalJS']= '/public/js/mycart.js';
$PAGE['mainSectionHtml']= '../view/myCart_view.php';
include '../view/view.php';