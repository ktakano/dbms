<html>
 <head><title></title><meta charset="Shift_JIS"></head>
 <body>
  <h1>学生データ</h1>
  <hr>
  <?php
  try {
    $db = new PDO ('mysql:host=localhost; dbname=dbtest; charset=utf8', 'takano', '');
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
?>
 </body>
</html>
