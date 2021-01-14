<?php

function addUser($pdo, $data) {
    $firstname = $data['firstname'];
    $lastname = $data['lastname'];
    $email = $data['email'];

    $sql = "
        INSERT INTO user (first_name, last_name, email)
        VALUES (:firstname, :lastname, :email);
    ";

    $stmt = $pdo->prepare($sql);

    try {
        return $stmt->execute(["firstname" => $firstname, "lastname" => $lastname, "email" => $email]);
    } catch (Exception $e) {
        $pdo->rollBack();
        throw $e;
    }
}

function getUser($pdo, $id) {
    $sql = "
    SELECT *
    FROM user
    WHERE id = $id;
    ";
    
    $stmt = $pdo->prepare($sql);

    try {
        $stmt->execute();
        return $stmt->fetch();
    } catch (Exception $e) {
        $pdo->rollBack();
        throw $e;
    }

}

function rmUser($pdo, $id) {
   $sql = "
   DELETE FROM user
   WHERE id = $id;
   ";

   $stmt = $pdo->prepare($sql);

   try {
    $stmt->execute();
    return $stmt->fetch();
} catch (Exception $e) {
    $pdo->rollBack();
    throw $e;
}

}

