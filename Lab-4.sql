mysql> show databases;\
+-------------------------+\
| Database                |\
+-------------------------+\
| Bank                    |\
| BankAccount             |\
| e_commerce              |\
| information_schema      |\
| interview_mate          |\
| joins                   |\
| mysql                   |\
| performance_schema      |\
| storeprocedureExp       |\
| studentinfo             |\
| StudentManagementSystem |\
| sys                     |\
+-------------------------+\
12 rows in set (0.05 sec)\
\
mysql> use StudentManagementSystem;\
Database changed\
\
mysql> show tables;\
+-----------------------------------+\
| Tables_in_studentmanagementsystem |\
+-----------------------------------+\
| Feedback                          |\
| student                           |\
+-----------------------------------+\
2 rows in set (0.01 sec)\
\
mysql> create table students(student_id int primary key not null,FirstName varchar(50) not null,LastName varchar(50) not null);\
Query OK, 0 rows affected (0.04 sec)\
\
mysql> create table course(course_id int primary key not null,courseName varchar(100) not null);\
Query OK, 0 rows affected (0.01 sec)\
\
mysql> create table enrollment(enrollment_id int primary key ,student_id int,course_id int,foreign key(student_id)references students(student_id),foreign key(course_id)references course(course_id));\
Query OK, 0 rows affected (0.02 sec)\
\
mysql> desc students;\
+------------+-------------+------+-----+---------+-------+\
| Field      | Type        | Null | Key | Default | Extra |\
+------------+-------------+------+-----+---------+-------+\
| student_id | int         | NO   | PRI | NULL    |       |\
| FirstName  | varchar(50) | NO   |     | NULL    |       |\
| LastName   | varchar(50) | NO   |     | NULL    |       |\
+------------+-------------+------+-----+---------+-------+\
3 rows in set (0.00 sec)\
\
mysql> desc course;\
+------------+--------------+------+-----+---------+-------+\
| Field      | Type         | Null | Key | Default | Extra |\
+------------+--------------+------+-----+---------+-------+\
| course_id  | int          | NO   | PRI | NULL    |       |\
| courseName | varchar(100) | NO   |     | NULL    |       |\
+------------+--------------+------+-----+---------+-------+\
2 rows in set (0.01 sec)\
\
mysql> desc enrollment;\
+---------------+------+------+-----+---------+-------+\
| Field         | Type | Null | Key | Default | Extra |\
+---------------+------+------+-----+---------+-------+\
| enrollment_id | int  | NO   | PRI | NULL    |       |\
| student_id    | int  | YES  | MUL | NULL    |       |\
| course_id     | int  | YES  | MUL | NULL    |       |\
+---------------+------+------+-----+---------+-------+\
3 rows in set (0.01 sec)\
\
mysql> insert into students values(001,'Harisai','Cheripelli'),(002,'Riya','Shukla'),(003,'Gautam','Vanam'),(004,'Anup','Pal');\
Query OK, 4 rows affected (0.01 sec)\
Records: 4  Duplicates: 0  Warnings: 0\
\
mysql> insert into  course values(101,'database management'),(102,'web development'),(103,'data structures'),(104,'Machine Learning');\
Query OK, 4 rows affected (0.06 sec)\
Records: 4  Duplicates: 0  Warnings: 0\
\
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0
mysql> insert into enrollment values(1,1,101),(2,1,102),(3,2,103),(4,3,101);\
Query OK, 4 rows affected (0.01 sec)\
Records: 4  Duplicates: 0  Warnings: 0\
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0
\
mysql> select * from students;\
+------------+-----------+------------+\
| student_id | FirstName | LastName   |\
+------------+-----------+------------+\
|          1 | Harisai   | Cheripelli |\
|          2 | Riya      | Shukla     |\
|          3 | Gautam    | Vanam      |\
|          4 | Anup      | Pal        |\
+------------+-----------+------------+\
4 rows in set (0.01 sec)\
\
mysql> select * from course;\
+-----------+---------------------+\
| course_id | courseName          |\
+-----------+---------------------+\
|       101 | database management |\
|       102 | web development     |\
|       103 | data structures     |\
|       104 | Machine Learning    |\
+-----------+---------------------+\
4 rows in set (0.00 sec)\
\
mysql>  select * from enrollment;\
+---------------+------------+-----------+\
| enrollment_id | student_id | course_id |\
+---------------+------------+-----------+\
|             1 |          1 |       101 |\
|             2 |          1 |       102 |\
|             3 |          2 |       103 |\
|             4 |          3 |       101 |\
+---------------+------------+-----------+\
4 rows in set (0.00 sec)\
\
mysql> select students.student_id,students.FirstName,students.LastName,course.course_id,courseName from enrollment inner join students on enrollment.student_id=students.student_id inner join course on enrollment.course_id=course.course_id;\
+------------+-----------+------------+-----------+---------------------+\
| student_id | FirstName | LastName   | course_id | courseName          |\
+------------+-----------+------------+-----------+---------------------+\
|          1 | Harisai   | Cheripelli |       101 | database management |\
|          1 | Harisai   | Cheripelli |       102 | web development     |\
|          2 | Riya      | Shukla     |       103 | data structures     |\
|          3 | Gautam    | Vanam      |       101 | database management |\
+------------+-----------+------------+-----------+---------------------+\
4 rows in set (0.01 sec)}