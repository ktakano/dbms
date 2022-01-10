<?php 

print ("Connecting to MySQL...."); 

try { 

$pdo = new PDO('mysql:host=localhost;dbname=dbtest;charset=utf8','takano','takanolab');


} catch (PDOException $e) { 

    exit('DB connection error.'.$e->getMessage()); 

} 

print ("Exit."); 

?> 
