
mysql> SHOW DATABASES;\
\
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
| studentinfo             |\
| StudentManagementSystem |\
| sys                     |\
+-------------------------+\
11 rows in set (0.11 sec)\
\
mysql> CREATE DATABASE storeprocedureExp;\
Query OK, 1 row affected (0.02 sec)\
\
mysql> use storeprocedureExp;\
Database changed\
\
mysql> create table employee (employee_id int primary key not null,name varchar(50) not null, department varchar(50) not null ,salary double not null);\
Query OK, 0 rows affected (0.02 sec)\
\
mysql> desc employee;\
+-------------+-------------+------+-----+---------+-------+\
| Field       | Type        | Null | Key | Default | Extra |\
+-------------+-------------+------+-----+---------+-------+\
| employee_id | int         | NO   | PRI | NULL    |       |\
| name        | varchar(50) | NO   |     | NULL    |       |\
| department  | varchar(50) | NO   |     | NULL    |       |\
| salary      | double      | NO   |     | NULL    |       |\
+-------------+-------------+------+-----+---------+-------+\
4 rows in set (0.01 sec)\
\
mysql> insert into employee values(1,'harisai','IT',30000),(2,'Gautam','Marketting',40000),(3,'Anup','HR',50000),(4,'Laya','IT',20000),(5,'Chitti','HR',40000);\
Query OK, 5 rows affected (0.01 sec)\
Records: 5  Duplicates: 0  Warnings: 0\
\
mysql> select * from employee;\
+-------------+---------+------------+--------+\
| employee_id | name    | department | salary |\
+-------------+---------+------------+--------+\
|           1 | harisai | IT         |  30000 |\
|           2 | Gautam  | Marketting |  40000 |\
|           3 | Anup    | HR         |  50000 |\
|           4 | Laya    | IT         |  20000 |\
|           5 | Chitti  | HR         |  40000 |\
+-------------+---------+------------+--------+\
5 rows in set (0.00 sec)\
\
mysql> delimiter //\
mysql> delimiter //\
mysql> create procedure getEmployeeDetails()\
    -> begin\
    ->  select * from employee;\
    -> end //\
Query OK, 0 rows affected (0.03 sec)\
\
mysql> delimiter ;\
mysql> call getEmployeeDetails;\
+-------------+---------+------------+--------+\
| employee_id | name    | department | salary |\
+-------------+---------+------------+--------+\
|           1 | harisai | IT         |  30000 |\
|           2 | Gautam  | Marketting |  40000 |\
|           3 | Anup    | HR         |  50000 |\
|           4 | Laya    | IT         |  20000 |\
|           5 | Chitti  | HR         |  40000 |\
+-------------+---------+------------+--------+\
5 rows in set (0.01 sec)\
\
Query OK, 0 rows affected (0.01 sec)\
\
mysql> delimiter //\
mysql> create procedure getEmployeebyDepartment(in name varchar(50))\
    -> begin\
    -> select * from employee where department=name;\
    -> end //\
Query OK, 0 rows affected (0.01 sec)\
\
mysql> delimiter ;\
mysql> call getEmployeebyDepartment('HR');\
+-------------+--------+------------+--------+\
| employee_id | name   | department | salary |\
+-------------+--------+------------+--------+\
|           3 | Anup   | HR         |  50000 |\
|           5 | Chitti | HR         |  40000 |\
+-------------+--------+------------+--------+\
2 rows in set (0.00 sec)\
\
Query OK, 0 rows affected (0.00 sec)\
\
mysql> delimiter //\
mysql> create procedure getEmployeedyCount(out total int)\
    -> begin\
    -> select Count(*) into total from employee;\
    -> end //\
Query OK, 0 rows affected (0.01 sec)\
\
mysql> delimiter ;\
mysql> call getEmployeedyCount(@total);\
Query OK, 1 row affected (0.01 sec)\
\
mysql> select @total;\
+--------+\
| @total |\
+--------+\
|      5 |\
+--------+\
1 row in set (0.01 sec)\
\
mysql> select * from employee;\
+-------------+---------+------------+--------+\
| employee_id | name    | department | salary |\
+-------------+---------+------------+--------+\
|           1 | harisai | IT         |  30000 |\
|           2 | Gautam  | Marketting |  40000 |\
|           3 | Anup    | HR         |  50000 |\
|           4 | Laya    | IT         |  20000 |\
|           5 | Chitti  | HR         |  40000 |\
+-------------+---------+------------+--------+\
5 rows in set (0.03 sec)\
\
mysql> desc employee;\
+-------------+-------------+------+-----+---------+-------+\
| Field       | Type        | Null | Key | Default | Extra |\
+-------------+-------------+------+-----+---------+-------+\
| employee_id | int         | NO   | PRI | NULL    |       |\
| name        | varchar(50) | NO   |     | NULL    |       |\
| department  | varchar(50) | NO   |     | NULL    |       |\
| salary      | double      | NO   |     | NULL    |       |\
+-------------+-------------+------+-----+---------+-------+\
4 rows in set (0.03 sec)\
\
mysql> delimiter //\
mysql> create procedure addEmployeeValues(in id int,in name varchar(50),in department varchar(50),in salary double)\
    -> begin\
    -> insert into employee values(id,name,department,salary);\
    -> end //\
Query OK, 0 rows affected (0.02 sec)\
\
mysql> delimiter ;\
mysql> call addEmployeeValues(6,'Deepika','HR',50000);\
Query OK, 1 row affected (0.01 sec)\
\
mysql> select * from employee;\
+-------------+---------+------------+--------+\
| employee_id | name    | department | salary |\
+-------------+---------+------------+--------+\
|           1 | harisai | IT         |  30000 |\
|           2 | Gautam  | Marketting |  40000 |\
|           3 | Anup    | HR         |  50000 |\
|           4 | Laya    | IT         |  20000 |\
|           5 | Chitti  | HR         |  40000 |\
|           6 | Deepika | HR         |  50000 |\
+-------------+---------+------------+--------+\
6 rows in set (0.01 sec)}