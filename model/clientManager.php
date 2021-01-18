<?php

class ClientManager extends Manager{

    public function getAllClients() {
        $stmt = $this->_pdo->prepare("SELECT * FROM client");
    
        try {
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function emailExist(string $email){
        $stmt = $this->_pdo->prepare("SELECT count(*) AS nb FROM client WHERE email = :email");
        $stmt->bindValue(':email', $email);

        try {
            $stmt->execute();
            if($stmt->fetch()['nb'] > 0) return true;
            return false;
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function getUserByEmail(string $email){
        $stmt = $this->_pdo->prepare("SELECT * FROM client WHERE email = :email");
        $stmt->bindValue(':email', $email);

        try {
            $stmt->execute();
            return $stmt->fetch();
        }catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function setNewUser($userData){
        $stmt = $this->_pdo->prepare("
            INSERT INTO client (first_name, last_name, email, password, phone) 
            VALUES (:firstname, :lastname, :email, :password, :phone);
        ");
        $stmt->bindValue(':firstname', $userData['firstname']);
        $stmt->bindValue(':lastname', $userData['lastname']);
        $stmt->bindValue(':email', $userData['email']);
        $stmt->bindValue(':password', $userData['password']);
        $stmt->bindValue(':phone', $userData['phone']);

        try {
            return $stmt->execute();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

    public function editFirstname(string $edit) {
        
        $stmt = $this->_pdo->prepare(
           "UPDATE client
            SET first_name = :edit
            WHERE id = :id;
        ");

        $stmt->bindValue(':edit', $edit);
        $stmt->bindValue(':id', $_SESSION['user']['id']);
        try {
            return $stmt->execute();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }
    
    public function editLastName($edit)
    {
            $stmt = $this->_pdo->prepare(
                "UPDATE client
                SET last_name = :edit
                WHERE id = :id;
            ");
            $stmt->bindValue(':edit', $edit);
            $stmt->bindValue(':id', $_SESSION['user']['id']);
            try {
                return $stmt->execute();
            } catch (Exception $e) {
                $this->_pdo->rollBack();
                throw $e;
            }
    }

    public function editEmail($edit)
    {
            $stmt = $this->_pdo->prepare(
                "UPDATE client
                SET email = :edit
                WHERE id = :id;
            ");
            $stmt->bindValue(':edit', $edit);
            $stmt->bindValue(':id', $_SESSION['user']['id']);
            try {
                return $stmt->execute();
            } catch (Exception $e) {
                $this->_pdo->rollBack();
                throw $e;
            }
    }

    public function editPhone($edit)
    {
            $stmt = $this->_pdo->prepare(
                "UPDATE client
                SET phone = :edit
                WHERE id = :id;
            ");
            $stmt->bindValue(':edit', $edit);
            $stmt->bindValue(':id', $_SESSION['user']['id']);
            try {
                return $stmt->execute();
            } catch (Exception $e) {
                $this->_pdo->rollBack();
                throw $e;
            }
    }
}
