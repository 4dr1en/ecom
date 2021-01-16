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
}