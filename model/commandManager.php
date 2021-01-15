<?php

class CommandManager extends Manager{

    public function getOrdersByUserId($clientId) {
        $stmt = $this->_pdo->prepare(
            "SELECT * FROM command
            WHERE id_client = :id_client"
        );

        $stmt->bindValue(':id_client', $clientId);
    
        try {
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }
    
    public function getCartId($clientId){
        $stmt = $this->_pdo->prepare(
            "SELECT id FROM command
            WHERE id_client = :id_client
            AND paid = 0"
        );
        $stmt->bindValue(':id_client', $clientId, PDO::PARAM_INT);
        $stmt->execute();
        $idCart= $stmt->fetch();

        if($idCart === false){
            $stmt = $this->_pdo->prepare(
                "INSERT INTO command( id_client, paid) 
                VALUES (:id_client, 0)"
            );

            $stmt->bindValue(':id_client', $clientId, PDO::PARAM_INT);

            try {
                $stmt->execute();
            } catch (Exception $e) {
                $this->_pdo->rollBack();
                throw $e;
            }
            $stmt = $this->_pdo->prepare(
                "SELECT id FROM command
                WHERE id_client = :id_client
                AND paid = 0"
            );
            $stmt->bindValue(':id_client', $clientId, PDO::PARAM_INT);
            $stmt->execute();
            $idCart= $stmt->fetch();
        }

        return $idCart;  
    }
}