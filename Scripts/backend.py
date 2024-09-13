import mysql.connector
mydb = mysql.connector.connect(host="localhost",user="root",password="1290Zero",database="EmployeeDBMS")
#print(mydb)

#To retreive data from database.

c=mydb.cursor()
c.execute("SELECT * FROM Employee")
for r in c:
    print(r)

#To insert data into database.
emid = int(input("Enter Employee ID: "))
fname = input("Enter First Name: ")
lname = input("Enter Last Name: ")
email = input("Enter email id: ")
dob = input("Enter Date of Birth (YYYY-MM-DD): ")
gen = input("Enter Gender: ")
num = input("Enter Mobile Number: ")
jdate = input("Enter Joining Date (YYYY-MM-DD): ")
jid = int(input("Enter Job ID: "))
did = int(input("Enter Department ID: "))
salary = float(input("Enter Salary: "))

c.execute("INSERT INTO Employee VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)", (emid,fname,lname,email,dob,gen,num,jdate,jid,did,salary))
mydb.commit()
print("Employee entry done successfully!!")
