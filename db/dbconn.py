import mysql.connector

print ("Connecting to MySQL....");

try:
  cnx = mysql.connector.connect(user='takano', password='',
                              host='localhost',
                              database='dbtest')
except mysql.connector.Error as err:
  print("DB connection error {}".format(err) )

print("Exit.")

cnx.close()
