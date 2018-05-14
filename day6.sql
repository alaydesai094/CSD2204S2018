MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| csd2204s18         |
| day4               |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
7 rows in set (0.00 sec)

MariaDB [(none)]> use day4;
Database changed
MariaDB [day4]> show tables;
+----------------+
| Tables_in_day4 |
+----------------+
| orders         |
| person         |
+----------------+
2 rows in set (0.00 sec)

MariaDB [day4]> 
MariaDB [day4]> desc orders;
+----------+--------+------+-----+---------+-------+
| Field    | Type   | Null | Key | Default | Extra |
+----------+--------+------+-----+---------+-------+
| orderid  | int(3) | NO   | PRI | NULL    |       |
| orderno  | int(3) | NO   |     | NULL    |       |
| personid | int(3) | YES  | MUL | NULL    |       |
+----------+--------+------+-----+---------+-------+
3 rows in set (0.13 sec)

MariaDB [day4]> alter table orders add column o_type varchar(10);
Query OK, 0 rows affected (0.45 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [day4]> desc orders;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| orderid  | int(3)      | NO   | PRI | NULL    |       |
| orderno  | int(3)      | NO   |     | NULL    |       |
| personid | int(3)      | YES  | MUL | NULL    |       |
| o_type   | varchar(10) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

MariaDB [day4]> alter table cust add primary key
    -> (o_type);
ERROR 1146 (42S02): Table 'day4.cust' doesn't exist
MariaDB [day4]> 
MariaDB [day4]> alter table orders add primary key (o_type);
ERROR 1068 (42000): Multiple primary key defined
MariaDB [day4]> create table alay(
    -> id integer (4) primary key,
    -> a_type varchar(12) primary key,
    -> body varchar(10));
ERROR 1068 (42000): Multiple primary key defined
MariaDB [day4]> create table alay(
    -> id integer (4),
    -> a_type varchar(12,
    -> body varchar(10));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '
body varchar(10))' at line 3
MariaDB [day4]> create table alay(
    -> id integer(4),
    -> a_type varchar(12),
    -> body varchar(10)
    -> primary key (id,a_type));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(id,a_type))' at line 5
MariaDB [day4]> create table alay(
    -> id integer(4),
    -> a_type varchar(12),
    -> body varchar(10),
    -> primary key (id,a_type));
Query OK, 0 rows affected (0.44 sec)

MariaDB [day4]> desc alay;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int(4)      | NO   | PRI | NULL    |       |
| a_type | varchar(12) | NO   | PRI | NULL    |       |
| body   | varchar(10) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.03 sec)

MariaDB [day4]> use csd2204s18;
Database changed
MariaDB [csd2204s18]> desc customer;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.03 sec)

MariaDB [csd2204s18]> select * from customer;
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
+--------+-----------------+----------+----------+------------+------+
9 rows in set (0.05 sec)

