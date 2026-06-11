/*	
Task: Let's consider a scenario where you want to retrieve information about students

from a database table named student and display the results in ascending order based on their last names.

Student table contain column (stud_id,FirstName,LastName,Age,Phoneno,Address) add 5 records in tables.

Hint: Use orderBy clause in a ascending Order
*/

mysql> show databases;
+-------------------------+
| Database                |
+-------------------------+
| Bank                    |
| BankAccount             |
| e_commerce              |
| information_schema      |
| interview_mate          |
| mysql                   |
| performance_schema      |
| StudentManagementSystem |
| sys                     |
+-------------------------+
9 rows in set (0.03 sec)

mysql> create database studentinfo;
Query OK, 1 row affected (0.02 sec)

mysql> use studentinfo;
Database changed

mysql> create table student(stud_id int primary key not null, FirstName varchar(50) not null, LastName varchar(50) not null, Age int not null, phone_no int(10) not null, Adders varchar(100) not null);
Query OK, 0 rows affected, 1 warning (0.03 sec)

mysql> desc student;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| stud_id   | int          | NO   | PRI | NULL    |       |
| FirstName | varchar(50)  | NO   |     | NULL    |       |
| LastName  | varchar(50)  | NO   |     | NULL    |       |
| Age       | int          | NO   |     | NULL    |       |
| phone_no  | int          | NO   |     | NULL    |       |
| Adders    | varchar(100) | NO   |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> insert into student values(101,'Harisai','Cheripelli',21,88620464,'Phenegoan Bhiwandi'),(102,'Gautam','Vanam',22,8856479,'Kamatghar  Bhiwandi'),(103,'Anupkaumar','Pal',20,997654,'Ramnagar Thane'),(104,'Ravi','Yadav',22,878653,'Tilak nagar Thane'),(105,'Ram','jain',24,9876653,'shree nagar Kalyan');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from student;
+---------+------------+------------+-----+----------+---------------------+
| stud_id | FirstName  | LastName   | Age | phone_no | Adders              |
+---------+------------+------------+-----+----------+---------------------+
|     101 | Harisai    | Cheripelli |  21 | 88620464 | Phenegoan Bhiwandi  |
|     102 | Gautam     | Vanam      |  22 |  8856479 | Kamatghar  Bhiwandi |
|     103 | Anupkaumar | Pal        |  20 |   997654 | Ramnagar Thane      |
|     104 | Ravi       | Yadav      |  22 |   878653 | Tilak nagar Thane   |
|     105 | Ram        | jain       |  24 |  9876653 | shree nagar Kalyan  |
+---------+------------+------------+-----+----------+---------------------+
5 rows in set (0.00 sec)

mysql> select * from student order by LastName;
+---------+------------+------------+-----+----------+---------------------+
| stud_id | FirstName  | LastName   | Age | phone_no | Adders              |
+---------+------------+------------+-----+----------+---------------------+
|     101 | Harisai    | Cheripelli |  21 | 88620464 | Phenegoan Bhiwandi  |
|     105 | Ram        | jain       |  24 |  9876653 | shree nagar Kalyan  |
|     103 | Anupkaumar | Pal        |  20 |   997654 | Ramnagar Thane      |
|     102 | Gautam     | Vanam      |  22 |  8856479 | Kamatghar  Bhiwandi |
|     104 | Ravi       | Yadav      |  22 |   878653 | Tilak nagar Thane   |
+---------+------------+------------+-----+----------+---------------------+
5 rows in set (0.00 sec)

