<?php

include_once '../model/commandManager.php';
include_once '../model/commandItemSnapshotManager.php';

if(isset($_SESSION['user'])){
    $commandManager= new CommandManager();
    $commandItemSnapshotManager= new CommandItemSnapshotManager();
    if(
        isset($_GET['command']) &&
        $commandManager->doesThisUserOwnThisCommand($_SESSION['user']['id'], $_GET['command'])
    ){
        $item= $commandItemSnapshotManager->getItemsByIdCommand($_GET['command']);
    }





    
    $commands= $commandManager->getOrdersByUserId($_SESSION['user']['id']);

    $PAGE['title']= 'Commands History';
    //$PAGE['additionalCSS']= '/public/css/?.css';
    $PAGE['mainSectionHtml']= '../view/commandsHistory_view.php';
    include '../view/view.php';
} else{
    header('Location: /login');      
    exit();
}