MariaDB [csd2204s18]> select * from customer order by name asc;
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
+--------+-----------------+----------+----------+------------+------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer order by name,city asc;
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
+--------+-----------------+----------+----------+------------+------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer order by city,name asc;
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
+--------+-----------------+----------+----------+------------+------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer order by city desc,name asc;
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
+--------+-----------------+----------+----------+------------+------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer;
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
+--------+-----------------+----------+----------+------------+------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer order by custID desc limit 3;
+--------+---------------+----------+----------+------------+------+
| custId | name          | nickname | city     | postalCode | age  |
+--------+---------------+----------+----------+------------+------+
| c09    | Tony Special  | Specie   | GTA      | 418921     |   62 |
| c08    | Ashko Charles | ak       | USA      | 421044     |   72 |
| c07    | Bobby chako   | Chac     | New york | 320300     |   70 |
+--------+---------------+----------+----------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where custID=c07,c08,c09;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'c08,c09' at line 1
MariaDB [csd2204s18]> select * from customer where custID=c07;
ERROR 1054 (42S22): Unknown column 'c07' in 'where clause'
MariaDB [csd2204s18]> select * from customer where custID in c07;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'c07' at line 1
MariaDB [csd2204s18]> select * from customer where custID='c07';
+--------+-------------+----------+----------+------------+------+
| custId | name        | nickname | city     | postalCode | age  |
+--------+-------------+----------+----------+------------+------+
| c07    | Bobby chako | Chac     | New york | 320300     |   70 |
+--------+-------------+----------+----------+------------+------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where custID='c07','08','09';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''08','09'' at line 1
MariaDB [csd2204s18]> select * from customer where custID='c07';
+--------+-------------+----------+----------+------------+------+
| custId | name        | nickname | city     | postalCode | age  |
+--------+-------------+----------+----------+------------+------+
| c07    | Bobby chako | Chac     | New york | 320300     |   70 |
+--------+-------------+----------+----------+------------+------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer order by custID desc limit 3 order by asc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'order by asc' at line 1
MariaDB [csd2204s18]> select * from customer order by custID desc limit 3;
+--------+---------------+----------+----------+------------+------+
| custId | name          | nickname | city     | postalCode | age  |
+--------+---------------+----------+----------+------------+------+
| c09    | Tony Special  | Specie   | GTA      | 418921     |   62 |
| c08    | Ashko Charles | ak       | USA      | 421044     |   72 |
| c07    | Bobby chako   | Chac     | New york | 320300     |   70 |
+--------+---------------+----------+----------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from(select * from customer order by custId desc limit 3) customer order by custId asc; 
+--------+---------------+----------+----------+------------+------+
| custId | name          | nickname | city     | postalCode | age  |
+--------+---------------+----------+----------+------------+------+
| c07    | Bobby chako   | Chac     | New york | 320300     |   70 |
| c08    | Ashko Charles | ak       | USA      | 421044     |   72 |
| c09    | Tony Special  | Specie   | GTA      | 418921     |   62 |
+--------+---------------+----------+----------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer group by city;
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
+--------+-----------------+----------+----------+------------+------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> select city from customer group by city;
+----------+
| city     |
+----------+
| Brazil   |
| GTA      |
| New York |
| toronto  |
| USA      |
| wdc      |
+----------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> select count(city) from customer group by city;
+-------------+
| count(city) |
+-------------+
|           1 |
|           1 |
|           2 |
|           3 |
|           1 |
|           1 |
+-------------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> select city from customer group by count(city);
ERROR 1111 (HY000): Invalid use of group function
MariaDB [csd2204s18]> select city, count(city)"No. of customers" from customer group by city;
+----------+------------------+
| city     | No. of customers |
+----------+------------------+
| Brazil   |                1 |
| GTA      |                1 |
| New York |                2 |
| toronto  |                3 |
| USA      |                1 |
| wdc      |                1 |
+----------+------------------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> select city, disctint(city) "No. of customers" from customer group by city;
ERROR 1305 (42000): FUNCTION csd2204s18.disctint does not exist
MariaDB [csd2204s18]> select count(*)"Unique citys" from customer group by city;
+--------------+
| Unique citys |
+--------------+
|            1 |
|            1 |
|            2 |
|            3 |
|            1 |
|            1 |
+--------------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> select distinct(city) from customers;
ERROR 1146 (42S02): Table 'csd2204s18.customers' doesn't exist
MariaDB [csd2204s18]> select city, count(city)"No. of customers" from customer group by city having city like 'New%';
+----------+------------------+
| city     | No. of customers |
+----------+------------------+
| New York |                2 |
+----------+------------------+
1 row in set (0.05 sec)

MariaDB [csd2204s18]> select city, count(city)"No. of customers" from customer group by city having city like 'New%' or city = 'toronto';
+----------+------------------+
| city     | No. of customers |
+----------+------------------+
| New York |                2 |
| toronto  |                3 |
+----------+------------------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> select city, count(city)"No. of customers" from customer group by city having Count(city) > 2;
+---------+------------------+
| city    | No. of customers |
+---------+------------------+
| toronto |                3 |
+---------+------------------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> select city, count(city)"No. of customers" from customer group by city having Count(age) > 50;
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where name Regexp 'n$';
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.06 sec)

MariaDB [csd2204s18]> select * from customer where name Regexp '^A';
+--------+---------------+----------+------+------------+------+
| custId | name          | nickname | city | postalCode | age  |
+--------+---------------+----------+------+------------+------+
| c01    | ashley        | ash      | wdc  | 321200     |   34 |
| c08    | Ashko Charles | ak       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where name Regexp '^..^';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where name Regexp '^..r';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where name Regexp '^...r';
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c03    | charlies theron | char     | New York | 120134     |   20 |
+--------+-----------------+----------+----------+------------+------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where name Regexp '[A-Z]';
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
+--------+-----------------+----------+----------+------------+------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where name Regexp '[0-9]';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where postalcode Regexp '[0-9]';
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
+--------+-----------------+----------+----------+------------+------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where name Regexp '[^A*]';
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
+--------+-----------------+----------+----------+------------+------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where name Regexp '[^A+]';
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
+--------+-----------------+----------+----------+------------+------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where name Regexp '^A+';
+--------+---------------+----------+------+------------+------+
| custId | name          | nickname | city | postalCode | age  |
+--------+---------------+----------+------+------------+------+
| c01    | ashley        | ash      | wdc  | 321200     |   34 |
| c08    | Ashko Charles | ak       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where name Regexp '^.{4}';
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
+--------+-----------------+----------+----------+------------+------+
9 rows in set (0.27 sec)

