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

MariaDB [(none)]> use csd2204s18;
Database changed
MariaDB [csd2204s18]> show tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| countries            |
| customer             |
| departments          |
| employees            |
| job_history          |
| jobs                 |
| locations            |
| manu                 |
| movie                |
| movies               |
| products             |
| regions              |
+----------------------+
12 rows in set (0.00 sec)

MariaDB [csd2204s18]> desc jobs;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> desc job_history;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| EMPLOYEE_ID   | decimal(6,0) | NO   | PRI | NULL    |       |
| START_DATE    | date         | NO   | PRI | NULL    |       |
| END_DATE      | date         | NO   |     | NULL    |       |
| JOB_ID        | varchar(10)  | NO   | MUL | NULL    |       |
| DEPARTMENT_ID | decimal(4,0) | YES  | MUL | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

MariaDB [csd2204s18]> desc locations;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| LOCATION_ID    | decimal(4,0) | NO   | PRI | 0       |       |
| STREET_ADDRESS | varchar(40)  | YES  |     | NULL    |       |
| POSTAL_CODE    | varchar(12)  | YES  |     | NULL    |       |
| CITY           | varchar(30)  | NO   | MUL | NULL    |       |
| STATE_PROVINCE | varchar(25)  | YES  | MUL | NULL    |       |
| COUNTRY_ID     | varchar(2)   | YES  | MUL | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> desc employees;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| EMPLOYEE_ID    | decimal(6,0) | NO   | PRI | 0       |       |
| FIRST_NAME     | varchar(20)  | YES  |     | NULL    |       |
| LAST_NAME      | varchar(25)  | NO   | MUL | NULL    |       |
| EMAIL          | varchar(25)  | NO   | UNI | NULL    |       |
| PHONE_NUMBER   | varchar(20)  | YES  |     | NULL    |       |
| HIRE_DATE      | date         | NO   |     | NULL    |       |
| JOB_ID         | varchar(10)  | NO   | MUL | NULL    |       |
| SALARY         | decimal(8,2) | YES  |     | NULL    |       |
| COMMISSION_PCT | decimal(2,2) | YES  |     | NULL    |       |
| MANAGER_ID     | decimal(6,0) | YES  | MUL | NULL    |       |
| DEPARTMENT_ID  | decimal(4,0) | YES  | MUL | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
11 rows in set (0.00 sec)

MariaDB [csd2204s18]> desc regions;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| REGION_ID   | decimal(5,0) | NO   | PRI | NULL    |       |
| REGION_NAME | varchar(25)  | YES  | UNI | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

MariaDB [csd2204s18]> desc country;
ERROR 1146 (42S02): Table 'csd2204s18.country' doesn't exist
MariaDB [csd2204s18]> desc countries;
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| COUNTRY_ID   | varchar(2)    | NO   | PRI | NULL    |       |
| COUNTRY_NAME | varchar(40)   | YES  |     | NULL    |       |
| REGION_ID    | decimal(10,0) | YES  | MUL | NULL    |       |
+--------------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> select salary from employees where last_name ='Bull';
+---------+
| salary  |
+---------+
| 4100.00 |
+---------+
1 row in set (0.02 sec)

MariaDB [csd2204s18]> select first_name, last _name from employees wheresalary > 1400;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '> 1400' at line 1
MariaDB [csd2204s18]> select first_name, last _name from employees wheres alary > 1400;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'alary > 1400' at line 1
MariaDB [csd2204s18]> select first_name, last _name from employees where salary > 1400;
ERROR 1054 (42S22): Unknown column 'last' in 'field list'
MariaDB [csd2204s18]> select first_name, last_name from employees where salary > 1400;
+-------------+-------------+
| first_name  | last_name   |
+-------------+-------------+
| Steven      | King        |
| Neena       | Kochhar     |
| Lex         | De Haan     |
| Alexander   | Hunold      |
| Bruce       | Ernst       |
| David       | Austin      |
| Valli       | Pataballa   |
| Diana       | Lorentz     |
| Nancy       | Greenberg   |
| Daniel      | Faviet      |
| John        | Chen        |
| Ismael      | Sciarra     |
| Jose Manuel | Urman       |
| Luis        | Popp        |
| Den         | Raphaely    |
| Alexander   | Khoo        |
| Shelli      | Baida       |
| Sigal       | Tobias      |
| Guy         | Himuro      |
| Karen       | Colmenares  |
| Matthew     | Weiss       |
| Adam        | Fripp       |
| Payam       | Kaufling    |
| Shanta      | Vollman     |
| Kevin       | Mourgos     |
| Julia       | Nayer       |
| Irene       | Mikkilineni |
| James       | Landry      |
| Steven      | Markle      |
| Laura       | Bissot      |
| Mozhe       | Atkinson    |
| James       | Marlow      |
| TJ          | Olson       |
| Jason       | Mallin      |
| Michael     | Rogers      |
| Ki          | Gee         |
| Hazel       | Philtanker  |
| Renske      | Ladwig      |
| Stephen     | Stiles      |
| John        | Seo         |
| Joshua      | Patel       |
| Trenna      | Rajs        |
| Curtis      | Davies      |
| Randall     | Matos       |
| Peter       | Vargas      |
| John        | Russell     |
| Karen       | Partners    |
| Alberto     | Errazuriz   |
| Gerald      | Cambrault   |
| Eleni       | Zlotkey     |
| Peter       | Tucker      |
| David       | Bernstein   |
| Peter       | Hall        |
| Christopher | Olsen       |
| Nanette     | Cambrault   |
| Oliver      | Tuvault     |
| Janette     | King        |
| Patrick     | Sully       |
| Allan       | McEwen      |
| Lindsey     | Smith       |
| Louise      | Doran       |
| Sarath      | Sewall      |
| Clara       | Vishney     |
| Danielle    | Greene      |
| Mattea      | Marvins     |
| David       | Lee         |
| Sundar      | Ande        |
| Amit        | Banda       |
| Lisa        | Ozer        |
| Harrison    | Bloom       |
| Tayler      | Fox         |
| William     | Smith       |
| Elizabeth   | Bates       |
| Sundita     | Kumar       |
| Ellen       | Abel        |
| Alyssa      | Hutton      |
| Jonathon    | Taylor      |
| Jack        | Livingston  |
| Kimberely   | Grant       |
| Charles     | Johnson     |
| Winston     | Taylor      |
| Jean        | Fleaur      |
| Martha      | Sullivan    |
| Girard      | Geoni       |
| Nandita     | Sarchand    |
| Alexis      | Bull        |
| Julia       | Dellinger   |
| Anthony     | Cabrio      |
| Kelly       | Chung       |
| Jennifer    | Dilly       |
| Timothy     | Gates       |
| Randall     | Perkins     |
| Sarah       | Bell        |
| Britney     | Everett     |
| Samuel      | McCain      |
| Vance       | Jones       |
| Alana       | Walsh       |
| Kevin       | Feeney      |
| Donald      | OConnell    |
| Douglas     | Grant       |
| Jennifer    | Whalen      |
| Michael     | Hartstein   |
| Pat         | Fay         |
| Susan       | Mavris      |
| Hermann     | Baer        |
| Shelley     | Higgins     |
| William     | Gietz       |
+-------------+-------------+
107 rows in set (0.00 sec)

