show databases;
ERROR 2006 (HY000): MySQL server has gone away
No connection. Trying to reconnect...
Connection id:    10
Current database: e_commerce

+-------------------------+
| Database                |
+-------------------------+
| e_commerce              |
| information_schema      |
| interview_mate          |
| mysql                   |
| performance_schema      |
| StudentManagementSystem |
| sys                     |
+-------------------------+
7 rows in set (0.06 sec)

mysql> use e_commerce;
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

mysql> select * from employee_details limit 3;
+-------------+---------------+-----------------+
| employee_id | employee_name | employee_salary |
+-------------+---------------+-----------------+
|           1 | Gautam vanam  |           25000 |
|           2 | Anup pal      |           30000 |
|           3 | Manikant      |           35000 |
+-------------+---------------+-----------------+
3 rows in set (0.00 sec)

mysql> select * from employee_details limit 2;
+-------------+---------------+-----------------+
| employee_id | employee_name | employee_salary |
+-------------+---------------+-----------------+
|           1 | Gautam vanam  |           25000 |
|           2 | Anup pal      |           30000 |
+-------------+---------------+-----------------+
2 rows in set (0.00 sec)

mysql> select * from employee_details order by employee_name;
+-------------+--------------------+-----------------+
| employee_id | employee_name      | employee_salary |
+-------------+--------------------+-----------------+
|           2 | Anup pal           |           30000 |
|           1 | Gautam vanam       |           25000 |
|           5 | Harisai Cheripelli |           50000 |
|           4 | Laya G             |           40000 |
|           3 | Manikant           |           35000 |
+-------------+--------------------+-----------------+
5 rows in set (0.00 sec)

mysql> select * from employee_details order by employee_salary desc;
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

mysql> select * from employee_details order by employee_salary desc limit 2;
+-------------+--------------------+-----------------+
| employee_id | employee_name      | employee_salary |
+-------------+--------------------+-----------------+
|           5 | Harisai Cheripelli |           50000 |
|           4 | Laya G             |           40000 |
+-------------+--------------------+-----------------+
2 rows in set (0.00 sec)
mysql> select * from customer;
+-------------+---------+----------+-------------------+------------+------------+----------+
| customer_id | name    | city     | email             | phone_no   | adderss    | pin_code |
+-------------+---------+----------+-------------------+------------+------------+----------+
| c01         | harisai | bhiwandi | harisai@gmail.com | 8862046214 | kamatghar  |   321405 |
| c02         | gautam  | bhiwandi | gautam@gmail.com  | 876546789  | kamat      |   321409 |
| c03         | hari    | thane    | hari@gmail.com    | 98765433   | ramnagar   |    89076 |
| c04         | karthik | kalyan   | karthik@gmail.com | 987876543  | padmanagar |     9865 |
| c05         | mani    | thane    | mani@gmail.com    | 987656443  | shrinagar  |   897659 |
+-------------+---------+----------+-------------------+------------+------------+----------+
5 rows in set (0.01 sec)

mysql> select distinct city from customer;
+----------+
| city     |
+----------+
| bhiwandi |
| thane    |
| kalyan   |
+----------+
3 rows in set (0.00 sec)

mysql> select * from customer where customer_id between 'c01' and 'c03';
+-------------+---------+----------+-------------------+------------+-----------+----------+
| customer_id | name    | city     | email             | phone_no   | adderss   | pin_code |
+-------------+---------+----------+-------------------+------------+-----------+----------+
| c01         | harisai | bhiwandi | harisai@gmail.com | 8862046214 | kamatghar |   321405 |
| c02         | gautam  | bhiwandi | gautam@gmail.com  | 876546789  | kamat     |   321409 |
| c03         | hari    | thane    | hari@gmail.com    | 98765433   | ramnagar  |    89076 |
+-------------+---------+----------+-------------------+------------+-----------+----------+
3 rows in set (0.01 sec)

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

mysql> select * from orders where order_date between '2026-06-05' and '2026-06-06';
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
| order_id | customer_id | product_id | quantity | total_price | payment_mode | order_date | order_status |
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
| o01      | c01         | p01        |        3 |    25998.00 | online       | 2026-06-06 | delivered    |
| o04      | c04         | p04        |        4 |    40000.00 | offline      | 2026-06-05 | delivered    |
| o05      | c05         | p05        |        2 |    60000.00 | online       | 2026-06-06 | ordered      |
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
3 rows in set (0.01 sec)

