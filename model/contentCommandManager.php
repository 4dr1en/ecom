<?php

class ContentCommandManager extends Manager{
    public function getContentByCommandId($commandId){
        $stmt = $this->_pdo->prepare(
            "SELECT * FROM content_command RIGHT JOIN item 
            ON content_command.id_item = item.id
            WHERE content_command.id_command = :commandId"
        );

        $stmt->bindValue(':commandId', $commandId);
    
        try {
            $stmt->execute();
            return $stmt->fetchAll();
        } catch (Exception $e) {
            $this->_pdo->rollBack();
            throw $e;
        }
    }

}