MariaDB [csd2204s18]> select first_name, last_name,salary from employees where salary > 1400;
+-------------+-------------+----------+
| first_name  | last_name   | salary   |
+-------------+-------------+----------+
| Steven      | King        | 24000.00 |
| Neena       | Kochhar     | 17000.00 |
| Lex         | De Haan     | 17000.00 |
| Alexander   | Hunold      |  9000.00 |
| Bruce       | Ernst       |  6000.00 |
| David       | Austin      |  4800.00 |
| Valli       | Pataballa   |  4800.00 |
| Diana       | Lorentz     |  4200.00 |
| Nancy       | Greenberg   | 12000.00 |
| Daniel      | Faviet      |  9000.00 |
| John        | Chen        |  8200.00 |
| Ismael      | Sciarra     |  7700.00 |
| Jose Manuel | Urman       |  7800.00 |
| Luis        | Popp        |  6900.00 |
| Den         | Raphaely    | 11000.00 |
| Alexander   | Khoo        |  3100.00 |
| Shelli      | Baida       |  2900.00 |
| Sigal       | Tobias      |  2800.00 |
| Guy         | Himuro      |  2600.00 |
| Karen       | Colmenares  |  2500.00 |
| Matthew     | Weiss       |  8000.00 |
| Adam        | Fripp       |  8200.00 |
| Payam       | Kaufling    |  7900.00 |
| Shanta      | Vollman     |  6500.00 |
| Kevin       | Mourgos     |  5800.00 |
| Julia       | Nayer       |  3200.00 |
| Irene       | Mikkilineni |  2700.00 |
| James       | Landry      |  2400.00 |
| Steven      | Markle      |  2200.00 |
| Laura       | Bissot      |  3300.00 |
| Mozhe       | Atkinson    |  2800.00 |
| James       | Marlow      |  2500.00 |
| TJ          | Olson       |  2100.00 |
| Jason       | Mallin      |  3300.00 |
| Michael     | Rogers      |  2900.00 |
| Ki          | Gee         |  2400.00 |
| Hazel       | Philtanker  |  2200.00 |
| Renske      | Ladwig      |  3600.00 |
| Stephen     | Stiles      |  3200.00 |
| John        | Seo         |  2700.00 |
| Joshua      | Patel       |  2500.00 |
| Trenna      | Rajs        |  3500.00 |
| Curtis      | Davies      |  3100.00 |
| Randall     | Matos       |  2600.00 |
| Peter       | Vargas      |  2500.00 |
| John        | Russell     | 14000.00 |
| Karen       | Partners    | 13500.00 |
| Alberto     | Errazuriz   | 12000.00 |
| Gerald      | Cambrault   | 11000.00 |
| Eleni       | Zlotkey     | 10500.00 |
| Peter       | Tucker      | 10000.00 |
| David       | Bernstein   |  9500.00 |
| Peter       | Hall        |  9000.00 |
| Christopher | Olsen       |  8000.00 |
| Nanette     | Cambrault   |  7500.00 |
| Oliver      | Tuvault     |  7000.00 |
| Janette     | King        | 10000.00 |
| Patrick     | Sully       |  9500.00 |
| Allan       | McEwen      |  9000.00 |
| Lindsey     | Smith       |  8000.00 |
| Louise      | Doran       |  7500.00 |
| Sarath      | Sewall      |  7000.00 |
| Clara       | Vishney     | 10500.00 |
| Danielle    | Greene      |  9500.00 |
| Mattea      | Marvins     |  7200.00 |
| David       | Lee         |  6800.00 |
| Sundar      | Ande        |  6400.00 |
| Amit        | Banda       |  6200.00 |
| Lisa        | Ozer        | 11500.00 |
| Harrison    | Bloom       | 10000.00 |
| Tayler      | Fox         |  9600.00 |
| William     | Smith       |  7400.00 |
| Elizabeth   | Bates       |  7300.00 |
| Sundita     | Kumar       |  6100.00 |
| Ellen       | Abel        | 11000.00 |
| Alyssa      | Hutton      |  8800.00 |
| Jonathon    | Taylor      |  8600.00 |
| Jack        | Livingston  |  8400.00 |
| Kimberely   | Grant       |  7000.00 |
| Charles     | Johnson     |  6200.00 |
| Winston     | Taylor      |  3200.00 |
| Jean        | Fleaur      |  3100.00 |
| Martha      | Sullivan    |  2500.00 |
| Girard      | Geoni       |  2800.00 |
| Nandita     | Sarchand    |  4200.00 |
| Alexis      | Bull        |  4100.00 |
| Julia       | Dellinger   |  3400.00 |
| Anthony     | Cabrio      |  3000.00 |
| Kelly       | Chung       |  3800.00 |
| Jennifer    | Dilly       |  3600.00 |
| Timothy     | Gates       |  2900.00 |
| Randall     | Perkins     |  2500.00 |
| Sarah       | Bell        |  4000.00 |
| Britney     | Everett     |  3900.00 |
| Samuel      | McCain      |  3200.00 |
| Vance       | Jones       |  2800.00 |
| Alana       | Walsh       |  3100.00 |
| Kevin       | Feeney      |  3000.00 |
| Donald      | OConnell    |  2600.00 |
| Douglas     | Grant       |  2600.00 |
| Jennifer    | Whalen      |  4400.00 |
| Michael     | Hartstein   | 13000.00 |
| Pat         | Fay         |  6000.00 |
| Susan       | Mavris      |  6500.00 |
| Hermann     | Baer        | 10000.00 |
| Shelley     | Higgins     | 12000.00 |
| William     | Gietz       |  8300.00 |
+-------------+-------------+----------+
107 rows in set (0.00 sec)

