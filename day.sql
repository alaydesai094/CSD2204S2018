MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| alay               |
| day3               |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
7 rows in set (0.00 sec)

MariaDB [(none)]> use day3;
Database changed
MariaDB [day3]> show full tables;
+----------------+------------+
| Tables_in_day3 | Table_type |
+----------------+------------+
| customer       | BASE TABLE |
+----------------+------------+
1 row in set (0.01 sec)

MariaDB [day3]> desc customer;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| cust_id    | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.08 sec)

MariaDB [day3]> insert into customer values('A101','Alay','MAD','north york','M32Z9','23');
Query OK, 1 row affected (0.14 sec)

MariaDB [day3]> insert into customer values('A102','shivam','shiv','scarbrough','M42B7','22');
Query OK, 1 row affected (0.06 sec)

MariaDB [day3]> insert into customer values('A103','suraj','sd','don mills','M32Z9','23');
Query OK, 1 row affected (0.02 sec)

MariaDB [day3]> insert into customer values('A104','vikas','vicky','20 graydon','M32Z7','23');
Query OK, 1 row affected (0.02 sec)

MariaDB [day3]> insert into customer values('A105','jimmy','jim','vapi','1452502','22');
Query OK, 1 row affected (0.03 sec)

MariaDB [day3]> insert into customer values('A106','ashely','ash','wdc','321200','34'),('A107','bob marley','bm','toronto','100100','23');
Query OK, 2 rows affected (0.08 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [day3]> insert into customer values('A108','eston M.','m','toronto','130130','65'),('A109','jack sp','sparrow','new jersey','102301','35'),('A110','tom curse','tom','nyc','12015012,'70');
    '> \c
    '> 
    '> ;;
    '> ;;
    '> ;;;;
    '> insert into customer values('A108','eston M.','m','toronto','130130','65'),('A109','jack sp','sparrow','new jersey','102301','35'),('A110','tom curse','tom','nyc','12015012,'70');;;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '70');
\c

