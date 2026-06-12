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
| studentinfo             |
| StudentManagementSystem |
| sys                     |
+-------------------------+
10 rows in set (0.05 sec)

mysql> use e_commerce;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+----------------------+
| Tables_in_e_commerce |
+----------------------+
| customer             |
| employee_details     |
| orders               |
| product              |
+----------------------+
4 rows in set (0.00 sec)

mysql> select * from employee_details;
+-------------+--------------------+-----------------+
| employee_id | employee_name      | employee_salary |
+-------------+--------------------+-----------------+
|           1 | Gautam vanam       |           25000 |
|           2 | Anup pal           |           30000 |
|           3 | Manikant           |           35000 |
|           4 | Laya G             |           40000 |
|           5 | Harisai Cheripelli |           50000 |
+-------------+--------------------+-----------------+
5 rows in set (0.00 sec)

mysql> alter table employee_details rename employee;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from employee;
+-------------+--------------------+-----------------+
| employee_id | employee_name      | employee_salary |
+-------------+--------------------+-----------------+
|           1 | Gautam vanam       |           25000 |
|           2 | Anup pal           |           30000 |
|           3 | Manikant           |           35000 |
|           4 | Laya G             |           40000 |
|           5 | Harisai Cheripelli |           50000 |
+-------------+--------------------+-----------------+
5 rows in set (0.00 sec)

mysql> select * from employee order by employee_Salary desc;
+-------------+--------------------+-----------------+
| employee_id | employee_name      | employee_salary |
+-------------+--------------------+-----------------+
|           5 | Harisai Cheripelli |           50000 |
|           4 | Laya G             |           40000 |
|           3 | Manikant           |           35000 |
|           2 | Anup pal           |           30000 |
|           1 | Gautam vanam       |           25000 |
+-------------+--------------------+-----------------+
5 rows in set (0.00 sec)

mysql> select * from employee order by employee_Salary ;
+-------------+--------------------+-----------------+
| employee_id | employee_name      | employee_salary |
+-------------+--------------------+-----------------+
|           1 | Gautam vanam       |           25000 |
|           2 | Anup pal           |           30000 |
|           3 | Manikant           |           35000 |
|           4 | Laya G             |           40000 |
|           5 | Harisai Cheripelli |           50000 |
+-------------+--------------------+-----------------+
5 rows in set (0.01 sec)

mysql> select * from orders;
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
| order_id | customer_id | product_id | quantity | total_price | payment_mode | order_date | order_status |
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
| o01      | c01         | p01        |        3 |    25998.00 | online       | 2026-06-06 | delivered    |
| o02      | c02         | p02        |        1 |    60000.00 | online       | 2026-06-07 | delivered    |
| o03      | c03         | p03        |        5 |     5000.00 | online       | 2026-06-26 | ordered      |
| o04      | c04         | p04        |        4 |    40000.00 | offline      | 2026-06-05 | delivered    |
| o05      | c05         | p05        |        2 |    60000.00 | online       | 2026-06-06 | ordered      |
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
5 rows in set (0.00 sec)

mysql> create table orders_details(order_id int primary key, department varchar(50) not null, amount double not null);
Query OK, 0 rows affected (0.02 sec)

mysql> insert into orders_details values(1,'sales',1000),(2,'sales',1500),(3,'HR',800);
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from orders_details;
+----------+------------+--------+
| order_id | department | amount |
+----------+------------+--------+
|        1 | sales      |   1000 |
|        2 | sales      |   1500 |
|        3 | HR         |    800 |
+----------+------------+--------+
3 rows in set (0.00 sec)

mysql> select department, sum(amount) as total_amount from orders_DETAILS  group by department;
+------------+--------------+
| department | total_amount |
+------------+--------------+
| sales      |         2500 |
| HR         |          800 |
+------------+--------------+
2 rows in set (0.03 sec)

mysql> select department, avg(amount) as total_avg from orders_details  group by department;
+------------+-----------+
| department | total_avg |
+------------+-----------+
| sales      |      1250 |
| HR         |       800 |
+------------+-----------+
2 rows in set (0.01 sec)

