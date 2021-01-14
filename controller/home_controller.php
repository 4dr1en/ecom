<?php
include_once '../model/clientManager.php';
$clientManager= new ClientManager();
$listClients= $clientManager->getAllClients();
var_dump($listClients);
include '../view/home_view.php';
