<?php
include_once '../model/itemManager.php';

$im = new ItemManager();
$categories = $im->getAllCategory();
if(isset($_GET['catid'])) {
    $id = (int)$_GET['catid'];
    $items = $im->getItemsByCategory($id);
}
$PAGE['mainSectionHtml']= '../view/show_catégorie_view.php';
include '../view/view.php';