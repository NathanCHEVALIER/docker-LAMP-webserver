<?php

echo '<h2>Hello World !</h2>';

try {
    $bdd = new PDO('mysql:host=db;port=3306;dbname='.$_ENV['MYSQL_DB'].';charset=utf8', $_ENV['MYSQL_USER'], $_ENV['MYSQL_PASSWD']);
    $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch (Exception $e) {
    echo 'DB Error: '.$e->getMessage();
    exit();
}

$req = $bdd->prepare("SELECT * FROM `test` LIMIT 1");
$req->execute();
if ($req->rowCount() === 1)
    echo ($req->fetch())['content'];

?>