mysql> select * from orders where order_date not between '2026-06-05' and '2026-06-06';
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
| order_id | customer_id | product_id | quantity | total_price | payment_mode | order_date | order_status |
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
| o02      | c02         | p02        |        1 |    60000.00 | online       | 2026-06-07 | delivered    |
| o03      | c03         | p03        |        5 |     5000.00 | online       | 2026-06-26 | ordered      |
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
2 rows in set (0.00 sec)

mysql> select * from customer ;
+-------------+---------+----------+-------------------+------------+------------+----------+
| customer_id | name    | city     | email             | phone_no   | adderss    | pin_code |
+-------------+---------+----------+-------------------+------------+------------+----------+
| c01         | harisai | bhiwandi | harisai@gmail.com | 8862046214 | kamatghar  |   321405 |
| c02         | gautam  | bhiwandi | gautam@gmail.com  | 876546789  | kamat      |   321409 |
| c03         | hari    | thane    | hari@gmail.com    | 98765433   | ramnagar   |    89076 |
| c04         | karthik | kalyan   | karthik@gmail.com | 987876543  | padmanagar |     9865 |
| c05         | mani    | thane    | mani@gmail.com    | 987656443  | shrinagar  |   897659 |
+-------------+---------+----------+-------------------+------------+------------+----------+
5 rows in set (0.01 sec)

mysql> select * from customer where customer_id in('c01','c03','c04');
+-------------+---------+----------+-------------------+------------+------------+----------+
| customer_id | name    | city     | email             | phone_no   | adderss    | pin_code |
+-------------+---------+----------+-------------------+------------+------------+----------+
| c01         | harisai | bhiwandi | harisai@gmail.com | 8862046214 | kamatghar  |   321405 |
| c03         | hari    | thane    | hari@gmail.com    | 98765433   | ramnagar   |    89076 |
| c04         | karthik | kalyan   | karthik@gmail.com | 987876543  | padmanagar |     9865 |
+-------------+---------+----------+-------------------+------------+------------+----------+
3 rows in set (0.00 sec)

mysql> select * from customer where customer_id not in('c01','c03','c04');
+-------------+--------+----------+------------------+-----------+-----------+----------+
| customer_id | name   | city     | email            | phone_no  | adderss   | pin_code |
+-------------+--------+----------+------------------+-----------+-----------+----------+
| c02         | gautam | bhiwandi | gautam@gmail.com | 876546789 | kamat     |   321409 |
| c05         | mani   | thane    | mani@gmail.com   | 987656443 | shrinagar |   897659 |
+-------------+--------+----------+------------------+-----------+-----------+----------+
2 rows in set (0.01 sec)

mysql> select * from customer where city is null;
Empty set (0.00 sec)

mysql> select * from customer where city is not  null;
+-------------+---------+----------+-------------------+------------+------------+----------+
| customer_id | name    | city     | email             | phone_no   | adderss    | pin_code |
+-------------+---------+----------+-------------------+------------+------------+----------+
| c01         | harisai | bhiwandi | harisai@gmail.com | 8862046214 | kamatghar  |   321405 |
| c02         | gautam  | bhiwandi | gautam@gmail.com  | 876546789  | kamat      |   321409 |
| c03         | hari    | thane    | hari@gmail.com    | 98765433   | ramnagar   |    89076 |
| c04         | karthik | kalyan   | karthik@gmail.com | 987876543  | padmanagar |     9865 |
| c05         | mani    | thane    | mani@gmail.com    | 987656443  | shrinagar  |   897659 |
+-------------+---------+----------+-------------------+------------+------------+----------+
5 rows in set (0.00 sec)

mysql> select * from employee_details order by employee_salary desc limit 2;
+-------------+--------------------+-----------------+
| employee_id | employee_name      | employee_salary |
+-------------+--------------------+-----------------+
|           5 | Harisai Cheripelli |           50000 |
|           4 | Laya G             |           40000 |
+-------------+--------------------+-----------------+
2 rows in set (0.00 sec)

