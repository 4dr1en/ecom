<?php

class ItemManager extends Manager{

    public function getItemsByCategory($nameCategory) {
        $stmt = $this->_pdo->prepare(
            "SELECT * FROM item 
            WHERE id_category = 
                (SELECT id FROM category WHERE name = :nameCategory)"
        );

        $stmt->bindValue(':nameCategory', $nameCategory);
    
        try {
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            //$this->_pdo->rollBack();
            throw $e;
        }
    }
}
