<?php
// Database connection : $pdo
include_once '../model/manager.php';
session_start();

// Manage query strings
$slug =  explode('?', $_SERVER['REQUEST_URI'])[0];

// Router
switch ($slug) {
    // url
    case '/':
        // php file (controller)
        include '../controller/home_controller.php';
        break;
    case '/signin':
        include '../controller/signin_controller.php';
        break;
    case '/login':
        include '../controller/login_controller.php';
        break;
    case '/article':
        include '../controller/show_article.php';
        break;

    default:
        include "../controller/404_controller.php";
        break;
}


?>

