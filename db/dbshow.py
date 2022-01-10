import mysql.connector


print ("Connecting to MySQL....");

try:
  cnx = mysql.connector.connect(user='takano', password='takanolab',
                              host='localhost',
                              database='dbtest')
except mysql.connector.Error as err:
  print("DB connection error {}".format(err) )

cur = cnx.cursor(dictionary=True)

cur.execute("SELECT id, name, ename FROM student")

for row in cur:
    print(row["id"], row["name"], row["ename"])

cur.close()

cnx.close()

print("Exit.")
