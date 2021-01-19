<?php

include_once '../model/commandManager.php';
include_once '../model/contentCommandManager.php';
include_once '../model/paymentMethodManager.php';
include_once '../model/commandItemSnapshotManager.php';
include_once '../model/paymentManager.php';


if(isset($_SESSION['user'])){
    $commandManager= new CommandManager();
    $contentCommandManager= new ContentCommandManager();
    $paymentMethodManager= new PaymentMethodManager();

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
    else if(isset($_GET['action'], $_GET['idItem']) && $_GET['action'] == 'removeItem'){
        $contentCommandManager->removeItem($cartId, $_GET['idItem']);
    }

    //command
    else if(
        isset($_POST['buy']) &&
        isset($_POST['paymentMethod']) &&
        $paymentMethodManager->doesThisClientOwnThisPaymentMethod($_SESSION['user']['id'], $_POST['paymentMethod'])
    ){
        var_dump($_POST);
        //update cart
        foreach ($_POST as $key => $value) { //get couple: id product->quantity
            if(preg_match('/^Quantity/', $key) && $value <= 9 && $value > 0){
                $idProduct= explode('-', $key)[1];
                $contentCommandManager->updateItemQuantity($cartId, $idProduct, $value); //save the quantity
            }
        }
        //get cart udapted
        $contentCart= $contentCommandManager->getContentByCommandId($cartId);

        //save the ItemSnapshot
        $commandItemSnapshotManager = new CommandItemSnapshotManager();
        $commandItemSnapshotManager->saveItems($cartId ,$contentCart);

        //put the cart in command
        $commandManager->setPaid($cartId);

        //save the payment
        $total= $contentCommandManager->getPrice($contentCart);
        $tva= round((1/6) * $total, 2);
        $ht= $total - $tva; 

        $paymentManager= new PaymentManager();
        $paymentManager->setNewPayment($ht, $tva, $cartId, $_POST['paymentMethod']);

        //redirect to command history
        header('Location: /commandsHistory?command='.$cartId.'&newCommand=1');      
        exit();
    }
    

    //content cart
    
    $contentCart= $contentCommandManager->getContentByCommandId($cartId);
    if(count($contentCart)){
        $total= $contentCommandManager->getPrice($contentCart);
        $tva= round((1/6) * $total, 2);
        $ht= $total - $tva; 
    }

    //payment method
    $paymentsMethod = $paymentMethodManager->getPaymentMethodsByUserId($_SESSION['user']['id']);

}

$PAGE['title']= 'My Cart';
$PAGE['additionalCSS']= '/public/css/mycart.css';
$PAGE['additionalJS']= '/public/js/mycart.js';
$PAGE['mainSectionHtml']= '../view/myCart_view.php';
include '../view/view.php';