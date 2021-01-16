<?php

include_once '../model/commandManager.php';
include_once '../model/paymentMethodManager.php';

if(isset($_POST['cardNumber'])) {
    $paymentMethodManager = new PaymentMethodManager();
    $paymentMethod['method'] = $_POST['paymentMethod'];
    $value[] = $_POST['cardNumber'];
    $value[] = $_POST['expiryMonth'] . '/' . $_POST['expiryYear'];
    $value[] = $_POST['cardName'];
    $paymentMethod['value'] = implode('&', $value);

    $paymentMethod['id_client'] = $_SESSION['user']['id'];
    $paymentMethodManager->addPaymentMethod($paymentMethod);
}
$PAGE['mainSectionHtml']= '../view/mypaymentmethod_view.php';
include '../view/view.php';