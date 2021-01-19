<?php

class CategoryManager extends Manager{
    
    public function getCategoryName($idCategory){

        $stmt = $this->_pdo->prepare(
            "SELECT name FROM category
            WHERE id = :idCategory"
        );

        $stmt->bindValue(':idCategory', $idCategory, PDO::PARAM_INT);

        try {
            $stmt->execute();
            return $stmt->fetch()['name'];
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function getCategoryId($nameCategory){

        $stmt = $this->_pdo->prepare(
            "SELECT id FROM category
            WHERE name = :$nameCategory"
        );

        $stmt->bindValue(':$nameCategory', $nameCategory);

        try {
            $stmt->execute();
            return $stmt->fetch()['id'];
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }
}
