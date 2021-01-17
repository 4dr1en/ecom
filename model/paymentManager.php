<?php

class PaymentManager extends Manager{
    public function setNewPayment($ht, $tva, $idCommand, $idPaymentMethod){
        
        $stmt = $this->_pdo->prepare(
            "INSERT INTO payment ( total_ht, tva, id_command, id_payment_method) 
            VALUES (:ht, :tva, :idCommand, :idPaymentMethod)"
        );

        $stmt->bindValue(':ht', $ht);
        $stmt->bindValue(':tva', $tva);
        $stmt->bindValue(':idCommand', $idCommand, PDO::PARAM_INT);
        $stmt->bindValue(':idPaymentMethod', $idPaymentMethod, PDO::PARAM_INT);
    
        try {
            return $stmt->execute();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function getPaymentByCommand($idCommand){
        
        $stmt = $this->_pdo->prepare("SELECT * FROM payment WHERE id_command = :idCommand");
        $stmt->bindValue(':idCommand', $idCommand, PDO::PARAM_INT);
    
        try {
            $stmt->execute();
            return $stmt->fetch();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }
}