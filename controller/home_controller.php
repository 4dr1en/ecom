<?php
include_once '../model/clientManager.php';
$clientManager= new ClientManager();
$listClients= $clientManager->getAllClients();

$PAGE['mainSectionHtml']= '../view/home_view.php';
include '../view/view.php';
