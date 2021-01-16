<?php
// Database connection : $pdo
include_once '../model/manager.php';
session_start();
// Manage query strings
$slug =  explode('?', $_SERVER['REQUEST_URI'])[0];

// Router
switch ($slug) {
    case '/':
        include '../controller/home_controller.php';
        break;
    case '/signin':
        include '../controller/signin_controller.php';
        break;
    case '/login':
        include '../controller/login_controller.php';
        break;
    case '/article':
        include '../controller/show_article_controller.php';
        break;
    case '/categorie':
        include '../controller/show_categorie_controller.php';
        break;
    case '/mycart':
        include '../controller/mycart_controller.php';
        break;
    case '/account':
        include '../controller/account_controller.php';
        break;
    case '/logout':
        include '../controller/logout_controller.php';
        break;

    default:
        include "../controller/404_controller.php";
        break;
}



