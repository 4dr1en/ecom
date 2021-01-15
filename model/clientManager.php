<?php

class ClientManager extends Manager{

    public function getAllClients() {
        $sql = "SELECT * FROM client";
        $stmt = $this->_pdo->prepare($sql);
    
        try {
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }
}