MariaDB [csd2204s18]> select first_name, last_name,salary from employees where salary > 4100;
+-------------+------------+----------+
| first_name  | last_name  | salary   |
+-------------+------------+----------+
| Steven      | King       | 24000.00 |
| Neena       | Kochhar    | 17000.00 |
| Lex         | De Haan    | 17000.00 |
| Alexander   | Hunold     |  9000.00 |
| Bruce       | Ernst      |  6000.00 |
| David       | Austin     |  4800.00 |
| Valli       | Pataballa  |  4800.00 |
| Diana       | Lorentz    |  4200.00 |
| Nancy       | Greenberg  | 12000.00 |
| Daniel      | Faviet     |  9000.00 |
| John        | Chen       |  8200.00 |
| Ismael      | Sciarra    |  7700.00 |
| Jose Manuel | Urman      |  7800.00 |
| Luis        | Popp       |  6900.00 |
| Den         | Raphaely   | 11000.00 |
| Matthew     | Weiss      |  8000.00 |
| Adam        | Fripp      |  8200.00 |
| Payam       | Kaufling   |  7900.00 |
| Shanta      | Vollman    |  6500.00 |
| Kevin       | Mourgos    |  5800.00 |
| John        | Russell    | 14000.00 |
| Karen       | Partners   | 13500.00 |
| Alberto     | Errazuriz  | 12000.00 |
| Gerald      | Cambrault  | 11000.00 |
| Eleni       | Zlotkey    | 10500.00 |
| Peter       | Tucker     | 10000.00 |
| David       | Bernstein  |  9500.00 |
| Peter       | Hall       |  9000.00 |
| Christopher | Olsen      |  8000.00 |
| Nanette     | Cambrault  |  7500.00 |
| Oliver      | Tuvault    |  7000.00 |
| Janette     | King       | 10000.00 |
| Patrick     | Sully      |  9500.00 |
| Allan       | McEwen     |  9000.00 |
| Lindsey     | Smith      |  8000.00 |
| Louise      | Doran      |  7500.00 |
| Sarath      | Sewall     |  7000.00 |
| Clara       | Vishney    | 10500.00 |
| Danielle    | Greene     |  9500.00 |
| Mattea      | Marvins    |  7200.00 |
| David       | Lee        |  6800.00 |
| Sundar      | Ande       |  6400.00 |
| Amit        | Banda      |  6200.00 |
| Lisa        | Ozer       | 11500.00 |
| Harrison    | Bloom      | 10000.00 |
| Tayler      | Fox        |  9600.00 |
| William     | Smith      |  7400.00 |
| Elizabeth   | Bates      |  7300.00 |
| Sundita     | Kumar      |  6100.00 |
| Ellen       | Abel       | 11000.00 |
| Alyssa      | Hutton     |  8800.00 |
| Jonathon    | Taylor     |  8600.00 |
| Jack        | Livingston |  8400.00 |
| Kimberely   | Grant      |  7000.00 |
| Charles     | Johnson    |  6200.00 |
| Nandita     | Sarchand   |  4200.00 |
| Jennifer    | Whalen     |  4400.00 |
| Michael     | Hartstein  | 13000.00 |
| Pat         | Fay        |  6000.00 |
| Susan       | Mavris     |  6500.00 |
| Hermann     | Baer       | 10000.00 |
| Shelley     | Higgins    | 12000.00 |
| William     | Gietz      |  8300.00 |
+-------------+------------+----------+
63 rows in set (0.00 sec)

