MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| csd2204s18         |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
6 rows in set (0.00 sec)

MariaDB [(none)]> create database day4;
Query OK, 1 row affected (0.02 sec)

MariaDB [(none)]> create table person(
    -> id integer(3),
    -> lastname varchar(50) not null,
    -> firstname varchar(50) not null,
    -> age integer(3),
    -> constraint pk primary key (id,lastname)
    -> );
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> use day4;
Database changed
MariaDB [day4]> create table person(
    -> id integer(3),
    -> lastname varchar(50) not null,
    -> firstname varchar(50) not null,
    -> age integer(3),
    -> constraint pk primary key (id,lastname)
    -> );
Query OK, 0 rows affected (0.31 sec)

MariaDB [day4]> show full tables;
+----------------+------------+
| Tables_in_day4 | Table_type |
+----------------+------------+
| person         | BASE TABLE |
+----------------+------------+
1 row in set (0.00 sec)

MariaDB [day4]> show index from person;
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| person |          0 | PRIMARY  |            1 | id          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| person |          0 | PRIMARY  |            2 | lastname    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [day4]> create table order(
    -> o_id int(3) not null,
    -> o_no int(3) not null,
    -> personid int(3),
    -> constrant fk foreign key (personid) references persons(id)
    -> );\
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'order(
o_id int(3) not null,
o_no int(3) not null,
personid int(3),
constrant fk' at line 1
MariaDB [day4]> create table order(
    -> o_id int(3) not null,
    -> o_no int(3) not null,
    -> personid int(3),
    -> constraint fk foreign key (personid) references persons(id)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'order(
o_id int(3) not null,
o_no int(3) not null,
personid int(3),
constraint f' at line 1
MariaDB [day4]> create table order(
    -> o_id int(3) not null,
    -> o_no int(3) not null,
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'order(
o_id int(3) not null,
o_no int(3) not null,' at line 1
MariaDB [day4]> create table order(
    -> o_id integer(3) not null,
    -> o_no integer(3) not null,
    -> personid integer(3),
    -> constraint fk foreign key (personid) references persons(id)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'order(
o_id integer(3) not null,
o_no integer(3) not null,
personid integer(3),
' at line 1
MariaDB [day4]> create table order(
    -> orderid integer(3) not null,
    -> ordernumber integer(3) not null,
    -> personid integer(3),
    -> primary key (orderid),
    -> constraint fk foreign key (personid) referenses person(id)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'order(
orderid integer(3) not null,
ordernumber integer(3) not null,
personid in' at line 1
MariaDB [day4]> create table order (
    -> orderid integer(3) not null,
    -> ordernumber integer(3) not null,
    -> personid integer(3),
    -> primary key(orderid),
    -> constraint fk_person foreign key(personid) references person(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'order (
orderid integer(3) not null,
ordernumber integer(3) not null,
personid i' at line 1
MariaDB [day4]> create table order(
    -> orderid integer(3),
    -> ordernumber integer(3),
    -> personid integer(3),
    -> primary key (orderid),
    -> constraint fk foreign key (personid) references persons(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'order(
orderid integer(3),
ordernumber integer(3),
personid integer(3),
primary ' at line 1
MariaDB [(none)]> show full tables;
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> use day4;
Database changed
MariaDB [day4]> show full tables;
+----------------+------------+
| Tables_in_day4 | Table_type |
+----------------+------------+
| person         | BASE TABLE |
+----------------+------------+
1 row in set (0.00 sec)

MariaDB [day4]> create table order(
    -> oid integer(3) not null,
    -> ono integer(3) not null,
    -> personid integer(3),
    -> primary key(oid),
    -> CONSTRAINT FK_PersonOrder FOREIGN KEY (P
    -> ersonID)
    ->  REFERENCES Persons(PersonID)
    -> 
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'order(
oid integer(3) not null,
ono integer(3) not null,
personid integer(3),
pr' at line 1
MariaDB [day4]> create table order(
    -> oid integer(3) not null,
    -> ono integer(3) not null,
    -> personid integer(3),
    -> primary key(oid),
    -> CONSTRAINT FK_PersonOrder FOREIGN KEY (P
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'order(
oid integer(3) not null,
ono integer(3) not null,
personid integer(3),
pr' at line 1
MariaDB [day4]> create table order(
    -> orderid integer(3) not null,
    -> ordernumber interger(3) not null,
    -> personid interger(3),
    -> primary key(orderid),
    -> constarint fk foreign key(personid) references person(id)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'order(
orderid integer(3) not null,
ordernumber interger(3) not null,
personid i' at line 1
MariaDB [(none)]> CREATE TABLE orders (
    ->  orderid integer(3) NOT NULL,
    ->  orderno integer(3) NOT NULL,
    ->  personid integer(3),
    ->  PRIMARY KEY (Orderid),
    ->  CONSTRAINT FK_PersonOrder FOREIGN KEY (personid)
    ->  REFERENCES persons(id));
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> use day4;
Database changed
MariaDB [day4]> CREATE TABLE orders (
    ->  orderid integer(3) NOT NULL,
    ->  orderno integer(3) NOT NULL,
    ->  personid integer(3),
    ->  PRIMARY KEY (Orderid),
    ->  CONSTRAINT FK_PersonOrder FOREIGN KEY (personid)
    ->  REFERENCES persons(id));
ERROR 1005 (HY000): Can't create table `day4`.`orders` (errno: 150 "Foreign key constraint is incorrectly formed")
MariaDB [day4]> CREATE TABLE orders (
    ->  orderid integer(3) NOT NULL,
    ->  orderno integer(3) NOT NULL,
    ->  personid integer(3),
    ->  PRIMARY KEY (Orderid),
    ->  CONSTRAINT FK FOREIGN KEY (personid)
    ->  REFERENCES person(id));
Query OK, 0 rows affected (0.22 sec)

MariaDB [day4]> use csd2204s18
Database changed
MariaDB [csd2204s18]> create table c1 as select * from customer;
Query OK, 9 rows affected (0.31 sec)
Records: 9  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> create table person(
    ->     -> id integer(3),
    ->     -> lastname varchar(50) not null,
    ->     -> firstname varchar(50) not null,
    ->     -> age integer(3),
    ->     -> constraint pk primary key (id,lastname)
    ->     -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '-> id integer(3),
    -> lastname varchar(50) not null,
    -> firstname varchar' at line 2
MariaDB [csd2204s18]> MariaDB [(none)]> create table person(
    ->     id integer(3),
    ->     lastname varchar(50) not null,
    ->     firstname varchar(50) not null,
    ->     age integer(3),
    ->     constraint pk primary key (id,lastname)
    -> 
    -> ;
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> use csd2204s18;
Database changed
MariaDB [csd2204s18]> create table person(
    -> id integer(3),
    -> lastname varchar(50) not null,
    -> firstname varchar(50) not null,
    -> age integer(3),
    -> constraint pk primary key (id,lastname)
    -> );
Query OK, 0 rows affected (0.42 sec)

MariaDB [csd2204s18]> CREATE TABLE orders (
    -> orderid integer(3) NOT NULL,
    -> orderno integer(3) NOT NULL,
    -> personid integer(3),
    -> PRIMARY KEY (Orderid),
    -> CONSTRAINT FK FOREIGN KEY (personid)
    -> REFERENCES person(id)
    -> );
Query OK, 0 rows affected (0.30 sec)

MariaDB [csd2204s18]> show full tables;
+----------------------+------------+
| Tables_in_csd2204s18 | Table_type |
+----------------------+------------+
| c1                   | BASE TABLE |
| customer             | BASE TABLE |
| orders               | BASE TABLE |
| person               | BASE TABLE |
+----------------------+------------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> CREATE TABLE orders (
    -> orderid integer(3) NOT NULL,
    -> orderno integer(3) NOT NULL,
    -> personid integer(3),
    -> PRIMARY KEY (Orderid),
    -> CONSTRAINT FK FOREIGN KEY (personid)
    -> REFERENCES person(id)
    -> );CREATE TABLE orders (
ERROR 1050 (42S01): Table 'orders' already exists
    -> orderid integer(3) NOT NULL,
    -> orderno integer(3) NOT NULL,
    -> personid integer(3),
    -> PRIMARY KEY (Orderid),
    -> CONSTRAINT FK FOREIGN KEY (personid)
    -> REFERENCES person(id)
    -> );CREATE TABLE orders (
ERROR 1050 (42S01): Table 'orders' already exists
    -> orderid integer(3) NOT NULL,
    -> orderno integer(3) NOT NULL,
    -> personid integer(3),
    -> PRIMARY KEY (Orderid),
    -> CONSTRAINT FK FOREIGN KEY (personid)
    -> REFERENCES person(id)
    -> );
ERROR 1050 (42S01): Table 'orders' already exists
MariaDB [csd2204s18]> tee C:\Users\735979\Downloads\alay\day4.sql
MariaDB [csd2204s18]> alter table c2 add column counrty varchar(10);
ERROR 1146 (42S02): Table 'csd2204s18.c2' doesn't exist
MariaDB [csd2204s18]> show full tables;
+----------------------+------------+
| Tables_in_csd2204s18 | Table_type |
+----------------------+------------+
| c1                   | BASE TABLE |
| customer             | BASE TABLE |
| orders               | BASE TABLE |
| person               | BASE TABLE |
+----------------------+------------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> alter table c1 add column counrty varchar(10);
Query OK, 0 rows affected (0.50 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> select * from c1;
+--------+-----------------+----------+----------+------------+------+---------+
| custId | name            | nickname | city     | postalCode | age  | counrty |
+--------+-----------------+----------+----------+------------+------+---------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 | NULL    |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 | NULL    |
| c03    | charlies theron | char     | New York | 120134     |   20 | NULL    |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 | NULL    |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 | NULL    |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 | NULL    |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 | NULL    |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 | NULL    |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 | NULL    |
+--------+-----------------+----------+----------+------------+------+---------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> alter table c1 add column Counrty varchar(10);
ERROR 1060 (42S21): Duplicate column name 'Counrty'
MariaDB [csd2204s18]> alter table c1 add column counrty varchar(10);
ERROR 1060 (42S21): Duplicate column name 'counrty'
MariaDB [csd2204s18]> select * from c1;
+--------+-----------------+----------+----------+------------+------+---------+
| custId | name            | nickname | city     | postalCode | age  | counrty |
+--------+-----------------+----------+----------+------------+------+---------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 | NULL    |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 | NULL    |
| c03    | charlies theron | char     | New York | 120134     |   20 | NULL    |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 | NULL    |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 | NULL    |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 | NULL    |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 | NULL    |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 | NULL    |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 | NULL    |
+--------+-----------------+----------+----------+------------+------+---------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> alter table c1 Modify column Counrty varchar(10);
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> select * from c1;
+--------+-----------------+----------+----------+------------+------+---------+
| custId | name            | nickname | city     | postalCode | age  | Counrty |
+--------+-----------------+----------+----------+------------+------+---------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 | NULL    |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 | NULL    |
| c03    | charlies theron | char     | New York | 120134     |   20 | NULL    |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 | NULL    |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 | NULL    |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 | NULL    |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 | NULL    |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 | NULL    |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 | NULL    |
+--------+-----------------+----------+----------+------------+------+---------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> alter table c1 Modify column counrty varchar(10);
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> alter table c1 change custID customerID varchar(5);
Query OK, 0 rows affected (0.41 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> select * from c1;
+------------+-----------------+----------+----------+------------+------+---------+
| customerID | name            | nickname | city     | postalCode | age  | counrty |
+------------+-----------------+----------+----------+------------+------+---------+
| c01        | ashley          | ash      | wdc      | 321200     |   34 | NULL    |
| c02        | BOB MARLEY      | BOB      | toronto  | 100100     |   23 | NULL    |
| c03        | charlies theron | char     | New York | 120134     |   20 | NULL    |
| c04        | Denial jack     | Dj       | Brazil   | 341020     |   25 | NULL    |
| c05        | Donna newman    | New      | Toronto  | 130120     |   25 | NULL    |
| c06        | Eston M.        | M.       | Toronto  | 201023     |   65 | NULL    |
| c07        | Bobby chako     | Chac     | New york | 320300     |   70 | NULL    |
| c08        | Ashko Charles   | ak       | USA      | 421044     |   72 | NULL    |
| c09        | Tony Special    | Specie   | GTA      | 418921     |   62 | NULL    |
+------------+-----------------+----------+----------+------------+------+---------+
9 rows in set (0.00 sec)

MariaDB [(none)]> use csd2204s18;
Database changed
MariaDB [csd2204s18]> select * from c1;
+------------+-----------------+----------+----------+------------+------+---------+
| customerID | name            | nickname | city     | postalCode | age  | counrty |
+------------+-----------------+----------+----------+------------+------+---------+
| c01        | ashley          | ash      | wdc      | 321200     |   34 | NULL    |
| c02        | BOB MARLEY      | BOB      | toronto  | 100100     |   23 | NULL    |
| c03        | charlies theron | char     | New York | 120134     |   20 | NULL    |
| c04        | Denial jack     | Dj       | Brazil   | 341020     |   25 | NULL    |
| c05        | Donna newman    | New      | Toronto  | 130120     |   25 | NULL    |
| c06        | Eston M.        | M.       | Toronto  | 201023     |   65 | NULL    |
| c07        | Bobby chako     | Chac     | New york | 320300     |   70 | NULL    |
| c08        | Ashko Charles   | ak       | USA      | 421044     |   72 | NULL    |
| c09        | Tony Special    | Specie   | GTA      | 418921     |   62 | NULL    |
+------------+-----------------+----------+----------+------------+------+---------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> alter table drop column country;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'drop column country' at line 1
MariaDB [csd2204s18]> alter table c1 drop column country;
ERROR 1091 (42000): Can't DROP 'country'; check that column/key exists
MariaDB [csd2204s18]> alter table c1 drop column counrty;
Query OK, 0 rows affected (0.41 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> select * from c1;
+------------+-----------------+----------+----------+------------+------+
| customerID | name            | nickname | city     | postalCode | age  |
+------------+-----------------+----------+----------+------------+------+
| c01        | ashley          | ash      | wdc      | 321200     |   34 |
| c02        | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c03        | charlies theron | char     | New York | 120134     |   20 |
| c04        | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c05        | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06        | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c07        | Bobby chako     | Chac     | New york | 320300     |   70 |
| c08        | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c09        | Tony Special    | Specie   | GTA      | 418921     |   62 |
+------------+-----------------+----------+----------+------------+------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> alter table add column extra;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'add column extra' at line 1
MariaDB [csd2204s18]> alter table add column extra varchar(4);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'add column extra varchar(4)' at line 1
MariaDB [csd2204s18]> alter table c1 add column extra varchar(4);
Query OK, 0 rows affected (0.31 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> select * from c1;
+------------+-----------------+----------+----------+------------+------+-------+
| customerID | name            | nickname | city     | postalCode | age  | extra |
+------------+-----------------+----------+----------+------------+------+-------+
| c01        | ashley          | ash      | wdc      | 321200     |   34 | NULL  |
| c02        | BOB MARLEY      | BOB      | toronto  | 100100     |   23 | NULL  |
| c03        | charlies theron | char     | New York | 120134     |   20 | NULL  |
| c04        | Denial jack     | Dj       | Brazil   | 341020     |   25 | NULL  |
| c05        | Donna newman    | New      | Toronto  | 130120     |   25 | NULL  |
| c06        | Eston M.        | M.       | Toronto  | 201023     |   65 | NULL  |
| c07        | Bobby chako     | Chac     | New york | 320300     |   70 | NULL  |
| c08        | Ashko Charles   | ak       | USA      | 421044     |   72 | NULL  |
| c09        | Tony Special    | Specie   | GTA      | 418921     |   62 | NULL  |
+------------+-----------------+----------+----------+------------+------+-------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> update table c1 set 
    -> nickname = 'BOB'Y' where nickname = 'BOB';
    '> 
    '> ;;
    '> \c
    '> ';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'table c1 set 
nickname = 'BOB'Y' where nickname = 'BOB';

;;
\c
'' at line 1
MariaDB [csd2204s18]> update table c1 set 
    -> country ="usa";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'table c1 set 
country ="usa"' at line 1
MariaDB [csd2204s18]> update table c1 set country ='usa';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'table c1 set country ='usa'' at line 1
MariaDB [csd2204s18]> update c1 set country ='usa';
ERROR 1054 (42S22): Unknown column 'country' in 'field list'
MariaDB [csd2204s18]> update c1 set extra ='usa';
Query OK, 9 rows affected (0.03 sec)
Rows matched: 9  Changed: 9  Warnings: 0

MariaDB [csd2204s18]> select * from c1;
+------------+-----------------+----------+----------+------------+------+-------+
| customerID | name            | nickname | city     | postalCode | age  | extra |
+------------+-----------------+----------+----------+------------+------+-------+
| c01        | ashley          | ash      | wdc      | 321200     |   34 | usa   |
| c02        | BOB MARLEY      | BOB      | toronto  | 100100     |   23 | usa   |
| c03        | charlies theron | char     | New York | 120134     |   20 | usa   |
| c04        | Denial jack     | Dj       | Brazil   | 341020     |   25 | usa   |
| c05        | Donna newman    | New      | Toronto  | 130120     |   25 | usa   |
| c06        | Eston M.        | M.       | Toronto  | 201023     |   65 | usa   |
| c07        | Bobby chako     | Chac     | New york | 320300     |   70 | usa   |
| c08        | Ashko Charles   | ak       | USA      | 421044     |   72 | usa   |
| c09        | Tony Special    | Specie   | GTA      | 418921     |   62 | usa   |
+------------+-----------------+----------+----------+------------+------+-------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> alter table c1 modify column country;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [csd2204s18]> update c1 set extra ='canada' where city in ('Toronto','GTA') ;
Query OK, 4 rows affected, 4 warnings (0.06 sec)
Rows matched: 4  Changed: 4  Warnings: 4

MariaDB [csd2204s18]> select * from c1;
+------------+-----------------+----------+----------+------------+------+-------+
| customerID | name            | nickname | city     | postalCode | age  | extra |
+------------+-----------------+----------+----------+------------+------+-------+
| c01        | ashley          | ash      | wdc      | 321200     |   34 | usa   |
| c02        | BOB MARLEY      | BOB      | toronto  | 100100     |   23 | cana  |
| c03        | charlies theron | char     | New York | 120134     |   20 | usa   |
| c04        | Denial jack     | Dj       | Brazil   | 341020     |   25 | usa   |
| c05        | Donna newman    | New      | Toronto  | 130120     |   25 | cana  |
| c06        | Eston M.        | M.       | Toronto  | 201023     |   65 | cana  |
| c07        | Bobby chako     | Chac     | New york | 320300     |   70 | usa   |
| c08        | Ashko Charles   | ak       | USA      | 421044     |   72 | usa   |
| c09        | Tony Special    | Specie   | GTA      | 418921     |   62 | cana  |
+------------+-----------------+----------+----------+------------+------+-------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> update c1 set extra ='SA' where city in ('Brazil') ;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> select * from c1;
+------------+-----------------+----------+----------+------------+------+-------+
| customerID | name            | nickname | city     | postalCode | age  | extra |
+------------+-----------------+----------+----------+------------+------+-------+
| c01        | ashley          | ash      | wdc      | 321200     |   34 | usa   |
| c02        | BOB MARLEY      | BOB      | toronto  | 100100     |   23 | cana  |
| c03        | charlies theron | char     | New York | 120134     |   20 | usa   |
| c04        | Denial jack     | Dj       | Brazil   | 341020     |   25 | SA    |
| c05        | Donna newman    | New      | Toronto  | 130120     |   25 | cana  |
| c06        | Eston M.        | M.       | Toronto  | 201023     |   65 | cana  |
| c07        | Bobby chako     | Chac     | New york | 320300     |   70 | usa   |
| c08        | Ashko Charles   | ak       | USA      | 421044     |   72 | usa   |
| c09        | Tony Special    | Specie   | GTA      | 418921     |   62 | cana  |
+------------+-----------------+----------+----------+------------+------+-------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> CREATE TABLE newTable LIKE
    -> CREATE TABLE newTable LIKE.;;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'CREATE TABLE newTable LIKE.' at line 2
ERROR: No query specified

MariaDB [csd2204s18]> CREATE TABLE c2 as c1; 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'c1' at line 1
MariaDB [csd2204s18]> CREATE TABLE c2 as select * c1; 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'c1' at line 1
MariaDB [csd2204s18]> CREATE TABLE c2 as select * from c1; 
Query OK, 9 rows affected (0.27 sec)
Records: 9  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> select * from c2;
+------------+-----------------+----------+----------+------------+------+-------+
| customerID | name            | nickname | city     | postalCode | age  | extra |
+------------+-----------------+----------+----------+------------+------+-------+
| c01        | ashley          | ash      | wdc      | 321200     |   34 | usa   |
| c02        | BOB MARLEY      | BOB      | toronto  | 100100     |   23 | cana  |
| c03        | charlies theron | char     | New York | 120134     |   20 | usa   |
| c04        | Denial jack     | Dj       | Brazil   | 341020     |   25 | SA    |
| c05        | Donna newman    | New      | Toronto  | 130120     |   25 | cana  |
| c06        | Eston M.        | M.       | Toronto  | 201023     |   65 | cana  |
| c07        | Bobby chako     | Chac     | New york | 320300     |   70 | usa   |
| c08        | Ashko Charles   | ak       | USA      | 421044     |   72 | usa   |
| c09        | Tony Special    | Specie   | GTA      | 418921     |   62 | cana  |
+------------+-----------------+----------+----------+------------+------+-------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> drop table c2;
Query OK, 0 rows affected (0.11 sec)

MariaDB [csd2204s18]> show tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| customer             |
| orders               |
| person               |
+----------------------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from c2;
ERROR 1146 (42S02): Table 'csd2204s18.c2' doesn't exist
MariaDB [csd2204s18]> select * from c1;
+------------+-----------------+----------+----------+------------+------+-------+
| customerID | name            | nickname | city     | postalCode | age  | extra |
+------------+-----------------+----------+----------+------------+------+-------+
| c01        | ashley          | ash      | wdc      | 321200     |   34 | usa   |
| c02        | BOB MARLEY      | BOB      | toronto  | 100100     |   23 | cana  |
| c03        | charlies theron | char     | New York | 120134     |   20 | usa   |
| c04        | Denial jack     | Dj       | Brazil   | 341020     |   25 | SA    |
| c05        | Donna newman    | New      | Toronto  | 130120     |   25 | cana  |
| c06        | Eston M.        | M.       | Toronto  | 201023     |   65 | cana  |
| c07        | Bobby chako     | Chac     | New york | 320300     |   70 | usa   |
| c08        | Ashko Charles   | ak       | USA      | 421044     |   72 | usa   |
| c09        | Tony Special    | Specie   | GTA      | 418921     |   62 | cana  |
+------------+-----------------+----------+----------+------------+------+-------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> alter table c1 add column custno;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [csd2204s18]> alter table c1 add column custno varchar(100);
Query OK, 0 rows affected (2.43 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> update c1 set custno = 1 where age>=50;
Query OK, 4 rows affected (0.05 sec)
Rows matched: 4  Changed: 4  Warnings: 0

MariaDB [csd2204s18]> select * from c1;
+------------+-----------------+----------+----------+------------+------+-------+--------+
| customerID | name            | nickname | city     | postalCode | age  | extra | custno |
+------------+-----------------+----------+----------+------------+------+-------+--------+
| c01        | ashley          | ash      | wdc      | 321200     |   34 | usa   | NULL   |
| c02        | BOB MARLEY      | BOB      | toronto  | 100100     |   23 | cana  | NULL   |
| c03        | charlies theron | char     | New York | 120134     |   20 | usa   | NULL   |
| c04        | Denial jack     | Dj       | Brazil   | 341020     |   25 | SA    | NULL   |
| c05        | Donna newman    | New      | Toronto  | 130120     |   25 | cana  | NULL   |
| c06        | Eston M.        | M.       | Toronto  | 201023     |   65 | cana  | 1      |
| c07        | Bobby chako     | Chac     | New york | 320300     |   70 | usa   | 1      |
| c08        | Ashko Charles   | ak       | USA      | 421044     |   72 | usa   | 1      |
| c09        | Tony Special    | Specie   | GTA      | 418921     |   62 | cana  | 1      |
+------------+-----------------+----------+----------+------------+------+-------+--------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from c1 where custno is not null;;
+------------+---------------+----------+----------+------------+------+-------+--------+
| customerID | name          | nickname | city     | postalCode | age  | extra | custno |
+------------+---------------+----------+----------+------------+------+-------+--------+
| c06        | Eston M.      | M.       | Toronto  | 201023     |   65 | cana  | 1      |
| c07        | Bobby chako   | Chac     | New york | 320300     |   70 | usa   | 1      |
| c08        | Ashko Charles | ak       | USA      | 421044     |   72 | usa   | 1      |
| c09        | Tony Special  | Specie   | GTA      | 418921     |   62 | cana  | 1      |
+------------+---------------+----------+----------+------------+------+-------+--------+
4 rows in set (0.00 sec)

ERROR: No query specified

