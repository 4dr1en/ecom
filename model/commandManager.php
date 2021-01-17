<?php

class CommandManager extends Manager{

    public function getOrdersByUserId($clientId) {
        $stmt = $this->_pdo->prepare(
            "SELECT * FROM command
            WHERE id_client = :id_client
            AND paid = 1"
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

        return $idCart['id'];  
    }

    public function setPaid($idCart) {
        $stmt = $this->_pdo->prepare(
            "UPDATE command SET paid = 1, dateCommand = CURRENT_TIMESTAMP()
            WHERE id= :id_card"
        );

        $stmt->bindValue(':id_card', $idCart);
    
        try {
            return $stmt->execute();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function doesThisUserOwnThisCommand($idClient, $idCommand){
        $stmt = $this->_pdo->prepare(
            "SELECT count(*) as nb FROM command
            WHERE id_client = :idClient
            AND id = :idCommand"
        );

        $stmt->bindValue(':idClient', $idClient, PDO::PARAM_INT);
        $stmt->bindValue(':idCommand', $idCommand, PDO::PARAM_INT);

        try {
            $stmt->execute();
            $r= (int)$stmt->fetch()['nb'];
            return $r;
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }
}