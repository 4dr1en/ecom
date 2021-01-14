<?php

include '../view/signin_view.php';
include '../model/user.php';

if(isset($_POST['firstname'])) {
    addUser($pdo, $_POST);
}

