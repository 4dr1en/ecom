<?php
include_once '../model/clientManager.php';
include_once '../model/itemManager.php';
$clientManager= new ClientManager();
$listClients= $clientManager->getAllClients();


$items = new ItemManager();
$listItems = $items->getAllItems();

$PAGE['mainSectionHtml']= '../view/home_view.php';
include '../view/view.php';
