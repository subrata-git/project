<?php

$dsn = 'mysql:host='.gethostbyname('mysql');
$usr = 'root';
$pwd = 'crossover';

try {
    $dbh = new PDO($dsn, $usr, $pwd);
} catch (PDOException $e) {
    die('Connection failed: ' . $e->getMessage());
}

echo 'Connection to MYSQL container made successfully!';

