MariaDB [day3]> SHOW DATABASEs;
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

MariaDB [day3]> use day3;
Database changed
MariaDB [day3]> create table customer(
    -> cust_id varchar(5) primary key,
    -> name varchar(50),
    -> nickname varchar(10),
    -> city varchar(20),
    -> postalcode varchar(10),
    -> age integer(3));
ERROR 1050 (42S01): Table 'customer' already exists
MariaDB [day3]> SHOW FULL TABLES;
+----------------+------------+
| Tables_in_day3 | Table_type |
+----------------+------------+
| customer       | BASE TABLE |
+----------------+------------+
1 row in set (0.00 sec)