MariaDB [csd2204s18]> select first_name, last_name,salary from employees where salary > (select salary from employees where last_name ='Bull');
+-------------+------------+----------+
| first_name  | last_name  | salary   |
+-------------+------------+----------+
| Steven      | King       | 24000.00 |
| Neena       | Kochhar    | 17000.00 |
| Lex         | De Haan    | 17000.00 |
| Alexander   | Hunold     |  9000.00 |
| Bruce       | Ernst      |  6000.00 |
| David       | Austin     |  4800.00 |
| Valli       | Pataballa  |  4800.00 |
| Diana       | Lorentz    |  4200.00 |
| Nancy       | Greenberg  | 12000.00 |
| Daniel      | Faviet     |  9000.00 |
| John        | Chen       |  8200.00 |
| Ismael      | Sciarra    |  7700.00 |
| Jose Manuel | Urman      |  7800.00 |
| Luis        | Popp       |  6900.00 |
| Den         | Raphaely   | 11000.00 |
| Matthew     | Weiss      |  8000.00 |
| Adam        | Fripp      |  8200.00 |
| Payam       | Kaufling   |  7900.00 |
| Shanta      | Vollman    |  6500.00 |
| Kevin       | Mourgos    |  5800.00 |
| John        | Russell    | 14000.00 |
| Karen       | Partners   | 13500.00 |
| Alberto     | Errazuriz  | 12000.00 |
| Gerald      | Cambrault  | 11000.00 |
| Eleni       | Zlotkey    | 10500.00 |
| Peter       | Tucker     | 10000.00 |
| David       | Bernstein  |  9500.00 |
| Peter       | Hall       |  9000.00 |
| Christopher | Olsen      |  8000.00 |
| Nanette     | Cambrault  |  7500.00 |
| Oliver      | Tuvault    |  7000.00 |
| Janette     | King       | 10000.00 |
| Patrick     | Sully      |  9500.00 |
| Allan       | McEwen     |  9000.00 |
| Lindsey     | Smith      |  8000.00 |
| Louise      | Doran      |  7500.00 |
| Sarath      | Sewall     |  7000.00 |
| Clara       | Vishney    | 10500.00 |
| Danielle    | Greene     |  9500.00 |
| Mattea      | Marvins    |  7200.00 |
| David       | Lee        |  6800.00 |
| Sundar      | Ande       |  6400.00 |
| Amit        | Banda      |  6200.00 |
| Lisa        | Ozer       | 11500.00 |
| Harrison    | Bloom      | 10000.00 |
| Tayler      | Fox        |  9600.00 |
| William     | Smith      |  7400.00 |
| Elizabeth   | Bates      |  7300.00 |
| Sundita     | Kumar      |  6100.00 |
| Ellen       | Abel       | 11000.00 |
| Alyssa      | Hutton     |  8800.00 |
| Jonathon    | Taylor     |  8600.00 |
| Jack        | Livingston |  8400.00 |
| Kimberely   | Grant      |  7000.00 |
| Charles     | Johnson    |  6200.00 |
| Nandita     | Sarchand   |  4200.00 |
| Jennifer    | Whalen     |  4400.00 |
| Michael     | Hartstein  | 13000.00 |
| Pat         | Fay        |  6000.00 |
| Susan       | Mavris     |  6500.00 |
| Hermann     | Baer       | 10000.00 |
| Shelley     | Higgins    | 12000.00 |
| William     | Gietz      |  8300.00 |
+-------------+------------+----------+
63 rows in set (0.03 sec)

MariaDB [csd2204s18]> select * from departments;
+---------------+----------------------+------------+-------------+
| DEPARTMENT_ID | DEPARTMENT_NAME      | MANAGER_ID | LOCATION_ID |
+---------------+----------------------+------------+-------------+
|            10 | Administration       |        200 |        1700 |
|            20 | Marketing            |        201 |        1800 |
|            30 | Purchasing           |        114 |        1700 |
|            40 | Human Resources      |        203 |        2400 |
|            50 | Shipping             |        121 |        1500 |
|            60 | IT                   |        103 |        1400 |
|            70 | Public Relations     |        204 |        2700 |
|            80 | Sales                |        145 |        2500 |
|            90 | Executive            |        100 |        1700 |
|           100 | Finance              |        108 |        1700 |
|           110 | Accounting           |        205 |        1700 |
|           120 | Treasury             |          0 |        1700 |
|           130 | Corporate Tax        |          0 |        1700 |
|           140 | Control And Credit   |          0 |        1700 |
|           150 | Shareholder Services |          0 |        1700 |
|           160 | Benefits             |          0 |        1700 |
|           170 | Manufacturing        |          0 |        1700 |
|           180 | Construction         |          0 |        1700 |
|           190 | Contracting          |          0 |        1700 |
|           200 | Operations           |          0 |        1700 |
|           210 | IT Support           |          0 |        1700 |
|           220 | NOC                  |          0 |        1700 |
|           230 | IT Helpdesk          |          0 |        1700 |
|           240 | Government Sales     |          0 |        1700 |
|           250 | Retail Sales         |          0 |        1700 |
|           260 | Recruiting           |          0 |        1700 |
|           270 | Payroll              |          0 |        1700 |
+---------------+----------------------+------------+-------------+
27 rows in set (0.00 sec)

