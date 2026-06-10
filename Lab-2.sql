/* Lab 1: Database Schema: Consider a simple database with one tables: BankAccount 

 Table: ● Columns: account_id (Primary Key), account_holder_name, account_balance

 Task 1: Insert Data Write an SQL INSERT statement to insert data into the BankAccount table

. Task 2: Retrieving Data Write an SQL SELECT statement to retrieve the account_holder_name and account_balance of all account holders from the BankAccount table. 

Task 3: Filtering Data Write an SQL SELECT statement to retrieve the account_holder_name and account_balance where the account_balance is more than 30,000.

 Task 4: Updating Data Write an SQL UPDATE statement to change the account_balance of the account holder whose ID is 101. */


mysql>  show databases;
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
9 rows in set (0.01 sec)

mysql> use BankAccount;
Database changed
mysql> create table BankAccount(account_id varchar(10) primary key not null,account_holder_name varchar(50) not null,account_balance double not null);
Query OK, 0 rows affected (0.01 sec)

mysql> desc BankAccount;
+---------------------+-------------+------+-----+---------+-------+
| Field               | Type        | Null | Key | Default | Extra |
+---------------------+-------------+------+-----+---------+-------+
| account_id          | varchar(10) | NO   | PRI | NULL    |       |
| account_holder_name | varchar(50) | NO   |     | NULL    |       |
| account_balance     | double      | NO   |     | NULL    |       |
+---------------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into bankaccount values('101','harish A',10000),('102','Gautam Vanam',25000),('103','Harisai Cheripelli',60000),('104','Manikant',40000),('105','Anup Pal',50000);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from BankAccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
| 101        | harish A            |           10000 |
| 102        | Gautam Vanam        |           25000 |
| 103        | Harisai Cheripelli  |           60000 |
| 104        | Manikant            |           40000 |
| 105        | Anup Pal            |           50000 |
+------------+---------------------+-----------------+
5 rows in set (0.00 sec)

mysql> select account_holder_name, account_balance from BankAccount;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| harish A            |           10000 |
| Gautam Vanam        |           25000 |
| Harisai Cheripelli  |           60000 |
| Manikant            |           40000 |
| Anup Pal            |           50000 |
+---------------------+-----------------+
5 rows in set (0.00 sec)

mysql> select  account_holder_name, account_balance >= 30000 from bankaccount;
+---------------------+--------------------------+
| account_holder_name | account_balance >= 30000 |
+---------------------+--------------------------+
| harish A            |                        0 |
| Gautam Vanam        |                        0 |
| Harisai Cheripelli  |                        1 |
| Manikant            |                        1 |
| Anup Pal            |                        1 |
+---------------------+--------------------------+
5 rows in set (0.00 sec)

mysql> select  account_holder_name, account_balance from bankaccount where account_balance>=30000;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| Harisai Cheripelli  |           60000 |
| Manikant            |           40000 |
| Anup Pal            |           50000 |
+---------------------+-----------------+
3 rows in set (0.00 sec)

mysql> update bankaccount set account_balance=20000 where account_id='101';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select* from BankAccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
| 101        | harish A            |           20000 |
| 102        | Gautam Vanam        |           25000 |
| 103        | Harisai Cheripelli  |           60000 |
| 104        | Manikant            |           40000 |
| 105        | Anup Pal            |           50000 |
+------------+---------------------+-----------------+
5 rows in set (0.01 sec)
