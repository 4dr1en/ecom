<?php

$sql = "
    SELECT *
    FROM user
";

$stmt = $pdo->prepare($sql);

$stmt->execute();

$stmt->fetchAll();

try {
    $stmt->execute();
    return $stmt->fetch();
} catch(Execption $e) {
    $pdo->rollBack();
    throw $e;
}

include '../view/home_view.php';