MariaDB [csd2204s18]> select department_id from department where department_name ='it';
ERROR 1146 (42S02): Table 'csd2204s18.department' doesn't exist
MariaDB [csd2204s18]> select department_id from departments where department_name ='it';
+---------------+
| department_id |
+---------------+
|            60 |
+---------------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> select department_id, department_name from departments where department_name ='it';
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
|            60 | IT              |
+---------------+-----------------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> select department_id, department_name from departments where department_name like 'it';
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
|            60 | IT              |
+---------------+-----------------+
1 row in set (0.02 sec)

MariaDB [csd2204s18]> select department_id, department_name from departments where department_name like 'it%';
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
|            60 | IT              |
|           210 | IT Support      |
|           230 | IT Helpdesk     |
+---------------+-----------------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> select first_name, last_name,department_id from employees where(select department_id, department_name from departments where department_name like 'it%');
ERROR 1241 (21000): Operand should contain 1 column(s)
MariaDB [csd2204s18]> select first_name, last_name,department_id from employees where department_id =(select department_id, department_name from departments where department_name like 'it%');
ERROR 1241 (21000): Operand should contain 1 column(s)
MariaDB [csd2204s18]> select first_name, last_name,department_id from employees where department_id in (select department_id, department_name from departments where department_name like 'it%');
ERROR 1241 (21000): Operand should contain 1 column(s)
MariaDB [csd2204s18]> select first_name, last_name,department_id from employees where department_id in (select department_id from departments where department_name like 'it%');
+------------+-----------+---------------+
| first_name | last_name | department_id |
+------------+-----------+---------------+
| Alexander  | Hunold    |            60 |
| Bruce      | Ernst     |            60 |
| David      | Austin    |            60 |
| Valli      | Pataballa |            60 |
| Diana      | Lorentz   |            60 |
+------------+-----------+---------------+
5 rows in set (0.00 sec)

MariaDB [csd2204s18]> select first_name,last_name from employees where mamager_id !=0;
ERROR 1054 (42S22): Unknown column 'mamager_id' in 'where clause'
MariaDB [csd2204s18]> select first_name,last_name from employees where manager_id !=0;
+-------------+-------------+
| first_name  | last_name   |
+-------------+-------------+
| Neena       | Kochhar     |
| Lex         | De Haan     |
| Alexander   | Hunold      |
| Bruce       | Ernst       |
| David       | Austin      |
| Valli       | Pataballa   |
| Diana       | Lorentz     |
| Nancy       | Greenberg   |
| Daniel      | Faviet      |
| John        | Chen        |
| Ismael      | Sciarra     |
| Jose Manuel | Urman       |
| Luis        | Popp        |
| Den         | Raphaely    |
| Alexander   | Khoo        |
| Shelli      | Baida       |
| Sigal       | Tobias      |
| Guy         | Himuro      |
| Karen       | Colmenares  |
| Matthew     | Weiss       |
| Adam        | Fripp       |
| Payam       | Kaufling    |
| Shanta      | Vollman     |
| Kevin       | Mourgos     |
| Julia       | Nayer       |
| Irene       | Mikkilineni |
| James       | Landry      |
| Steven      | Markle      |
| Laura       | Bissot      |
| Mozhe       | Atkinson    |
| James       | Marlow      |
| TJ          | Olson       |
| Jason       | Mallin      |
| Michael     | Rogers      |
| Ki          | Gee         |
| Hazel       | Philtanker  |
| Renske      | Ladwig      |
| Stephen     | Stiles      |
| John        | Seo         |
| Joshua      | Patel       |
| Trenna      | Rajs        |
| Curtis      | Davies      |
| Randall     | Matos       |
| Peter       | Vargas      |
| John        | Russell     |
| Karen       | Partners    |
| Alberto     | Errazuriz   |
| Gerald      | Cambrault   |
| Eleni       | Zlotkey     |
| Peter       | Tucker      |
| David       | Bernstein   |
| Peter       | Hall        |
| Christopher | Olsen       |
| Nanette     | Cambrault   |
| Oliver      | Tuvault     |
| Janette     | King        |
| Patrick     | Sully       |
| Allan       | McEwen      |
| Lindsey     | Smith       |
| Louise      | Doran       |
| Sarath      | Sewall      |
| Clara       | Vishney     |
| Danielle    | Greene      |
| Mattea      | Marvins     |
| David       | Lee         |
| Sundar      | Ande        |
| Amit        | Banda       |
| Lisa        | Ozer        |
| Harrison    | Bloom       |
| Tayler      | Fox         |
| William     | Smith       |
| Elizabeth   | Bates       |
| Sundita     | Kumar       |
| Ellen       | Abel        |
| Alyssa      | Hutton      |
| Jonathon    | Taylor      |
| Jack        | Livingston  |
| Kimberely   | Grant       |
| Charles     | Johnson     |
| Winston     | Taylor      |
| Jean        | Fleaur      |
| Martha      | Sullivan    |
| Girard      | Geoni       |
| Nandita     | Sarchand    |
| Alexis      | Bull        |
| Julia       | Dellinger   |
| Anthony     | Cabrio      |
| Kelly       | Chung       |
| Jennifer    | Dilly       |
| Timothy     | Gates       |
| Randall     | Perkins     |
| Sarah       | Bell        |
| Britney     | Everett     |
| Samuel      | McCain      |
| Vance       | Jones       |
| Alana       | Walsh       |
| Kevin       | Feeney      |
| Donald      | OConnell    |
| Douglas     | Grant       |
| Jennifer    | Whalen      |
| Michael     | Hartstein   |
| Pat         | Fay         |
| Susan       | Mavris      |
| Hermann     | Baer        |
| Shelley     | Higgins     |
| William     | Gietz       |
+-------------+-------------+
106 rows in set (0.00 sec)

