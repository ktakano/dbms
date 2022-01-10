<?php
print ("Connecting to MySQL....");
try {
  $db = new PDO ('mysql:host=localhost; dbname=dbtest; charset=utf8', 'takano', 'takanolab');
} catch (PDOException $e) {
    exit('DB connection error.'.$e->getMessage());
}

$query = "select * from student";

foreach ($db->query($query) as $row) {
     printf("%s, %s, %s", 
       $row['id'], $row['name'], $row['ename']);
     print("<br>");
 }

$db = null;
print ("Exit.");
?>
