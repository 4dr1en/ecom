<?php

class ItemManager extends Manager{

    public function getAllItems() {
        $sql = "SELECT * FROM item ORDER BY price DESC LIMIT 12";
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
}