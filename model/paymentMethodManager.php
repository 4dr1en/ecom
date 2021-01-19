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
            WHERE id_client = :userId 
            AND method = 'creditCard'
            AND value IS NOT NULL"
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
            WHERE id_client = :userId 
            AND method = 'paypal'
            AND value IS NOT NULL"
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
            "SELECT count(*) as nb FROM payment_method
            WHERE value = :string AND value IS NOT NULL"
        );

        $stmt->bindValue(':string', $string);
    
        try {
            $stmt->execute();
            $r= (int)$stmt->fetch()['nb'];
            return $r;
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function removeMyPaymentMethod($id) {
        /* not compatible with integrity constraint
        $stmt = $this->_pdo->prepare(
            "DELETE FROM payment_method
            WHERE id = :id"
        );*/
        $stmt = $this->_pdo->prepare(
            "UPDATE payment_method SET value = NULL
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

    public function getPaymentMethodsByUserId($userId){
        $stmt = $this->_pdo->prepare(
            "SELECT * FROM payment_method
            WHERE id_client = :userId
            AND value IS NOT NULL"
        );

        $stmt->bindValue(':userId', $userId);
    
        try {
            $stmt->execute();
            $resultsQuery= $stmt->fetchAll();
            return $resultsQuery;
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function doesThisClientOwnThisPaymentMethod($idClient, $idPaymentMethod) {
        $stmt = $this->_pdo->prepare(
            "SELECT count(*) as nb FROM payment_method
            WHERE id_client = :idClient
            AND id = :idPaymentMethod
            AND value IS NOT NULL"
        );

        $stmt->bindValue(':idClient', $idClient, PDO::PARAM_INT);
        $stmt->bindValue(':idPaymentMethod', $idPaymentMethod, PDO::PARAM_INT);
    
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