mysql> select department, sum(amount) as total_amount from orders_details group by department having sum(amount) > 1000;
+------------+--------------+
| department | total_amount |
+------------+--------------+
| sales      |         2500 |
+------------+--------------+
1 row in set (0.01 sec)

mysql> select * from employee;
+-------------+--------------------+-----------------+
| employee_id | employee_name      | employee_salary |
+-------------+--------------------+-----------------+
|           1 | Gautam vanam       |           25000 |
|           2 | Anup pal           |           30000 |
|           3 | Manikant           |           35000 |
|           4 | Laya G             |           40000 |
|           5 | Harisai Cheripelli |           50000 |
+-------------+--------------------+-----------------+
5 rows in set (0.00 sec)

mysql> create table employee_details(employeeID int not null,name varchar(50) not null,department varchar(60) not null,salary double not null);
Query OK, 0 rows affected (0.04 sec)

mysql> insert into employee_details values(01,'devayani ghorpade','HR',5000),(02,'Sakshi Thavre','IT',7000),(03,'Bharti Thande','IT',6000),(04,'neha Chikori','HR',5000),(05,'Pillu Yadav','Finance',4500);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from employee_details;
+------------+-------------------+------------+--------+
| employeeID | name              | department | salary |
+------------+-------------------+------------+--------+
|          1 | devayani ghorpade | HR         |   5000 |
|          2 | Sakshi Thavre     | IT         |   7000 |
|          3 | Bharti Thande     | IT         |   6000 |
|          4 | neha Chikori      | HR         |   5000 |
|          5 | Pillu Yadav       | Finance    |   4500 |
+------------+-------------------+------------+--------+
5 rows in set (0.00 sec)

mysql> select department, count(*) as total_employee from employee_details group by department;
+------------+----------------+
| department | total_employee |
+------------+----------------+
| HR         |              2 |
| IT         |              2 |
| Finance    |              1 |
+------------+----------------+
3 rows in set (0.00 sec)

mysql> select department, sum(salary) as total_salary from employee_details group by department;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| HR         |        10000 |
| IT         |        13000 |
| Finance    |         4500 |
+------------+--------------+
3 rows in set (0.00 sec)

mysql> select department, avg(salary) as total_avg from employee_details group by department;
+------------+-----------+
| department | total_avg |
+------------+-----------+
| HR         |      5000 |
| IT         |      6500 |
| Finance    |      4500 |
+------------+-----------+
3 rows in set (0.01 sec)

mysql> select department, salary, count(*) from employee_details group by department,salary;
+------------+--------+----------+
| department | salary | count(*) |
+------------+--------+----------+
| HR         |   5000 |        2 |
| IT         |   7000 |        1 |
| IT         |   6000 |        1 |
| Finance    |   4500 |        1 |
+------------+--------+----------+
4 rows in set (0.00 sec)

mysql>  select * from employee_details;
+------------+-------------------+------------+--------+
| employeeID | name              | department | salary |
+------------+-------------------+------------+--------+
|          1 | devayani ghorpade | HR         |   5000 |
|          2 | Sakshi Thavre     | IT         |   7000 |
|          3 | Bharti Thande     | IT         |   6000 |
|          4 | neha Chikori      | HR         |   5000 |
|          5 | Pillu Yadav       | Finance    |   4500 |
+------------+-------------------+------------+--------+
5 rows in set (0.00 sec)

mysql> select department,count(*) as total from employee_details group by department having count(*) > 1;
+------------+-------+
| department | total |
+------------+-------+
| HR         |     2 |
| IT         |     2 |
+------------+-------+
2 rows in set (0.00 sec)

mysql>  select department,count(*) as total from employee_details group by department having count(*) <= 1;
+------------+-------+
| department | total |
+------------+-------+
| Finance    |     1 |
+------------+-------+
1 row in set (0.00 sec)

mysql> select department,count(*) from employee_details group by department having count(*) > 1 ;
+------------+----------+
| department | count(*) |
+------------+----------+
| HR         |        2 |
| IT         |        2 |
+------------+----------+
2 rows in set (0.00 sec)

