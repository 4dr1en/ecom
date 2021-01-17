<?php

include_once '../model/itemManager.php';
include_once '../model/commandManager.php';
include_once '../model/contentCommandManager.php';

$idItem = (int)$_GET['idProduct'];

$itemManager = new ItemManager();
$item = $itemManager->getItemById($idItem);

if(isset($_GET['action']) && $_GET['action'] == 'addToCart'){

    $errorMsgs= [];
    if(!isset($_SESSION['user'])){
        $msgCart= 'You must be connected to add a product into you cart.';
    }
    else{
        $commandManager= new CommandManager();
        $cartId= $commandManager->getCartId($_SESSION['user']);

        $contentCommandManager= new ContentCommandManager();
        if($contentCommandManager->itemExistInThisCart($cartId, $idItem)){
            $contentCommandManager->incrementItem($cartId, $idItem);
        }
        else{
            $contentCommandManager->setItemToCart($cartId, $idItem);
        }
        $msgCart= 'This product has been added to your cart, <a href="/mycart">See my cart</a>';
    }

}
$PAGE['mainSectionHtml']= '../view/show_article_view.php';
include '../view/view.php';
