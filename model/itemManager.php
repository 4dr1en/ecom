<?php

class ItemManager extends Manager{

    public function getAllItems() {
        $sql = "SELECT * FROM item ORDER BY price DESC LIMIT 20";
        $stmt = $this->_pdo->query($sql);

        try {
            return $stmt->fetchAll();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }
    public function getItemById($id) {
        $stmt = $this->_pdo->prepare("SELECT * FROM item WHERE id = :id");
        $stmt->bindValue('id', $id);

        try {
            $stmt->execute();
            return $stmt->fetch();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }
    
    public function getItemsByCategory($catId) {
        $stmt = $this->_pdo->prepare(
            "SELECT * FROM item 
             WHERE id_category = 
                (SELECT id FROM category WHERE id = :catId)"
        );

        $stmt->bindValue(':catId', $catId);
    
        try {
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function getAllCategory() {

        $stmt = $this->_pdo->prepare("SELECT * FROM category");    
        
        try {
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function getItemsByKeyword($keyword){
        $stmt = $this->_pdo->prepare(
            "SELECT * FROM item 
             WHERE name LIKE :query"
        );

        $stmt->bindValue(':query', '%'.$keyword.'%');
    
        
        $stmt->execute();
        $result= $stmt->fetchAll();
        if(!count($result)){
            $stmt = $this->_pdo->prepare(
                "SELECT * FROM item 
                 WHERE description LIKE :query"
            );
    
            $stmt->bindValue(':query', '%'.$keyword.'%');
        
            
            $stmt->execute();
            $result= $stmt->fetchAll();
        }
        return $result;
    }
}
