<?php

class ContentCommandManager extends Manager{
    public function getContentByCommandId($commandId){
        $stmt = $this->_pdo->prepare(
            "SELECT * FROM content_command RIGHT JOIN item 
            ON content_command.id_item = item.id
            WHERE content_command.id_command = :commandId"
        );

        $stmt->bindValue(':commandId', $commandId);
    
        try {
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function setItemToCart($cartId, $productId){

        $stmt = $this->_pdo->prepare(
            "INSERT INTO content_command(id_command , id_item, quantity ) 
            VALUES ( :cartId, :id_item, 1)"
        );

        $stmt->bindValue(':cartId', $cartId);
        $stmt->bindValue(':id_item', $productId);
    
        try {
            return $stmt->execute();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function itemExistInThisCart($commandId, $itemId){

        $stmt = $this->_pdo->prepare(
            "SELECT count(*) as nb FROM content_command 
            WHERE id_command = :commandId
            AND id_item = :itemId"
        );

        $stmt->bindValue(':commandId', $commandId);
        $stmt->bindValue(':itemId', $itemId);
    
        try {
            $stmt->execute();
            if($stmt->fetch()['nb'] > 0){
                return true;
            }
            return false;
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function incrementItem($commandId, $itemId){

        $stmt = $this->_pdo->prepare(
            "UPDATE content_command 
            SET quantity=(
                (SELECT quantity FROM content_command 
                WHERE id_command = :commandId
                AND id_item = :itemId) + 1
            ) 
            WHERE id_command = :commandId
            AND id_item = :itemId"
        );

        $stmt->bindValue(':commandId', $commandId);
        $stmt->bindValue(':itemId', $itemId);
    
        try {
            return $stmt->execute();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function getPrice($contentCart) {
        
        $price = 0;

        foreach($contentCart as $item) {
            $totals[] =(float)$item["quantity"] * (float)$item["price"];
        }
        foreach($totals as $total) {
            $price += $total;
        }
        return $price;
    }

}