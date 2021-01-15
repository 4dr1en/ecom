<?php
include_once '../model/clientManager.php';
include_once '../model/itemManager.php';
include_once '../model/orderManager.php';
$itemManager= new ItemManager();
$listClients= $itemManager->getItemsByCategory('Volkswagen');
var_dump($listClients);
include_once '../model/itemManager.php';
$clientManager= new ClientManager();
$listClients= $clientManager->getAllClients();


$orderManager= new OrderManager();
$listOrders= $orderManager->getOrdersByUserId(5);
var_dump($listOrders);


$items = new ItemManager();
$listItems = $items->getAllItems();

$PAGE['mainSectionHtml']= '../view/home_view.php';
include '../view/view.php';