;;
;;
;;;;
insert into customer values('A108','eston M.','m','toronto'' at line 1
ERROR: No query specified

ERROR: No query specified

MariaDB [day3]> insert into customer values('A108','eston M.','m','toronto','130130','65'),('A109','jack sp','sparrow','new jersey','102301','35'),('A110','tom curse','tom','nyc','12015012','70');
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [day3]> select * from customer;
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A106    | ashely     | ash      | wdc        | 321200     |   34 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
| A108    | eston M.   | m        | toronto    | 130130     |   65 |
| A109    | jack sp    | sparrow  | new jersey | 102301     |   35 |
| A110    | tom curse  | tom      | nyc        | 12015012   |   70 |
+---------+------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [day3]> select name,nickname from customer;
+------------+----------+
| name       | nickname |
+------------+----------+
| Alay       | MAD      |
| shivam     | shiv     |
| suraj      | sd       |
| vikas      | vicky    |
| jimmy      | jim      |
| ashely     | ash      |
| bob marley | bm       |
| eston M.   | m        |
| jack sp    | sparrow  |
| tom curse  | tom      |
+------------+----------+
10 rows in set (0.02 sec)

MariaDB [day3]> select name,city from customer;
+------------+------------+
| name       | city       |
+------------+------------+
| Alay       | north york |
| shivam     | scarbrough |
| suraj      | don mills  |
| vikas      | 20 graydon |
| jimmy      | vapi       |
| ashely     | wdc        |
| bob marley | toronto    |
| eston M.   | toronto    |
| jack sp    | new jersey |
| tom curse  | nyc        |
+------------+------------+
10 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where name=ashely;
ERROR 1054 (42S22): Unknown column 'ashely' in 'where clause'
MariaDB [day3]> select * from customer where name='ashely';
+---------+--------+----------+------+------------+------+
| cust_id | name   | nickname | city | postalcode | age  |
+---------+--------+----------+------+------------+------+
| A106    | ashely | ash      | wdc  | 321200     |   34 |
+---------+--------+----------+------+------------+------+
1 row in set (0.03 sec)

MariaDB [day3]> select * from customer where nickname = 'tom';
+---------+-----------+----------+------+------------+------+
| cust_id | name      | nickname | city | postalcode | age  |
+---------+-----------+----------+------+------------+------+
| A110    | tom curse | tom      | nyc  | 12015012   |   70 |
+---------+-----------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [day3]> select city from customer where name = 'eston M.';
+---------+
| city    |
+---------+
| toronto |
+---------+
1 row in set (0.00 sec)

MariaDB [day3]> select name,city from customer where name = 'eston M.';
+----------+---------+
| name     | city    |
+----------+---------+
| eston M. | toronto |
+----------+---------+
1 row in set (0.00 sec)

MariaDB [day3]> select name,city from customer where city = 'toronto';
+------------+---------+
| name       | city    |
+------------+---------+
| bob marley | toronto |
| eston M.   | toronto |
+------------+---------+
2 rows in set (0.00 sec)

MariaDB [day3]> select name,city from customer where city != 'toronto';
+-----------+------------+
| name      | city       |
+-----------+------------+
| Alay      | north york |
| shivam    | scarbrough |
| suraj     | don mills  |
| vikas     | 20 graydon |
| jimmy     | vapi       |
| ashely    | wdc        |
| jack sp   | new jersey |
| tom curse | nyc        |
+-----------+------------+
8 rows in set (0.02 sec)

MariaDB [day3]> select name,city from customer where city <> 'toronto';
+-----------+------------+
| name      | city       |
+-----------+------------+
| Alay      | north york |
| shivam    | scarbrough |
| suraj     | don mills  |
| vikas     | 20 graydon |
| jimmy     | vapi       |
| ashely    | wdc        |
| jack sp   | new jersey |
| tom curse | nyc        |
+-----------+------------+
8 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where age > 50;
+---------+-----------+----------+---------+------------+------+
| cust_id | name      | nickname | city    | postalcode | age  |
+---------+-----------+----------+---------+------------+------+
| A108    | eston M.  | m        | toronto | 130130     |   65 |
| A110    | tom curse | tom      | nyc     | 12015012   |   70 |
+---------+-----------+----------+---------+------------+------+
2 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where age < 50;
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A106    | ashely     | ash      | wdc        | 321200     |   34 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
| A109    | jack sp    | sparrow  | new jersey | 102301     |   35 |
+---------+------------+----------+------------+------------+------+
8 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where age = 23;
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
+---------+------------+----------+------------+------------+------+
4 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where name < 'ashely';
+---------+------+----------+------------+------------+------+
| cust_id | name | nickname | city       | postalcode | age  |
+---------+------+----------+------------+------------+------+
| A101    | Alay | MAD      | north york | M32Z9      |   23 |
+---------+------+----------+------------+------------+------+
1 row in set (0.00 sec)

MariaDB [day3]> select * from customer where name > 'ashely';
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
| A108    | eston M.   | m        | toronto    | 130130     |   65 |
| A109    | jack sp    | sparrow  | new jersey | 102301     |   35 |
| A110    | tom curse  | tom      | nyc        | 12015012   |   70 |
+---------+------------+----------+------------+------------+------+
8 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where name < 'suraj';
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A106    | ashely     | ash      | wdc        | 321200     |   34 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
| A108    | eston M.   | m        | toronto    | 130130     |   65 |
| A109    | jack sp    | sparrow  | new jersey | 102301     |   35 |
+---------+------------+----------+------------+------------+------+
7 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where name < 'bob marley';
+---------+--------+----------+------------+------------+------+
| cust_id | name   | nickname | city       | postalcode | age  |
+---------+--------+----------+------------+------------+------+
| A101    | Alay   | MAD      | north york | M32Z9      |   23 |
| A106    | ashely | ash      | wdc        | 321200     |   34 |
+---------+--------+----------+------------+------------+------+
2 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where name > 'bob marley';
+---------+-----------+----------+------------+------------+------+
| cust_id | name      | nickname | city       | postalcode | age  |
+---------+-----------+----------+------------+------------+------+
| A102    | shivam    | shiv     | scarbrough | M42B7      |   22 |
| A103    | suraj     | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas     | vicky    | 20 graydon | M32Z7      |   23 |
| A105    | jimmy     | jim      | vapi       | 1452502    |   22 |
| A108    | eston M.  | m        | toronto    | 130130     |   65 |
| A109    | jack sp   | sparrow  | new jersey | 102301     |   35 |
| A110    | tom curse | tom      | nyc        | 12015012   |   70 |
+---------+-----------+----------+------------+------------+------+
7 rows in set (0.00 sec)

MariaDB [day3]> select name,city from customer where name ='ashely' or city = 'toronto';
+------------+---------+
| name       | city    |
+------------+---------+
| ashely     | wdc     |
| bob marley | toronto |
| eston M.   | toronto |
+------------+---------+
3 rows in set (0.00 sec)

MariaDB [day3]> select name,city from customer where name ='ashely' || city = 'toronto';
+------------+---------+
| name       | city    |
+------------+---------+
| ashely     | wdc     |
| bob marley | toronto |
| eston M.   | toronto |
+------------+---------+
3 rows in set (0.00 sec)

MariaDB [day3]> select name,city from customer where city = 'toronto' and age > '50';
+----------+---------+
| name     | city    |
+----------+---------+
| eston M. | toronto |
+----------+---------+
1 row in set (0.03 sec)

MariaDB [day3]> select name,city,age from customer where city = 'toronto' and age > '50';
+----------+---------+------+
| name     | city    | age  |
+----------+---------+------+
| eston M. | toronto |   65 |
+----------+---------+------+
1 row in set (0.00 sec)

MariaDB [day3]> select name,city,age from customer where city = 'toronto' && age > '50';
+----------+---------+------+
| name     | city    | age  |
+----------+---------+------+
| eston M. | toronto |   65 |
+----------+---------+------+
1 row in set (0.00 sec)

MariaDB [day3]> select count(*) "No. of cust in toronto" from customer where city = 'toronto';
+------------------------+
| No. of cust in toronto |
+------------------------+
|                      2 |
+------------------------+
1 row in set (0.03 sec)

MariaDB [day3]> select count(*) "No. of cust in toronto" from customer where age > = '50';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '= '50'' at line 1
MariaDB [day3]> select count(*) "No. of cust in toronto" from customer where age >  '50';
+------------------------+
| No. of cust in toronto |
+------------------------+
|                      2 |
+------------------------+
1 row in set (0.00 sec)

MariaDB [day3]> select count(*) "No. of cust age" from customer where age >  '50';
+-----------------+
| No. of cust age |
+-----------------+
|               2 |
+-----------------+
1 row in set (0.00 sec)

MariaDB [day3]> 
MariaDB [day3]> select count(*) "No. of cust age>50" from customer where age >  '50';
+--------------------+
| No. of cust age>50 |
+--------------------+
|                  2 |
+--------------------+
1 row in set (0.00 sec)

MariaDB [day3]> select count(*) "No. of cust age btwn 30 -70" from customer where age > '30' and age < '70';
+-----------------------------+
| No. of cust age btwn 30 -70 |
+-----------------------------+
|                           3 |
+-----------------------------+
1 row in set (0.00 sec)

MariaDB [day3]> select * from customer where age > '30' and age < '70';
+---------+----------+----------+------------+------------+------+
| cust_id | name     | nickname | city       | postalcode | age  |
+---------+----------+----------+------------+------------+------+
| A106    | ashely   | ash      | wdc        | 321200     |   34 |
| A108    | eston M. | m        | toronto    | 130130     |   65 |
| A109    | jack sp  | sparrow  | new jersey | 102301     |   35 |
+---------+----------+----------+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where age between 30 and 70;
+---------+-----------+----------+------------+------------+------+
| cust_id | name      | nickname | city       | postalcode | age  |
+---------+-----------+----------+------------+------------+------+
| A106    | ashely    | ash      | wdc        | 321200     |   34 |
| A108    | eston M.  | m        | toronto    | 130130     |   65 |
| A109    | jack sp   | sparrow  | new jersey | 102301     |   35 |
| A110    | tom curse | tom      | nyc        | 12015012   |   70 |
+---------+-----------+----------+------------+------------+------+
4 rows in set (0.04 sec)

MariaDB [day3]> select * from customer where age not between 30 and 70;
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
+---------+------------+----------+------------+------------+------+
6 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where not age between 30 and 70;
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
+---------+------------+----------+------------+------------+------+
6 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where max(age);
ERROR 1111 (HY000): Invalid use of group function
MariaDB [day3]> select name from customer where age = max(age);
ERROR 1111 (HY000): Invalid use of group function
MariaDB [day3]> select max(age) from customer;
+----------+
| max(age) |
+----------+
|       70 |
+----------+
1 row in set (0.03 sec)

MariaDB [day3]> select min(age) from customer;
+----------+
| min(age) |
+----------+
|       22 |
+----------+
1 row in set (0.00 sec)

MariaDB [day3]> select avg(age) from customer;
+----------+
| avg(age) |
+----------+
|  34.0000 |
+----------+
1 row in set (0.00 sec)

MariaDB [day3]> select * from customer where name like 'A%';
+---------+--------+----------+------------+------------+------+
| cust_id | name   | nickname | city       | postalcode | age  |
+---------+--------+----------+------------+------------+------+
| A101    | Alay   | MAD      | north york | M32Z9      |   23 |
| A106    | ashely | ash      | wdc        | 321200     |   34 |
+---------+--------+----------+------------+------------+------+
2 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where name like '%A';
Empty set (0.00 sec)

MariaDB [day3]> select * from customer where name like '%Y';
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A106    | ashely     | ash      | wdc        | 321200     |   34 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
+---------+------------+----------+------------+------------+------+
4 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where city like 'nyc' or 'new jersey';
+---------+-----------+----------+------+------------+------+
| cust_id | name      | nickname | city | postalcode | age  |
+---------+-----------+----------+------+------------+------+
| A110    | tom curse | tom      | nyc  | 12015012   |   70 |
+---------+-----------+----------+------+------------+------+
1 row in set, 4 warnings (0.00 sec)

MariaDB [day3]> select * from customer where city like 'nyc' or 'toronto';
+---------+-----------+----------+------+------------+------+
| cust_id | name      | nickname | city | postalcode | age  |
+---------+-----------+----------+------+------------+------+
| A110    | tom curse | tom      | nyc  | 12015012   |   70 |
+---------+-----------+----------+------+------------+------+
1 row in set, 4 warnings (0.00 sec)

MariaDB [day3]> select * from customer where city like 'nyc' And 'toronto';
Empty set, 4 warnings (0.00 sec)

MariaDB [day3]> select * from customer where city like 'nyc' && 'toronto';
Empty set, 4 warnings (0.00 sec)

MariaDB [day3]> select * from customer name like '__n%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'like '__n%'' at line 1
MariaDB [day3]> select * from customer where name like '__n%';
Empty set (0.00 sec)

MariaDB [day3]> select * from customer where name like '__m%';
+---------+-----------+----------+------+------------+------+
| cust_id | name      | nickname | city | postalcode | age  |
+---------+-----------+----------+------+------------+------+
| A105    | jimmy     | jim      | vapi | 1452502    |   22 |
| A110    | tom curse | tom      | nyc  | 12015012   |   70 |
+---------+-----------+----------+------+------------+------+
2 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where name like '__m_y%';
+---------+-------+----------+------+------------+------+
| cust_id | name  | nickname | city | postalcode | age  |
+---------+-------+----------+------+------------+------+
| A105    | jimmy | jim      | vapi | 1452502    |   22 |
+---------+-------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [day3]> select * from customer limit 4;
+---------+--------+----------+------------+------------+------+
| cust_id | name   | nickname | city       | postalcode | age  |
+---------+--------+----------+------------+------------+------+
| A101    | Alay   | MAD      | north york | M32Z9      |   23 |
| A102    | shivam | shiv     | scarbrough | M42B7      |   22 |
| A103    | suraj  | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas  | vicky    | 20 graydon | M32Z7      |   23 |
+---------+--------+----------+------------+------------+------+
4 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where age in (20,25,65,72);
+---------+----------+----------+---------+------------+------+
| cust_id | name     | nickname | city    | postalcode | age  |
+---------+----------+----------+---------+------------+------+
| A108    | eston M. | m        | toronto | 130130     |   65 |
+---------+----------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [day3]> select * from customer where age not in (20,25,65,72);
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A106    | ashely     | ash      | wdc        | 321200     |   34 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
| A109    | jack sp    | sparrow  | new jersey | 102301     |   35 |
| A110    | tom curse  | tom      | nyc        | 12015012   |   70 |
+---------+------------+----------+------------+------------+------+
9 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where city not in ('toronto','vapi','nyc');
+---------+---------+----------+------------+------------+------+
| cust_id | name    | nickname | city       | postalcode | age  |
+---------+---------+----------+------------+------------+------+
| A101    | Alay    | MAD      | north york | M32Z9      |   23 |
| A102    | shivam  | shiv     | scarbrough | M42B7      |   22 |
| A103    | suraj   | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas   | vicky    | 20 graydon | M32Z7      |   23 |
| A106    | ashely  | ash      | wdc        | 321200     |   34 |
| A109    | jack sp | sparrow  | new jersey | 102301     |   35 |
+---------+---------+----------+------------+------------+------+
6 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where city in ('toronto','vapi','nyc');
+---------+------------+----------+---------+------------+------+
| cust_id | name       | nickname | city    | postalcode | age  |
+---------+------------+----------+---------+------------+------+
| A105    | jimmy      | jim      | vapi    | 1452502    |   22 |
| A107    | bob marley | bm       | toronto | 100100     |   23 |
| A108    | eston M.   | m        | toronto | 130130     |   65 |
| A110    | tom curse  | tom      | nyc     | 12015012   |   70 |
+---------+------------+----------+---------+------------+------+
4 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where city like ('t%','vapi','nyc');
ERROR 1241 (21000): Operand should contain 1 column(s)
MariaDB [day3]> select distinct(city) as 'unique cities' from customers;
ERROR 1146 (42S02): Table 'day3.customers' doesn't exist
MariaDB [day3]> select distinct(city) as 'unique cities' from customer;
+---------------+
| unique cities |
+---------------+
| north york    |
| scarbrough    |
| don mills     |
| 20 graydon    |
| vapi          |
| wdc           |
| toronto       |
| new jersey    |
| nyc           |
+---------------+
9 rows in set (0.02 sec)

MariaDB [day3]> select count(distinct(city)) as 'unique cities' from customer;
+---------------+
| unique cities |
+---------------+
|             9 |
+---------------+
1 row in set (0.00 sec)

MariaDB [day3]> select * from customer order by name desc;
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A110    | tom curse  | tom      | nyc        | 12015012   |   70 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A109    | jack sp    | sparrow  | new jersey | 102301     |   35 |
| A108    | eston M.   | m        | toronto    | 130130     |   65 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
| A106    | ashely     | ash      | wdc        | 321200     |   34 |
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
+---------+------------+----------+------------+------------+------+
10 rows in set (0.03 sec)

MariaDB [day3]> select * from customer order by age aesc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'aesc' at line 1
MariaDB [day3]> select * from customer order by age asce;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'asce' at line 1
MariaDB [day3]> select * from customer order by age asc;
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
| A106    | ashely     | ash      | wdc        | 321200     |   34 |
| A109    | jack sp    | sparrow  | new jersey | 102301     |   35 |
| A108    | eston M.   | m        | toronto    | 130130     |   65 |
| A110    | tom curse  | tom      | nyc        | 12015012   |   70 |
+---------+------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [day3]> select * from customer order by age desc;
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A110    | tom curse  | tom      | nyc        | 12015012   |   70 |
| A108    | eston M.   | m        | toronto    | 130130     |   65 |
| A109    | jack sp    | sparrow  | new jersey | 102301     |   35 |
| A106    | ashely     | ash      | wdc        | 321200     |   34 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
+---------+------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [day3]> select * from customer order by age desc limit 1;
+---------+-----------+----------+------+------------+------+
| cust_id | name      | nickname | city | postalcode | age  |
+---------+-----------+----------+------+------------+------+
| A110    | tom curse | tom      | nyc  | 12015012   |   70 |
+---------+-----------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [day3]> select * from customer order by age desc limit 2;
+---------+-----------+----------+---------+------------+------+
| cust_id | name      | nickname | city    | postalcode | age  |
+---------+-----------+----------+---------+------------+------+
| A110    | tom curse | tom      | nyc     | 12015012   |   70 |
| A108    | eston M.  | m        | toronto | 130130     |   65 |
+---------+-----------+----------+---------+------------+------+
2 rows in set (0.00 sec)

MariaDB [day3]> select * from customer where age < 70 order by desc limit 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'desc limit 1' at line 1
MariaDB [day3]> select * from customer where age < 70 order by age desc limit 1;
+---------+----------+----------+---------+------------+------+
| cust_id | name     | nickname | city    | postalcode | age  |
+---------+----------+----------+---------+------------+------+
| A108    | eston M. | m        | toronto | 130130     |   65 |
+---------+----------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [day3]> select max(age) from customer where age => max(age);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '> max(age)' at line 1
MariaDB [day3]> select max(age) from customer where age =< max(age);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '< max(age)' at line 1
MariaDB [day3]> select max(age) from customer where age < max(age);
ERROR 1111 (HY000): Invalid use of group function
MariaDB [day3]> select * from (select * from customer order by age desc limit 2) as t order by age asc limit 1;
+---------+----------+----------+---------+------------+------+
| cust_id | name     | nickname | city    | postalcode | age  |
+---------+----------+----------+---------+------------+------+
| A108    | eston M. | m        | toronto | 130130     |   65 |
+---------+----------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [day3]> select * from (select * from customer order by age asc limit 2) as t order by age desc limit 1;
+---------+--------+----------+------------+------------+------+
| cust_id | name   | nickname | city       | postalcode | age  |
+---------+--------+----------+------------+------------+------+
| A102    | shivam | shiv     | scarbrough | M42B7      |   22 |
+---------+--------+----------+------------+------------+------+
1 row in set (0.00 sec)

MariaDB [day3]> select * from customer;
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A106    | ashely     | ash      | wdc        | 321200     |   34 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
| A108    | eston M.   | m        | toronto    | 130130     |   65 |
| A109    | jack sp    | sparrow  | new jersey | 102301     |   35 |
| A110    | tom curse  | tom      | nyc        | 12015012   |   70 |
+---------+------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [day3]> select * from customer order by asc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'asc' at line 1
MariaDB [day3]> select * from customer age  order by asc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'asc' at line 1
MariaDB [day3]> select * from customer age order by asc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'asc' at line 1
MariaDB [day3]> select * from customer order age  by asc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'age  by asc' at line 1
MariaDB [day3]> select * from customer order by age desc;
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A110    | tom curse  | tom      | nyc        | 12015012   |   70 |
| A108    | eston M.   | m        | toronto    | 130130     |   65 |
| A109    | jack sp    | sparrow  | new jersey | 102301     |   35 |
| A106    | ashely     | ash      | wdc        | 321200     |   34 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
+---------+------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [day3]> select * from customer order by age asc;
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
| A106    | ashely     | ash      | wdc        | 321200     |   34 |
| A109    | jack sp    | sparrow  | new jersey | 102301     |   35 |
| A108    | eston M.   | m        | toronto    | 130130     |   65 |
| A110    | tom curse  | tom      | nyc        | 12015012   |   70 |
+---------+------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [day3]> select * from (select * from customer order by age desc limit 2) as t order by age asc limit 1;
+---------+----------+----------+---------+------------+------+
| cust_id | name     | nickname | city    | postalcode | age  |
+---------+----------+----------+---------+------------+------+
| A108    | eston M. | m        | toronto | 130130     |   65 |
+---------+----------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [day3]>  insert into customer values('A105','jimmy','jim','vapi','1452502','22');
ERROR 1062 (23000): Duplicate entry 'A105' for key 'PRIMARY'
MariaDB [day3]>  insert into customer values('A111','sammy','sam','nyc','145414','70');
Query OK, 1 row affected (0.03 sec)

MariaDB [day3]> select * from customer order by age asc;
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
| A106    | ashely     | ash      | wdc        | 321200     |   34 |
| A109    | jack sp    | sparrow  | new jersey | 102301     |   35 |
| A108    | eston M.   | m        | toronto    | 130130     |   65 |
| A110    | tom curse  | tom      | nyc        | 12015012   |   70 |
| A111    | sammy      | sam      | nyc        | 145414     |   70 |
+---------+------------+----------+------------+------------+------+
11 rows in set (0.00 sec)

MariaDB [day3]> select * from (select * from customer order by age desc limit 2) as t order by age asc limit 1;
+---------+-------+----------+------+------------+------+
| cust_id | name  | nickname | city | postalcode | age  |
+---------+-------+----------+------+------------+------+
| A111    | sammy | sam      | nyc  | 145414     |   70 |
+---------+-------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [day3]> select * from customer order by age desc;
+---------+------------+----------+------------+------------+------+
| cust_id | name       | nickname | city       | postalcode | age  |
+---------+------------+----------+------------+------------+------+
| A111    | sammy      | sam      | nyc        | 145414     |   70 |
| A110    | tom curse  | tom      | nyc        | 12015012   |   70 |
| A108    | eston M.   | m        | toronto    | 130130     |   65 |
| A109    | jack sp    | sparrow  | new jersey | 102301     |   35 |
| A106    | ashely     | ash      | wdc        | 321200     |   34 |
| A107    | bob marley | bm       | toronto    | 100100     |   23 |
| A104    | vikas      | vicky    | 20 graydon | M32Z7      |   23 |
| A103    | suraj      | sd       | don mills  | M32Z9      |   23 |
| A101    | Alay       | MAD      | north york | M32Z9      |   23 |
| A105    | jimmy      | jim      | vapi       | 1452502    |   22 |
| A102    | shivam     | shiv     | scarbrough | M42B7      |   22 |
+---------+------------+----------+------------+------------+------+
11 rows in set (0.00 sec)

MariaDB [day3]> select * from (select * from customer order by age asc limit 2) as t order by age desc limit 2;
+---------+--------+----------+------------+------------+------+
| cust_id | name   | nickname | city       | postalcode | age  |
+---------+--------+----------+------------+------------+------+
| A102    | shivam | shiv     | scarbrough | M42B7      |   22 |
| A105    | jimmy  | jim      | vapi       | 1452502    |   22 |
+---------+--------+----------+------------+------------+------+
2 rows in set (0.00 sec)

MariaDB [day3]> select * from (select * from customer order by age desc limit 2) as t order by age asc limit 2;
+---------+-----------+----------+------+------------+------+
| cust_id | name      | nickname | city | postalcode | age  |
+---------+-----------+----------+------+------------+------+
| A111    | sammy     | sam      | nyc  | 145414     |   70 |
| A110    | tom curse | tom      | nyc  | 12015012   |   70 |
+---------+-----------+----------+------+------------+------+
2 rows in set (0.00 sec)

MariaDB [day3]> select * from (select * from customer order by age desc limit 3) as t order by age asc limit 1;
+---------+----------+----------+---------+------------+------+
| cust_id | name     | nickname | city    | postalcode | age  |
+---------+----------+----------+---------+------------+------+
| A108    | eston M. | m        | toronto | 130130     |   65 |
+---------+----------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [day3]> select * from (select * from customer order by age desc limit 2) as t order by age asc limit 1;
+---------+-------+----------+------+------------+------+
| cust_id | name  | nickname | city | postalcode | age  |
+---------+-------+----------+------+------------+------+
| A111    | sammy | sam      | nyc  | 145414     |   70 |
+---------+-------+----------+------+------------+------+
1 row in set (0.00 sec)

