<?php

include_once '../model/commandManager.php';
include_once '../model/paymentMethodManager.php';

$paymentMethodManager = new PaymentMethodManager();
//add payment method
if(isset($_POST['paymentMethod'])) {
    if($_POST['paymentMethod'] == 'creditCard') {
        $paymentMethod['method'] = $_POST['paymentMethod'];

        $value[] = $_POST['cardNumber'];
        $value[] = $_POST['expiryMonth'] . '/' . $_POST['expiryYear'];
        $value[] = $_POST['cardName'];
        $paymentMethod['value'] = implode('&', $value);
    } elseif($_POST['paymentMethod'] == 'paypal') {
        $paymentMethod['method'] = $_POST['paymentMethod'];
        $paymentMethod['value'] = $_POST['value'];
    }
    $paymentMethod['id_client'] = $_SESSION['user']['id'];
    if($paymentMethodManager->doesMyPaymentMethodExist($paymentMethod['value'])) {
        $paymentMethodManager->addPaymentMethod($paymentMethod);
        echo'<h3>Your payment method has been registered</h3>';
    }
    echo'<h3>This payment method is already registed</h3>';

}

//print payment method
$paymentsMethodByCard = $paymentMethodManager->getPaymentMethodbycardbyUserId();
$paymentsMethodByPaypal = $paymentMethodManager->getPaymentMethodbyPaypalbyUserId();
foreach($paymentsMethodByCard as $key => $paymentMethodByCard) {
    $temp = explode("&", $paymentMethodByCard['value']);
    $paymentsMethodByCard[$key]['cardNumber'] = $temp[0];
    $paymentsMethodByCard[$key]['cardDate'] = $temp[1]; 
    $paymentsMethodByCard[$key]['cardName'] = $temp[2];
}

//remove payment method
if(isset($_GET['paymentMethodId']) && $_GET['payment'] == 'remove')
    $paymentMethodManager->removeMyPaymentMethod($_GET['paymentMethodId']);


$PAGE['additionalJS']='/public/js/myPaymentMethod.js';
$PAGE['mainSectionHtml']= '../view/myPaymentMethod_view.php';
$PAGE['additionalCSS']='/public/css/paymentMethod.css';
include '../view/view.php';