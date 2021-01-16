<?php

include_once '../model/commandManager.php';
include_once '../model/paymentMethodManager.php';

$paymentMethodManager = new PaymentMethodManager();

if(isset($_POST['paymentMethod'])) {
    if($_POST['paymentMethod'] == 'creditCard') {
        $paymentMethod['method'] = $_POST['paymentMethod'];

        $value[] = $_POST['cardNumber'];
        $value[] = $_POST['expiryMonth'] . '/' . $_POST['expiryYear'];
        $value[] = $_POST['cardName'];
        $paymentMethod['value'] = implode('&', $value);
        echo('camesoule');
    } elseif($_POST['paymentMethod'] == 'paypal') {
        $paymentMethod['method'] = $_POST['paymentMethod'];
        $paymentMethod['value'] = $_POST['value'];
    }
    $paymentMethod['id_client'] = $_SESSION['user']['id'];
    $paymentMethodManager->addPaymentMethod($paymentMethod);
}

$paymentsMethodByCard = $paymentMethodManager->getPaymentMethodbycardbyUserId();
$paymentsMethodByPaypal = $paymentMethodManager->getPaymentMethodbyPaypalbyUserId();
foreach($paymentsMethodByCard as $key => $paymentMethodByCard) {
    $temp = explode("&", $paymentMethodByCard['value']);
    $paymentsMethodByCard[$key]['cardNumber'] = $temp[0];
    $paymentsMethodByCard[$key]['cardDate'] = $temp[1]; 
    $paymentsMethodByCard[$key]['cardName'] = $temp[2];
}

var_dump($paymentsMethodByPaypal);
$PAGE['mainSectionHtml']= '../view/myPaymentMethod_view.php';
include '../view/view.php';