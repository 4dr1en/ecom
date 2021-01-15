<?php
include_once '../model/clientManager.php';
include_once '../model/itemManager.php';
include_once '../model/orderManager.php';
$itemManager= new ItemManager();
$listClients= $itemManager->getItemsByCategory('Volkswagen');
var_dump($listClients);


$orderManager= new OrderManager();
$listOrders= $orderManager->getOrdersByUserId(5);
var_dump($listOrders);

$PAGE['mainSectionHtml']= '../view/home_view.php';
include '../view/view.php';