mysql> create database joins;
Query OK, 1 row affected (0.05 sec)

mysql> show databases;
+-------------------------+
| Database                |
+-------------------------+
| Bank                    |
| BankAccount             |
| e_commerce              |
| information_schema      |
| interview_mate          |
| joins                   |
| mysql                   |
| performance_schema      |
| studentinfo             |
| StudentManagementSystem |
| sys                     |
+-------------------------+
11 rows in set (0.02 sec)

mysql> use joins;
Database changed
mysql> create table department(department_id int primary key not null, department_name varchar(50) not null);
Query OK, 0 rows affected (0.02 sec)

mysql> desc department;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| department_id   | int         | NO   | PRI | NULL    |       |
| department_name | varchar(50) | NO   |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> insert into department values(1,'HR'),(2,'IT'),(3,'Marketing'),(4,'Finanace');
Query OK, 4 rows affected (0.04 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from department;
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
|             1 | HR              |
|             2 | IT              |
|             3 | Marketing       |
|             4 | Finanace        |
+---------------+-----------------+
4 rows in set (0.01 sec)

mysql> create table employee(employee_id int primary key not null, employee_name varchar(50) not null, department_id int ,foreign key(department_id) references department(department_id));
Query OK, 0 rows affected (0.03 sec)

mysql> desc employee;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| employee_id   | int         | NO   | PRI | NULL    |       |
| employee_name | varchar(50) | NO   |     | NULL    |       |
| department_id | int         | YES  | MUL | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into employee values(1,'Harisai',1),(2,'Gautam',2),(3,'Manikant',null),(4,'Anupkumar',4);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+-------------+---------------+---------------+
| employee_id | employee_name | department_id |
+-------------+---------------+---------------+
|           1 | Harisai       |             1 |
|           2 | Gautam        |             2 |
|           3 | Manikant      |          NULL |
|           4 | Anupkumar     |             4 |
+-------------+---------------+---------------+
4 rows in set (0.00 sec)

mysql> select * from department;
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
|             1 | HR              |
|             2 | IT              |
|             3 | Marketing       |
|             4 | Finanace        |
+---------------+-----------------+
4 rows in set (0.00 sec)

mysql> select employee_name,department_name from employee inner join department on employee.department_id=department.department_id;
+---------------+-----------------+
| employee_name | department_name |
+---------------+-----------------+
| Harisai       | HR              |
| Gautam        | IT              |
| Anupkumar     | Finanace        |
+---------------+-----------------+
3 rows in set (0.01 sec)

mysql> select employee_name,department_name from employee left join department on employee.department_id=department.department_id;
+---------------+-----------------+
| employee_name | department_name |
+---------------+-----------------+
| Harisai       | HR              |
| Gautam        | IT              |
| Manikant      | NULL            |
| Anupkumar     | Finanace        |
+---------------+-----------------+
4 rows in set (0.00 sec)

mysql> select * from employee;
+-------------+---------------+---------------+
| employee_id | employee_name | department_id |
+-------------+---------------+---------------+
|           1 | Harisai       |             1 |
|           2 | Gautam        |             2 |
|           3 | Manikant      |          NULL |
|           4 | Anupkumar     |             4 |
+-------------+---------------+---------------+
4 rows in set (0.00 sec)

mysql> select * from department;
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
|             1 | HR              |
|             2 | IT              |
|             3 | Marketing       |
|             4 | Finanace        |
+---------------+-----------------+
4 rows in set (0.00 sec)

mysql> select employee_name,department_name from employee left join department on employee.department_id=department.department_id;
+---------------+-----------------+
| employee_name | department_name |
+---------------+-----------------+
| Harisai       | HR              |
| Gautam        | IT              |
| Manikant      | NULL            |
| Anupkumar     | Finanace        |
+---------------+-----------------+
4 rows in set (0.00 sec)

mysql> select employee_name,department_name from employee right join department on employee.department_id=department.department_id;
+---------------+-----------------+
| employee_name | department_name |
+---------------+-----------------+
| Harisai       | HR              |
| Gautam        | IT              |
| NULL          | Marketing       |
| Anupkumar     | Finanace        |
+---------------+-----------------+
4 rows in set (0.01 sec)

mysql> select employee_name,department_name from employee cross join department;
+---------------+-----------------+
| employee_name | department_name |
+---------------+-----------------+
| Anupkumar     | HR              |
| Manikant      | HR              |
| Gautam        | HR              |
| Harisai       | HR              |
| Anupkumar     | IT              |
| Manikant      | IT              |
| Gautam        | IT              |
| Harisai       | IT              |
| Anupkumar     | Marketing       |
| Manikant      | Marketing       |
| Gautam        | Marketing       |
| Harisai       | Marketing       |
| Anupkumar     | Finanace        |
| Manikant      | Finanace        |
| Gautam        | Finanace        |
| Harisai       | Finanace        |
+---------------+-----------------+
16 rows in set (0.00 sec)