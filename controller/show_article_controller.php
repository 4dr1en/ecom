<?php

include_once '../model/itemManager.php';
$id = (int)$_GET['id'];

$item = new ItemManager();
$itemById = $item->getItemById($id);
$PAGE['mainSectionHtml']= '../view/show_article_view.php';
include '../view/view.php';