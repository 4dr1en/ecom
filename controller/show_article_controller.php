<?php

include_once '../model/itemManager.php';
include_once '../model/commandManager.php';
include_once '../model/contentCommandManager.php';
if(isset($_GET['idProduct'])){
    $idItem = (int)$_GET['idProduct'];

    $itemManager = new ItemManager();
    $item = $itemManager->getItemById($idItem);
    
    if(isset($_GET['action']) && $_GET['action'] == 'addToCart'){
    
        $errorMsgs= [];
        if(!isset($_SESSION['user'])){
            $msgCart= '<p class="errorMsg">You must be connected to add a product into you cart.<p>';
        }
        else{
            $commandManager= new CommandManager();
            $cartId= $commandManager->getCartId($_SESSION['user']['id']);
    
            $contentCommandManager= new ContentCommandManager();
            if($contentCommandManager->itemExistInThisCart($cartId, $idItem)){
                $contentCommandManager->incrementItem($cartId, $idItem);
            }
            else{
                $contentCommandManager->setItemToCart($cartId, $idItem);
            }
            $msgCart= '<p class="successMsg">This product has been added to your cart, <a href="/mycart">See my cart</a>.<p>';
        }
    
    }
    $PAGE['mainSectionHtml']= '../view/show_article_view.php';
    $PAGE['additionalCSS']='/public/css/showArticle.css';
    $PAGE['additionalJS']='/public/js/article.js';
    include '../view/view.php';

}elseif(isset($_POST['idProduct'], $_POST['quantity']) && $_POST['quantity'] > 0 && $_POST['quantity'] <= 9){
    $msgCart= '<p class="errorMsg">An error occured.<p>';
    $idItem = (int)$_POST['idProduct'];

    $itemManager = new ItemManager();
    $item = $itemManager->getItemById($idItem);
    if(!isset($_SESSION['user'])){
        $msgCart= '<p class="errorMsg">You must be connected to add a product into you cart.<p>';
    }
    else{
        $commandManager= new CommandManager();
        $cartId= $commandManager->getCartId($_SESSION['user']['id']);

        $contentCommandManager= new ContentCommandManager();
        if($contentCommandManager->itemExistInThisCart($cartId, $idItem)){
            $contentCommandManager->updateItemQuantity($cartId, $idItem, $_POST['quantity']);
        }
        else{
            $contentCommandManager->setItemToCart($cartId, $idItem, $_POST['quantity']);
        }
        $msgCart= '<p class="successMsg">This product has been added to your cart, <a href="/mycart">See my cart</a>.<p>';
    }
    $PAGE['mainSectionHtml']= '../view/show_article_view.php';
    $PAGE['additionalCSS']='/public/css/showArticle.css';
    $PAGE['additionalJS']='/public/js/article.js';
    include '../view/view.php';
}
else{
    $PAGE['mainSectionHtml']= '../view/404_view.php';
    include '../view/view.php';
}

