<?php
include_once '../model/categoryManager.php';

class CommandItemSnapshotManager extends Manager{
    public function saveAnItem($idCommand, $nameItem, $price, $category, $quantity){
        $stmt = $this->_pdo->prepare("INSERT INTO command_item_smapshot(id_command, name_item, price, category, quantity) 
        VALUES (:id_command, :name_item, :price, :category, :quantity)");
        $stmt->bindValue(':id_command', $idCommand, PDO::PARAM_INT);
        $stmt->bindValue(':name_item', $nameItem);
        $stmt->bindValue(':price', $price);
        $stmt->bindValue(':category', $category);
        $stmt->bindValue(':quantity', $quantity);

        try {
            return $stmt->execute();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function saveItems($idCommand, $contentCart){
        $categoryManager= new CategoryManager(); 
        foreach ($contentCart as $item) {
            $idCategory= $categoryManager->getCategoryName($item['id_category']);
            $this->saveAnItem($idCommand, $item['name'], $item['price'], $idCategory, $item['quantity']);
        }
    }

    public function getItemsByIdCommand($idCommand){
        $stmt = $this->_pdo->prepare(
            "SELECT * FROM command_item_smapshot
            WHERE id_command = :idCommand"
        );

        $stmt->bindValue(':idCommand', $idCommand);

        try {
            $stmt->execute();
            return $stmt->fetchAll();

        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }
    
}