<?php

class PaymentMethodManager extends Manager{

    public function addPaymentMethod(array $data) {
        $stmt = $this->_pdo->prepare("
            INSERT INTO payment_method (method, value, id_client)
            VALUES (:method, :value, :id_client)
        ");
        $stmt->bindValue(':method', $data['method']);
        $stmt->bindValue(':value', $data['value']);
        $stmt->bindValue(':id_client', $data['id_client']);

        try {
            return $stmt->execute();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function getPaymentMethodbyCardbyUserId(){
        $stmt = $this->_pdo->prepare(
            "SELECT * FROM payment_method
            WHERE id_client = :userId AND method = 'creditCard'"
        );

        $stmt->bindValue(':userId', $_SESSION['user']['id']);
    
        try {
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function getPaymentMethodbyPaypalbyUserId() {
        $stmt = $this->_pdo->prepare(
            "SELECT * FROM payment_method
            WHERE id_client = :userId AND method = 'paypal'"
        );

        $stmt->bindValue(':userId', $_SESSION['user']['id']);
    
        try {
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function doesMyPaymentMethodExist($string) {
        $stmt = $this->_pdo->prepare(
            "SELECT * FROM payment_method
            WHERE value = :string"
        );

        $stmt->bindValue(':string', $string);
    
        try {
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function removeMyPaymentMethod($id) {
        
        $stmt = $this->_pdo->prepare(
            "DELETE FROM payment_method
            WHERE id = :id"
        );
    
        $stmt->bindValue(':id', $id);
        try {
            return $stmt->execute();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

}