MariaDB [csd2204s18]> select location_id, country_id from locations where country_is like 'us';
ERROR 1054 (42S22): Unknown column 'country_is' in 'where clause'
MariaDB [csd2204s18]> select location_id, country_id from locations where country_id like 'us';
+-------------+------------+
| location_id | country_id |
+-------------+------------+
|        1400 | US         |
|        1500 | US         |
|        1600 | US         |
|        1700 | US         |
+-------------+------------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> select department_id from departments where location_id in( select location_id, country_id from locations where country_id like 'us');
ERROR 1241 (21000): Operand should contain 1 column(s)
MariaDB [csd2204s18]> select department_id from departments where location_id in( select location_id from locations where country_id like 'us');
+---------------+
| department_id |
+---------------+
|            60 |
|            50 |
|            10 |
|            30 |
|            90 |
|           100 |
|           110 |
|           120 |
|           130 |
|           140 |
|           150 |
|           160 |
|           170 |
|           180 |
|           190 |
|           200 |
|           210 |
|           220 |
|           230 |
|           240 |
|           250 |
|           260 |
|           270 |
+---------------+
23 rows in set (0.00 sec)

MariaDB [csd2204s18]> select first_name,last_name from employees where manager_id !=0 
    -> and deoartment_id in
    -> (select department_id from departments 
    -> where location_id in
    -> (select location_id from locations where country_id like 'us'
    -> ));
ERROR 1054 (42S22): Unknown column 'deoartment_id' in 'IN/ALL/ANY subquery'
MariaDB [csd2204s18]> select first_name,last_name from employees where manager_id !=0 
    -> and department_id in
    -> (select department_id from departments 
    -> where location_id in
    -> (select location_id from locations where country_id like 'us'
    -> ));
+-------------+-------------+
| first_name  | last_name   |
+-------------+-------------+
| Alexander   | Hunold      |
| Bruce       | Ernst       |
| David       | Austin      |
| Valli       | Pataballa   |
| Diana       | Lorentz     |
| Matthew     | Weiss       |
| Adam        | Fripp       |
| Payam       | Kaufling    |
| Shanta      | Vollman     |
| Kevin       | Mourgos     |
| Julia       | Nayer       |
| Irene       | Mikkilineni |
| James       | Landry      |
| Steven      | Markle      |
| Laura       | Bissot      |
| Mozhe       | Atkinson    |
| James       | Marlow      |
| TJ          | Olson       |
| Jason       | Mallin      |
| Michael     | Rogers      |
| Ki          | Gee         |
| Hazel       | Philtanker  |
| Renske      | Ladwig      |
| Stephen     | Stiles      |
| John        | Seo         |
| Joshua      | Patel       |
| Trenna      | Rajs        |
| Curtis      | Davies      |
| Randall     | Matos       |
| Peter       | Vargas      |
| Winston     | Taylor      |
| Jean        | Fleaur      |
| Martha      | Sullivan    |
| Girard      | Geoni       |
| Nandita     | Sarchand    |
| Alexis      | Bull        |
| Julia       | Dellinger   |
| Anthony     | Cabrio      |
| Kelly       | Chung       |
| Jennifer    | Dilly       |
| Timothy     | Gates       |
| Randall     | Perkins     |
| Sarah       | Bell        |
| Britney     | Everett     |
| Samuel      | McCain      |
| Vance       | Jones       |
| Alana       | Walsh       |
| Kevin       | Feeney      |
| Donald      | OConnell    |
| Douglas     | Grant       |
| Jennifer    | Whalen      |
| Den         | Raphaely    |
| Alexander   | Khoo        |
| Shelli      | Baida       |
| Sigal       | Tobias      |
| Guy         | Himuro      |
| Karen       | Colmenares  |
| Neena       | Kochhar     |
| Lex         | De Haan     |
| Nancy       | Greenberg   |
| Daniel      | Faviet      |
| John        | Chen        |
| Ismael      | Sciarra     |
| Jose Manuel | Urman       |
| Luis        | Popp        |
| Shelley     | Higgins     |
| William     | Gietz       |
+-------------+-------------+
67 rows in set (0.00 sec)