MariaDB [csd2204s18]> select * from customer where city Regexp '^.{4}';
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
+--------+-----------------+----------+----------+------------+------+
6 rows in set (0.02 sec)

MariaDB [csd2204s18]> select * from customer where city Regexp '^{4}';
ERROR 1139 (42000): Got error 'nothing to repeat at offset 3' from regexp
MariaDB [csd2204s18]> select * from customer where city Regexp '^..{4}';
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
+--------+-----------------+----------+----------+------------+------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where city Regexp '^a{4}';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where city Regexp '^o{3}';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where postalCode Regexp '^0{2}';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where postalCode Regexp '^.0{2}';
+--------+------------+----------+---------+------------+------+
| custId | name       | nickname | city    | postalCode | age  |
+--------+------------+----------+---------+------------+------+
| c02    | BOB MARLEY | BOB      | toronto | 100100     |   23 |
+--------+------------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where city Regexp '^.o{3}';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where postalCode Regexp '^.1{2}';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where postalCode Regexp '^1{2}';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where postalCode Regexp '^1{1}';
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
+--------+-----------------+----------+----------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer;
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 |
+--------+-----------------+----------+----------+------------+------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where postalCode Regexp '^.2{1}';
+--------+-----------------+----------+----------+------------+------+
| custId | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 |
| c03    | charlies theron | char     | New York | 120134     |   20 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where postalCode Regexp '^.2{100}';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from customer where name rlike '^A+';
+--------+---------------+----------+------+------------+------+
| custId | name          | nickname | city | postalCode | age  |
+--------+---------------+----------+------+------------+------+
| c01    | ashley        | ash      | wdc  | 321200     |   34 |
| c08    | Ashko Charles | ak       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> select current();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '()' at line 1
MariaDB [csd2204s18]> select curdate();
+------------+
| curdate()  |
+------------+
| 2018-05-14 |
+------------+
1 row in set (0.03 sec)

