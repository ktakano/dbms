import mysql.connector

text_header = '''Content-type: text/html; charset=UTF-8

<html>
 <head><title></title><meta charset="UTF8"></head>
 <body>
  <h1>学生データ</h1>
  <hr>
'''

text_footer = '''
 </body>
</html>
'''

print (text_header);

try:
  cnx = mysql.connector.connect(user='takano', password='',
                              host='localhost',
                              database='dbtest')
except mysql.connector.Error as err:
  print("DB connection error {}".format(err) )

cur = cnx.cursor(dictionary=True)

cur.execute("SELECT id, name, ename FROM student")

for row in cur:
    print(row["id"], row["name"], row["ename"])
    print ("<br>")

cur.close()

cnx.close()

print (text_footer)