MariaDB [csd2204s18]> select manager_id from employees where manager_id !=0;
+------------+
| manager_id |
+------------+
|        100 |
|        100 |
|        100 |
|        100 |
|        100 |
|        100 |
|        100 |
|        100 |
|        100 |
|        100 |
|        100 |
|        100 |
|        100 |
|        100 |
|        101 |
|        101 |
|        101 |
|        101 |
|        101 |
|        102 |
|        103 |
|        103 |
|        103 |
|        103 |
|        108 |
|        108 |
|        108 |
|        108 |
|        108 |
|        114 |
|        114 |
|        114 |
|        114 |
|        114 |
|        120 |
|        120 |
|        120 |
|        120 |
|        120 |
|        120 |
|        120 |
|        120 |
|        121 |
|        121 |
|        121 |
|        121 |
|        121 |
|        121 |
|        121 |
|        121 |
|        122 |
|        122 |
|        122 |
|        122 |
|        122 |
|        122 |
|        122 |
|        122 |
|        123 |
|        123 |
|        123 |
|        123 |
|        123 |
|        123 |
|        123 |
|        123 |
|        124 |
|        124 |
|        124 |
|        124 |
|        124 |
|        124 |
|        124 |
|        124 |
|        145 |
|        145 |
|        145 |
|        145 |
|        145 |
|        145 |
|        146 |
|        146 |
|        146 |
|        146 |
|        146 |
|        146 |
|        147 |
|        147 |
|        147 |
|        147 |
|        147 |
|        147 |
|        148 |
|        148 |
|        148 |
|        148 |
|        148 |
|        148 |
|        149 |
|        149 |
|        149 |
|        149 |
|        149 |
|        149 |
|        201 |
|        205 |
+------------+
106 rows in set (0.00 sec)

MariaDB [csd2204s18]> select Distinct(manager_id) from employees where manager_id !=0 
    -> ;
+------------+
| manager_id |
+------------+
|        100 |
|        101 |
|        102 |
|        103 |
|        108 |
|        114 |
|        120 |
|        121 |
|        122 |
|        123 |
|        124 |
|        145 |
|        146 |
|        147 |
|        148 |
|        149 |
|        201 |
|        205 |
+------------+
18 rows in set (0.02 sec)

MariaDB [csd2204s18]> 
MariaDB [csd2204s18]> select first_name,last_name from employees
    -> where employee_id in
    -> (select Distinct(manager_id) from employees where manager_id !=0); 
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Steven     | King      |
| Neena      | Kochhar   |
| Lex        | De Haan   |
| Alexander  | Hunold    |
| Nancy      | Greenberg |
| Den        | Raphaely  |
| Matthew    | Weiss     |
| Adam       | Fripp     |
| Payam      | Kaufling  |
| Shanta     | Vollman   |
| Kevin      | Mourgos   |
| John       | Russell   |
| Karen      | Partners  |
| Alberto    | Errazuriz |
| Gerald     | Cambrault |
| Eleni      | Zlotkey   |
| Michael    | Hartstein |
| Shelley    | Higgins   |
+------------+-----------+
18 rows in set (0.00 sec)

MariaDB [csd2204s18]> select avg(salary) from employees;
+-------------+
| avg(salary) |
+-------------+
| 6461.682243 |
+-------------+
1 row in set (0.02 sec)

MariaDB [csd2204s18]> select first_name,last_name from employees
    -> where salary >(select avg(salary) from employees);
+-------------+------------+
| first_name  | last_name  |
+-------------+------------+
| Steven      | King       |
| Neena       | Kochhar    |
| Lex         | De Haan    |
| Alexander   | Hunold     |
| Nancy       | Greenberg  |
| Daniel      | Faviet     |
| John        | Chen       |
| Ismael      | Sciarra    |
| Jose Manuel | Urman      |
| Luis        | Popp       |
| Den         | Raphaely   |
| Matthew     | Weiss      |
| Adam        | Fripp      |
| Payam       | Kaufling   |
| Shanta      | Vollman    |
| John        | Russell    |
| Karen       | Partners   |
| Alberto     | Errazuriz  |
| Gerald      | Cambrault  |
| Eleni       | Zlotkey    |
| Peter       | Tucker     |
| David       | Bernstein  |
| Peter       | Hall       |
| Christopher | Olsen      |
| Nanette     | Cambrault  |
| Oliver      | Tuvault    |
| Janette     | King       |
| Patrick     | Sully      |
| Allan       | McEwen     |
| Lindsey     | Smith      |
| Louise      | Doran      |
| Sarath      | Sewall     |
| Clara       | Vishney    |
| Danielle    | Greene     |
| Mattea      | Marvins    |
| David       | Lee        |
| Lisa        | Ozer       |
| Harrison    | Bloom      |
| Tayler      | Fox        |
| William     | Smith      |
| Elizabeth   | Bates      |
| Ellen       | Abel       |
| Alyssa      | Hutton     |
| Jonathon    | Taylor     |
| Jack        | Livingston |
| Kimberely   | Grant      |
| Michael     | Hartstein  |
| Susan       | Mavris     |
| Hermann     | Baer       |
| Shelley     | Higgins    |
| William     | Gietz      |
+-------------+------------+
51 rows in set (0.00 sec)

MariaDB [csd2204s18]> select first_name,last_name,salary from employees
    -> where salary >(select avg(salary) from employees);
