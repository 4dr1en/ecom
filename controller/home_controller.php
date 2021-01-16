<?php

include_once '../model/itemManager.php';

$items = new ItemManager();
$listItems = $items->getAllItems();

$PAGE['mainSectionHtml']= '../view/home_view.php';
include '../view/view.php';