MariaDB [csd2204s18]> alter table customer add column Dob date();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '()' at line 1
MariaDB [csd2204s18]> alter table customer add column Dob date;
Query OK, 0 rows affected (0.53 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> update customer set Dob = '1991-01-10' where custID = 'c01';
Query OK, 1 row affected (0.11 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set Dob = '1996-04-15' where custID = 'c02';
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set Dob = '1996-04-15' where custID = 'c03';
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set Dob = '1995-11-03' where custID = 'c04';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set Dob = '1994-05-09' where custID = 'c05';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set Dob = '1995-07-17' where custID = 'c06';
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set Dob = '1985-08-28' where custID = 'c07';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set Dob = '1996-05-07' where custID = 'c08';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set Dob = '1995-10-22' where custID = 'c09';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> select *from customer;
+--------+-----------------+----------+----------+------------+------+------------+
| custId | name            | nickname | city     | postalCode | age  | Dob        |
+--------+-----------------+----------+----------+------------+------+------------+
| c01    | ashley          | ash      | wdc      | 321200     |   34 | 1991-01-10 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     |   23 | 1996-04-15 |
| c03    | charlies theron | char     | New York | 120134     |   20 | 1996-04-15 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     |   25 | 1995-11-03 |
| c05    | Donna newman    | New      | Toronto  | 130120     |   25 | 1994-05-09 |
| c06    | Eston M.        | M.       | Toronto  | 201023     |   65 | 1995-07-17 |
| c07    | Bobby chako     | Chac     | New york | 320300     |   70 | 1985-08-28 |
| c08    | Ashko Charles   | ak       | USA      | 421044     |   72 | 1996-05-07 |
| c09    | Tony Special    | Specie   | GTA      | 418921     |   62 | 1995-10-22 |
+--------+-----------------+----------+----------+------------+------+------------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> alter table customer drop column age;
Query OK, 0 rows affected (0.58 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> select *from customer;
+--------+-----------------+----------+----------+------------+------------+
| custId | name            | nickname | city     | postalCode | Dob        |
+--------+-----------------+----------+----------+------------+------------+
| c01    | ashley          | ash      | wdc      | 321200     | 1991-01-10 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     | 1996-04-15 |
| c03    | charlies theron | char     | New York | 120134     | 1996-04-15 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     | 1995-11-03 |
| c05    | Donna newman    | New      | Toronto  | 130120     | 1994-05-09 |
| c06    | Eston M.        | M.       | Toronto  | 201023     | 1995-07-17 |
| c07    | Bobby chako     | Chac     | New york | 320300     | 1985-08-28 |
| c08    | Ashko Charles   | ak       | USA      | 421044     | 1996-05-07 |
| c09    | Tony Special    | Specie   | GTA      | 418921     | 1995-10-22 |
+--------+-----------------+----------+----------+------------+------------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select name, dob, timestampdiff(year,dob,CURDATE()) "Age" from customer;
+-----------------+------------+------+
| name            | dob        | Age  |
+-----------------+------------+------+
| ashley          | 1991-01-10 |   27 |
| BOB MARLEY      | 1996-04-15 |   22 |
| charlies theron | 1996-04-15 |   22 |
| Denial jack     | 1995-11-03 |   22 |
| Donna newman    | 1994-05-09 |   24 |
| Eston M.        | 1995-07-17 |   22 |
| Bobby chako     | 1985-08-28 |   32 |
| Ashko Charles   | 1996-05-07 |   22 |
| Tony Special    | 1995-10-22 |   22 |
+-----------------+------------+------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer;
+--------+-----------------+----------+----------+------------+------------+
| custId | name            | nickname | city     | postalCode | Dob        |
+--------+-----------------+----------+----------+------------+------------+
| c01    | ashley          | ash      | wdc      | 321200     | 1991-01-10 |
| c02    | BOB MARLEY      | BOB      | toronto  | 100100     | 1996-04-15 |
| c03    | charlies theron | char     | New York | 120134     | 1996-04-15 |
| c04    | Denial jack     | Dj       | Brazil   | 341020     | 1995-11-03 |
| c05    | Donna newman    | New      | Toronto  | 130120     | 1994-05-09 |
| c06    | Eston M.        | M.       | Toronto  | 201023     | 1995-07-17 |
| c07    | Bobby chako     | Chac     | New york | 320300     | 1985-08-28 |
| c08    | Ashko Charles   | ak       | USA      | 421044     | 1996-05-07 |
| c09    | Tony Special    | Specie   | GTA      | 418921     | 1995-10-22 |
+--------+-----------------+----------+----------+------------+------------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select name, dob,( alter table customer add column age timestampdiff(year,dob,CURDATE())) "Age" from customer;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'alter table customer add column age timestampdiff(year,dob,CURDATE())) "Age" fro' at line 1
MariaDB [csd2204s18]> select name, dob, timestampdiff(year,dob,CURDATE())) "Age" from customer(alter table customer ad column age;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ') "Age" from customer(alter table customer ad column age' at line 1
MariaDB [csd2204s18]> select name, dob, timestampdiff(year,dob,CURDATE())) "Age" from customer(alter table customer add column age;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ') "Age" from customer(alter table customer add column age' at line 1
MariaDB [csd2204s18]> select name, dob, timestampdiff(year,dob,CURDATE())) "Age" from customer(alter table customer add column age);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ') "Age" from customer(alter table customer add column age)' at line 1
MariaDB [csd2204s18]> select name, dob, timestampdiff(year,dob,CURDATE())) "Age" from customer;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ') "Age" from customer' at line 1
MariaDB [csd2204s18]> select name, dob, timestampdiff(year,dob,CURDATE()) "Age" from customer;
+-----------------+------------+------+
| name            | dob        | Age  |
+-----------------+------------+------+
| ashley          | 1991-01-10 |   27 |
| BOB MARLEY      | 1996-04-15 |   22 |
| charlies theron | 1996-04-15 |   22 |
| Denial jack     | 1995-11-03 |   22 |
| Donna newman    | 1994-05-09 |   24 |
| Eston M.        | 1995-07-17 |   22 |
| Bobby chako     | 1985-08-28 |   32 |
| Ashko Charles   | 1996-05-07 |   22 |
| Tony Special    | 1995-10-22 |   22 |
+-----------------+------------+------+
9 rows in set (0.00 sec)

MariaDB [csd2204s18]> select name, dob, timestampdiff(year,dob,CURDATE()) "Age" from customer where  timestampdiff(year,dob,CURDATE() = 22;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [csd2204s18]> select name, dob, timestampdiff(year,dob,CURDATE()) "Age" from customer where  timestampdiff(year,dob,CURDATE()) = 22;
+-----------------+------------+------+
| name            | dob        | Age  |
+-----------------+------------+------+
| BOB MARLEY      | 1996-04-15 |   22 |
| charlies theron | 1996-04-15 |   22 |
| Denial jack     | 1995-11-03 |   22 |
| Eston M.        | 1995-07-17 |   22 |
| Ashko Charles   | 1996-05-07 |   22 |
| Tony Special    | 1995-10-22 |   22 |
+-----------------+------------+------+
6 rows in set (0.00 sec)

