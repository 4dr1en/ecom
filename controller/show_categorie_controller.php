<?php
include_once '../model/itemManager.php';
include_once '../model/categoryManager.php';

$itemManager= new ItemManager();
$categories = $itemManager->getAllCategory();

$categoriesManager= new CategoryManager();
$currentCategoryName = "All Categories";

if(isset($_GET['catid'])) {
    $idCategory = (int)$_GET['catid'];
    $currentCategoryName = $categoriesManager->getCategoryName($idCategory);
    $items = $itemManager->getItemsByCategory($idCategory);
}
else{
    $items = $itemManager->getAllItems();
}
$PAGE['additionalCSS']= '/public/css/showCategorie.css';
$PAGE['mainSectionHtml']= '../view/show_categorie_view.php';
include '../view/view.php';