+-------------+------------+----------+
| first_name  | last_name  | salary   |
+-------------+------------+----------+
| Steven      | King       | 24000.00 |
| Neena       | Kochhar    | 17000.00 |
| Lex         | De Haan    | 17000.00 |
| Alexander   | Hunold     |  9000.00 |
| Nancy       | Greenberg  | 12000.00 |
| Daniel      | Faviet     |  9000.00 |
| John        | Chen       |  8200.00 |
| Ismael      | Sciarra    |  7700.00 |
| Jose Manuel | Urman      |  7800.00 |
| Luis        | Popp       |  6900.00 |
| Den         | Raphaely   | 11000.00 |
| Matthew     | Weiss      |  8000.00 |
| Adam        | Fripp      |  8200.00 |
| Payam       | Kaufling   |  7900.00 |
| Shanta      | Vollman    |  6500.00 |
| John        | Russell    | 14000.00 |
| Karen       | Partners   | 13500.00 |
| Alberto     | Errazuriz  | 12000.00 |
| Gerald      | Cambrault  | 11000.00 |
| Eleni       | Zlotkey    | 10500.00 |
| Peter       | Tucker     | 10000.00 |
| David       | Bernstein  |  9500.00 |
| Peter       | Hall       |  9000.00 |
| Christopher | Olsen      |  8000.00 |
| Nanette     | Cambrault  |  7500.00 |
| Oliver      | Tuvault    |  7000.00 |
| Janette     | King       | 10000.00 |
| Patrick     | Sully      |  9500.00 |
| Allan       | McEwen     |  9000.00 |
| Lindsey     | Smith      |  8000.00 |
| Louise      | Doran      |  7500.00 |
| Sarath      | Sewall     |  7000.00 |
| Clara       | Vishney    | 10500.00 |
| Danielle    | Greene     |  9500.00 |
| Mattea      | Marvins    |  7200.00 |
| David       | Lee        |  6800.00 |
| Lisa        | Ozer       | 11500.00 |
| Harrison    | Bloom      | 10000.00 |
| Tayler      | Fox        |  9600.00 |
| William     | Smith      |  7400.00 |
| Elizabeth   | Bates      |  7300.00 |
| Ellen       | Abel       | 11000.00 |
| Alyssa      | Hutton     |  8800.00 |
| Jonathon    | Taylor     |  8600.00 |
| Jack        | Livingston |  8400.00 |
| Kimberely   | Grant      |  7000.00 |
| Michael     | Hartstein  | 13000.00 |
| Susan       | Mavris     |  6500.00 |
| Hermann     | Baer       | 10000.00 |
| Shelley     | Higgins    | 12000.00 |
| William     | Gietz      |  8300.00 |
+-------------+------------+----------+
51 rows in set (0.00 sec)

MariaDB [csd2204s18]> select first_name,last_name,salary from employees
    -> where job_id in (select min_salary from jobs)
    -> ;
Empty set, 2033 warnings (0.03 sec)

MariaDB [csd2204s18]> 
MariaDB [csd2204s18]> select min(salary) from employees
    -> where job_id in (select min_salary from jobs);
+-------------+
| min(salary) |
+-------------+
|        NULL |
+-------------+
1 row in set, 2033 warnings (0.03 sec)

MariaDB [csd2204s18]> 
MariaDB [csd2204s18]> 
MariaDB [csd2204s18]> select first_name,last_name,salary,job_id from employees
    -> where salary Like(select min_salary from jobs);
ERROR 1242 (21000): Subquery returns more than 1 row
MariaDB [csd2204s18]> select first_name,last_name,salary,job_id from employees
    -> where salary = (select min_salary from jobs);
ERROR 1242 (21000): Subquery returns more than 1 row
MariaDB [csd2204s18]> select first_name,last_name,salary,job_id from employees
    -> where employees.salary = (select min_salary from jobs where employees.job_id = jobs.job_id);
+------------+------------+---------+----------+
| first_name | last_name  | salary  | job_id   |
+------------+------------+---------+----------+
| Karen      | Colmenares | 2500.00 | PU_CLERK |
| Martha     | Sullivan   | 2500.00 | SH_CLERK |
| Randall    | Perkins    | 2500.00 | SH_CLERK |
+------------+------------+---------+----------+
3 rows in set (0.01 sec)

MariaDB [csd2204s18]> select avg(salary) from employees;
+-------------+
| avg(salary) |
+-------------+
| 6461.682243 |
+-------------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> select department_id from departments 
    -> where drpartmentname like 'It%';
ERROR 1054 (42S22): Unknown column 'drpartmentname' in 'where clause'
MariaDB [csd2204s18]> where drpartment_name like 'It%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'where drpartment_name like 'It%'' at line 1
MariaDB [csd2204s18]> where department_name like 'It%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'where department_name like 'It%'' at line 1
MariaDB [csd2204s18]> select department_id from departments 
    -> where drpartment_name like 'It%';
ERROR 1054 (42S22): Unknown column 'drpartment_name' in 'where clause'
MariaDB [csd2204s18]> select department_id from departments 
    -> where department_name like 'It%';
+---------------+
| department_id |
+---------------+
|            60 |
|           210 |
|           230 |
+---------------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> 
MariaDB [csd2204s18]> select first_name,last_name,salary from employees
    -> where salary >(select avg(salary) from employees) 
    -> and department_id in(select department_id from departments where department_name like 'It%');
+------------+-----------+---------+
| first_name | last_name | salary  |
+------------+-----------+---------+
| Alexander  | Hunold    | 9000.00 |
+------------+-----------+---------+
1 row in set (0.00 sec)

