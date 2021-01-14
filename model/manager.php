<?php

class Manager{
    protected $_pdo;
    public function __construct(){
        $dsn = 'mysql:host=localhost;dbname=ecom;charset=utf8';

        $user = 'root';
        $password = '';
        $option = [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC];
        try{
            $this->_pdo= new PDO($dsn, $user, $password, $option);
        }
        catch (Exception $e){
            die('Erreur : ' . $e->getMessage());
        }
    }
}