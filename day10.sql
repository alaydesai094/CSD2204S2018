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

MariaDB [csd2204s18]> select first_name, last_name,salary from employees where salary >(select salary from employees where last_name like 'Bell');
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
| Alexis      | Bull       |  4100.00 |
| Jennifer    | Whalen     |  4400.00 |
| Michael     | Hartstein  | 13000.00 |
| Pat         | Fay        |  6000.00 |
| Susan       | Mavris     |  6500.00 |
| Hermann     | Baer       | 10000.00 |
| Shelley     | Higgins    | 12000.00 |
| William     | Gietz      |  8300.00 |
+-------------+------------+----------+
64 rows in set (0.02 sec)

MariaDB [csd2204s18]> select min(min_salary)+1000 from jobs; 
+----------------------+
| min(min_salary)+1000 |
+----------------------+
|                 3000 |
+----------------------+
1 row in set, 3 warnings (0.06 sec)

MariaDB [csd2204s18]> select first_name _last
    -> ;
ERROR 1054 (42S22): Unknown column 'first_name' in 'field list'
MariaDB [csd2204s18]> select firsr_name, last_name, salary from employees where salary =(select min(min_salary)+1000 from jobs);
ERROR 1054 (42S22): Unknown column 'firsr_name' in 'field list'
MariaDB [csd2204s18]> select first_name, last_name, salary from employees where salary =(select min(min_salary)+1000 from jobs);
+------------+-----------+---------+
| first_name | last_name | salary  |
+------------+-----------+---------+
| Anthony    | Cabrio    | 3000.00 |
| Kevin      | Feeney    | 3000.00 |
+------------+-----------+---------+
2 rows in set (0.02 sec)

MariaDB [csd2204s18]> select * from employees where salary > all(select avg(salary) from employees group by department_id);
+-------------+------------+-----------+-------+--------------+------------+---------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME | LAST_NAME | EMAIL | PHONE_NUMBER | HIRE_DATE  | JOB_ID  | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+------------+-----------+-------+--------------+------------+---------+----------+----------------+------------+---------------+
|         100 | Steven     | King      | SKING | 515.123.4567 | 1987-06-17 | AD_PRES | 24000.00 |           0.00 |          0 |            90 |
+-------------+------------+-----------+-------+--------------+------------+---------+----------+----------------+------------+---------------+
1 row in set (0.02 sec)

MariaDB [csd2204s18]> select first_nme, Last_name, salary from employees where salary > all(select avg(salary) from employees group by department_id);
ERROR 1054 (42S22): Unknown column 'first_nme' in 'field list'
MariaDB [csd2204s18]> select first_name, Last_name, salary from employees where salary > all(select avg(salary) from employees group by department_id);
+------------+-----------+----------+
| first_name | Last_name | salary   |
+------------+-----------+----------+
| Steven     | King      | 24000.00 |
+------------+-----------+----------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> select max(salary) from employees where job_id = 'SH_CLERK';
+-------------+
| max(salary) |
+-------------+
|     4200.00 |
+-------------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> select first_name, Last_name, salary from employees where salary > ( select max(salary) from employees where job_id = 'SH_CLERK' order by asc;);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'asc' at line 1
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')' at line 1
MariaDB [csd2204s18]> select first_name, Last_name, salary from employees where salary > ( select max(salary) from employees where job_id = 'SH_CLERK' order by asc);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'asc)' at line 1
MariaDB [csd2204s18]> select first_name, Last_name, salary from employees where salary > ( select max(salary) from employees where job_id = 'SH_CLERK' order by salary  asc);
+-------------+------------+----------+
| first_name  | Last_name  | salary   |
+-------------+------------+----------+
| Steven      | King       | 24000.00 |
| Neena       | Kochhar    | 17000.00 |
| Lex         | De Haan    | 17000.00 |
| Alexander   | Hunold     |  9000.00 |
| Bruce       | Ernst      |  6000.00 |
| David       | Austin     |  4800.00 |
| Valli       | Pataballa  |  4800.00 |
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
| Jennifer    | Whalen     |  4400.00 |
| Michael     | Hartstein  | 13000.00 |
| Pat         | Fay        |  6000.00 |
| Susan       | Mavris     |  6500.00 |
| Hermann     | Baer       | 10000.00 |
| Shelley     | Higgins    | 12000.00 |
| William     | Gietz      |  8300.00 |
+-------------+------------+----------+
61 rows in set (0.00 sec)

MariaDB [csd2204s18]> select first_name, Last_name, salary from employees where salary > ( select max(salary) from employees where job_id = 'SH_CLERK')order by salary;
+-------------+------------+----------+
| first_name  | Last_name  | salary   |
+-------------+------------+----------+
| Jennifer    | Whalen     |  4400.00 |
| David       | Austin     |  4800.00 |
| Valli       | Pataballa  |  4800.00 |
| Kevin       | Mourgos    |  5800.00 |
| Bruce       | Ernst      |  6000.00 |
| Pat         | Fay        |  6000.00 |
| Sundita     | Kumar      |  6100.00 |
| Amit        | Banda      |  6200.00 |
| Charles     | Johnson    |  6200.00 |
| Sundar      | Ande       |  6400.00 |
| Susan       | Mavris     |  6500.00 |
| Shanta      | Vollman    |  6500.00 |
| David       | Lee        |  6800.00 |
| Luis        | Popp       |  6900.00 |
| Sarath      | Sewall     |  7000.00 |
| Oliver      | Tuvault    |  7000.00 |
| Kimberely   | Grant      |  7000.00 |
| Mattea      | Marvins    |  7200.00 |
| Elizabeth   | Bates      |  7300.00 |
| William     | Smith      |  7400.00 |
| Nanette     | Cambrault  |  7500.00 |
| Louise      | Doran      |  7500.00 |
| Ismael      | Sciarra    |  7700.00 |
| Jose Manuel | Urman      |  7800.00 |
| Payam       | Kaufling   |  7900.00 |
| Lindsey     | Smith      |  8000.00 |
| Matthew     | Weiss      |  8000.00 |
| Christopher | Olsen      |  8000.00 |
| Adam        | Fripp      |  8200.00 |
| John        | Chen       |  8200.00 |
| William     | Gietz      |  8300.00 |
| Jack        | Livingston |  8400.00 |
| Jonathon    | Taylor     |  8600.00 |
| Alyssa      | Hutton     |  8800.00 |
| Allan       | McEwen     |  9000.00 |
| Peter       | Hall       |  9000.00 |
| Alexander   | Hunold     |  9000.00 |
| Daniel      | Faviet     |  9000.00 |
| Patrick     | Sully      |  9500.00 |
| Danielle    | Greene     |  9500.00 |
| David       | Bernstein  |  9500.00 |
| Tayler      | Fox        |  9600.00 |
| Hermann     | Baer       | 10000.00 |
| Harrison    | Bloom      | 10000.00 |
| Janette     | King       | 10000.00 |
| Peter       | Tucker     | 10000.00 |
| Eleni       | Zlotkey    | 10500.00 |
| Clara       | Vishney    | 10500.00 |
| Gerald      | Cambrault  | 11000.00 |
| Ellen       | Abel       | 11000.00 |
| Den         | Raphaely   | 11000.00 |
| Lisa        | Ozer       | 11500.00 |
| Alberto     | Errazuriz  | 12000.00 |
| Shelley     | Higgins    | 12000.00 |
| Nancy       | Greenberg  | 12000.00 |
| Michael     | Hartstein  | 13000.00 |
| Karen       | Partners   | 13500.00 |
| John        | Russell    | 14000.00 |
| Lex         | De Haan    | 17000.00 |
| Neena       | Kochhar    | 17000.00 |
| Steven      | King       | 24000.00 |
+-------------+------------+----------+
61 rows in set (0.02 sec)

MariaDB [csd2204s18]> select first_name, Last_name, salary from employees where salary < any ( select max(salary) from employees where job_id = 'SH_CLERK' order by salary  asc);
+------------+-------------+---------+
| first_name | Last_name   | salary  |
+------------+-------------+---------+
| Alexander  | Khoo        | 3100.00 |
| Shelli     | Baida       | 2900.00 |
| Sigal      | Tobias      | 2800.00 |
| Guy        | Himuro      | 2600.00 |
| Karen      | Colmenares  | 2500.00 |
| Julia      | Nayer       | 3200.00 |
| Irene      | Mikkilineni | 2700.00 |
| James      | Landry      | 2400.00 |
| Steven     | Markle      | 2200.00 |
| Laura      | Bissot      | 3300.00 |
| Mozhe      | Atkinson    | 2800.00 |
| James      | Marlow      | 2500.00 |
| TJ         | Olson       | 2100.00 |
| Jason      | Mallin      | 3300.00 |
| Michael    | Rogers      | 2900.00 |
| Ki         | Gee         | 2400.00 |
| Hazel      | Philtanker  | 2200.00 |
| Renske     | Ladwig      | 3600.00 |
| Stephen    | Stiles      | 3200.00 |
| John       | Seo         | 2700.00 |
| Joshua     | Patel       | 2500.00 |
| Trenna     | Rajs        | 3500.00 |
| Curtis     | Davies      | 3100.00 |
| Randall    | Matos       | 2600.00 |
| Peter      | Vargas      | 2500.00 |
| Winston    | Taylor      | 3200.00 |
| Jean       | Fleaur      | 3100.00 |
| Martha     | Sullivan    | 2500.00 |
| Girard     | Geoni       | 2800.00 |
| Alexis     | Bull        | 4100.00 |
| Julia      | Dellinger   | 3400.00 |
| Anthony    | Cabrio      | 3000.00 |
| Kelly      | Chung       | 3800.00 |
| Jennifer   | Dilly       | 3600.00 |
| Timothy    | Gates       | 2900.00 |
| Randall    | Perkins     | 2500.00 |
| Sarah      | Bell        | 4000.00 |
| Britney    | Everett     | 3900.00 |
| Samuel     | McCain      | 3200.00 |
| Vance      | Jones       | 2800.00 |
| Alana      | Walsh       | 3100.00 |
| Kevin      | Feeney      | 3000.00 |
| Donald     | OConnell    | 2600.00 |
| Douglas    | Grant       | 2600.00 |
+------------+-------------+---------+
44 rows in set (0.00 sec)

MariaDB [csd2204s18]> select first_name, Last_name, salary from employees where salary > ( select max(salary) from employees where manager_id = '');
Empty set (0.00 sec)

MariaDB [csd2204s18]> select first_name, Last_name, salary from employees where salary > ( select Distinct(manager_id) from employees where manager_id !='0');
ERROR 1242 (21000): Subquery returns more than 1 row
MariaDB [csd2204s18]> 
MariaDB [csd2204s18]> select first_name, Last_name, salary from employees where salary not in ( select Distinct(manager_id) from employees where manager_id !='0');
+-------------+-------------+----------+
| first_name  | Last_name   | salary   |
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
107 rows in set (0.02 sec)

MariaDB [csd2204s18]> select first_name, Last_name, salary from employees where employee_is not in ( select Distinct(manager_id) from employees where manager_id !='0');
ERROR 1054 (42S22): Unknown column 'employee_is' in 'IN/ALL/ANY subquery'
MariaDB [csd2204s18]> select first_name, Last_name from employees where employee_id not in (select Distinct(manager_id) from employees where manager_id !='0');
+-------------+-------------+
| first_name  | Last_name   |
+-------------+-------------+
| Bruce       | Ernst       |
| David       | Austin      |
| Valli       | Pataballa   |
| Diana       | Lorentz     |
| Daniel      | Faviet      |
| John        | Chen        |
| Ismael      | Sciarra     |
| Jose Manuel | Urman       |
| Luis        | Popp        |
| Alexander   | Khoo        |
| Shelli      | Baida       |
| Sigal       | Tobias      |
| Guy         | Himuro      |
| Karen       | Colmenares  |
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
| Pat         | Fay         |
| Susan       | Mavris      |
| Hermann     | Baer        |
| William     | Gietz       |
+-------------+-------------+
89 rows in set (0.00 sec)

MariaDB [csd2204s18]> select b.first_name, b.Last_name from employees b where not exists (select 'x' from employees a where a.manager_id = b.employee_id);
+-------------+-------------+
| first_name  | Last_name   |
+-------------+-------------+
| Bruce       | Ernst       |
| David       | Austin      |
| Valli       | Pataballa   |
| Diana       | Lorentz     |
| Daniel      | Faviet      |
| John        | Chen        |
| Ismael      | Sciarra     |
| Jose Manuel | Urman       |
| Luis        | Popp        |
| Alexander   | Khoo        |
| Shelli      | Baida       |
| Sigal       | Tobias      |
| Guy         | Himuro      |
| Karen       | Colmenares  |
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
| Pat         | Fay         |
| Susan       | Mavris      |
| Hermann     | Baer        |
| William     | Gietz       |
+-------------+-------------+
89 rows in set (0.00 sec)

MariaDB [csd2204s18]> select b.employee b.first_name, b.Last_name from employees b where not exists (select 'x' from employees a where a.manager_id = b.employee_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '.first_name, b.Last_name from employees b where not exists (select 'x' from empl' at line 1
MariaDB [csd2204s18]> select b.employee_id, b.first_name, b.Last_name from employees b where employee_id in (select department_name from departments a where a.department_id = b.department_id);
Empty set, 57 warnings (0.02 sec)

MariaDB [csd2204s18]> select b.employee_id, b.first_name, b.Last_name from employees b where department_id =(select department_name from departments a where a.department_id = b.department_id);
Empty set, 106 warnings (0.01 sec)

MariaDB [csd2204s18]> select b.employee_id, b.first_name, b.Last_name,(select department_name from departments) from employees b where b.department_id = a.department_id;
ERROR 1054 (42S22): Unknown column 'a.department_id' in 'where clause'
MariaDB [csd2204s18]> select b.employee_id, b.first_name, b.Last_name,(select department_name from departments a where a.department_id = b.department_id) from employees b;
+-------------+-------------+-------------+-------------------------------------------------------------------------------------+
| employee_id | first_name  | Last_name   | (select department_name from departments a where a.department_id = b.department_id) |
+-------------+-------------+-------------+-------------------------------------------------------------------------------------+
|         100 | Steven      | King        | Executive                                                                           |
|         101 | Neena       | Kochhar     | Executive                                                                           |
|         102 | Lex         | De Haan     | Executive                                                                           |
|         103 | Alexander   | Hunold      | IT                                                                                  |
|         104 | Bruce       | Ernst       | IT                                                                                  |
|         105 | David       | Austin      | IT                                                                                  |
|         106 | Valli       | Pataballa   | IT                                                                                  |
|         107 | Diana       | Lorentz     | IT                                                                                  |
|         108 | Nancy       | Greenberg   | Finance                                                                             |
|         109 | Daniel      | Faviet      | Finance                                                                             |
|         110 | John        | Chen        | Finance                                                                             |
|         111 | Ismael      | Sciarra     | Finance                                                                             |
|         112 | Jose Manuel | Urman       | Finance                                                                             |
|         113 | Luis        | Popp        | Finance                                                                             |
|         114 | Den         | Raphaely    | Purchasing                                                                          |
|         115 | Alexander   | Khoo        | Purchasing                                                                          |
|         116 | Shelli      | Baida       | Purchasing                                                                          |
|         117 | Sigal       | Tobias      | Purchasing                                                                          |
|         118 | Guy         | Himuro      | Purchasing                                                                          |
|         119 | Karen       | Colmenares  | Purchasing                                                                          |
|         120 | Matthew     | Weiss       | Shipping                                                                            |
|         121 | Adam        | Fripp       | Shipping                                                                            |
|         122 | Payam       | Kaufling    | Shipping                                                                            |
|         123 | Shanta      | Vollman     | Shipping                                                                            |
|         124 | Kevin       | Mourgos     | Shipping                                                                            |
|         125 | Julia       | Nayer       | Shipping                                                                            |
|         126 | Irene       | Mikkilineni | Shipping                                                                            |
|         127 | James       | Landry      | Shipping                                                                            |
|         128 | Steven      | Markle      | Shipping                                                                            |
|         129 | Laura       | Bissot      | Shipping                                                                            |
|         130 | Mozhe       | Atkinson    | Shipping                                                                            |
|         131 | James       | Marlow      | Shipping                                                                            |
|         132 | TJ          | Olson       | Shipping                                                                            |
|         133 | Jason       | Mallin      | Shipping                                                                            |
|         134 | Michael     | Rogers      | Shipping                                                                            |
|         135 | Ki          | Gee         | Shipping                                                                            |
|         136 | Hazel       | Philtanker  | Shipping                                                                            |
|         137 | Renske      | Ladwig      | Shipping                                                                            |
|         138 | Stephen     | Stiles      | Shipping                                                                            |
|         139 | John        | Seo         | Shipping                                                                            |
|         140 | Joshua      | Patel       | Shipping                                                                            |
|         141 | Trenna      | Rajs        | Shipping                                                                            |
|         142 | Curtis      | Davies      | Shipping                                                                            |
|         143 | Randall     | Matos       | Shipping                                                                            |
|         144 | Peter       | Vargas      | Shipping                                                                            |
|         145 | John        | Russell     | Sales                                                                               |
|         146 | Karen       | Partners    | Sales                                                                               |
|         147 | Alberto     | Errazuriz   | Sales                                                                               |
|         148 | Gerald      | Cambrault   | Sales                                                                               |
|         149 | Eleni       | Zlotkey     | Sales                                                                               |
|         150 | Peter       | Tucker      | Sales                                                                               |
|         151 | David       | Bernstein   | Sales                                                                               |
|         152 | Peter       | Hall        | Sales                                                                               |
|         153 | Christopher | Olsen       | Sales                                                                               |
|         154 | Nanette     | Cambrault   | Sales                                                                               |
|         155 | Oliver      | Tuvault     | Sales                                                                               |
|         156 | Janette     | King        | Sales                                                                               |
|         157 | Patrick     | Sully       | Sales                                                                               |
|         158 | Allan       | McEwen      | Sales                                                                               |
|         159 | Lindsey     | Smith       | Sales                                                                               |
|         160 | Louise      | Doran       | Sales                                                                               |
|         161 | Sarath      | Sewall      | Sales                                                                               |
|         162 | Clara       | Vishney     | Sales                                                                               |
|         163 | Danielle    | Greene      | Sales                                                                               |
|         164 | Mattea      | Marvins     | Sales                                                                               |
|         165 | David       | Lee         | Sales                                                                               |
|         166 | Sundar      | Ande        | Sales                                                                               |
|         167 | Amit        | Banda       | Sales                                                                               |
|         168 | Lisa        | Ozer        | Sales                                                                               |
|         169 | Harrison    | Bloom       | Sales                                                                               |
|         170 | Tayler      | Fox         | Sales                                                                               |
|         171 | William     | Smith       | Sales                                                                               |
|         172 | Elizabeth   | Bates       | Sales                                                                               |
|         173 | Sundita     | Kumar       | Sales                                                                               |
|         174 | Ellen       | Abel        | Sales                                                                               |
|         175 | Alyssa      | Hutton      | Sales                                                                               |
|         176 | Jonathon    | Taylor      | Sales                                                                               |
|         177 | Jack        | Livingston  | Sales                                                                               |
|         178 | Kimberely   | Grant       | NULL                                                                                |
|         179 | Charles     | Johnson     | Sales                                                                               |
|         180 | Winston     | Taylor      | Shipping                                                                            |
|         181 | Jean        | Fleaur      | Shipping                                                                            |
|         182 | Martha      | Sullivan    | Shipping                                                                            |
|         183 | Girard      | Geoni       | Shipping                                                                            |
|         184 | Nandita     | Sarchand    | Shipping                                                                            |
|         185 | Alexis      | Bull        | Shipping                                                                            |
|         186 | Julia       | Dellinger   | Shipping                                                                            |
|         187 | Anthony     | Cabrio      | Shipping                                                                            |
|         188 | Kelly       | Chung       | Shipping                                                                            |
|         189 | Jennifer    | Dilly       | Shipping                                                                            |
|         190 | Timothy     | Gates       | Shipping                                                                            |
|         191 | Randall     | Perkins     | Shipping                                                                            |
|         192 | Sarah       | Bell        | Shipping                                                                            |
|         193 | Britney     | Everett     | Shipping                                                                            |
|         194 | Samuel      | McCain      | Shipping                                                                            |
|         195 | Vance       | Jones       | Shipping                                                                            |
|         196 | Alana       | Walsh       | Shipping                                                                            |
|         197 | Kevin       | Feeney      | Shipping                                                                            |
|         198 | Donald      | OConnell    | Shipping                                                                            |
|         199 | Douglas     | Grant       | Shipping                                                                            |
|         200 | Jennifer    | Whalen      | Administration                                                                      |
|         201 | Michael     | Hartstein   | Marketing                                                                           |
|         202 | Pat         | Fay         | Marketing                                                                           |
|         203 | Susan       | Mavris      | Human Resources                                                                     |
|         204 | Hermann     | Baer        | Public Relations                                                                    |
|         205 | Shelley     | Higgins     | Accounting                                                                          |
|         206 | William     | Gietz       | Accounting                                                                          |
+-------------+-------------+-------------+-------------------------------------------------------------------------------------+
107 rows in set (0.00 sec)

MariaDB [csd2204s18]> select b.employee_id, b.first_name, b.Last_name,(select department_name from departments a where a.department_id = b.department_id)"department name " from employees b;
+-------------+-------------+-------------+------------------+
| employee_id | first_name  | Last_name   | department name  |
+-------------+-------------+-------------+------------------+
|         100 | Steven      | King        | Executive        |
|         101 | Neena       | Kochhar     | Executive        |
|         102 | Lex         | De Haan     | Executive        |
|         103 | Alexander   | Hunold      | IT               |
|         104 | Bruce       | Ernst       | IT               |
|         105 | David       | Austin      | IT               |
|         106 | Valli       | Pataballa   | IT               |
|         107 | Diana       | Lorentz     | IT               |
|         108 | Nancy       | Greenberg   | Finance          |
|         109 | Daniel      | Faviet      | Finance          |
|         110 | John        | Chen        | Finance          |
|         111 | Ismael      | Sciarra     | Finance          |
|         112 | Jose Manuel | Urman       | Finance          |
|         113 | Luis        | Popp        | Finance          |
|         114 | Den         | Raphaely    | Purchasing       |
|         115 | Alexander   | Khoo        | Purchasing       |
|         116 | Shelli      | Baida       | Purchasing       |
|         117 | Sigal       | Tobias      | Purchasing       |
|         118 | Guy         | Himuro      | Purchasing       |
|         119 | Karen       | Colmenares  | Purchasing       |
|         120 | Matthew     | Weiss       | Shipping         |
|         121 | Adam        | Fripp       | Shipping         |
|         122 | Payam       | Kaufling    | Shipping         |
|         123 | Shanta      | Vollman     | Shipping         |
|         124 | Kevin       | Mourgos     | Shipping         |
|         125 | Julia       | Nayer       | Shipping         |
|         126 | Irene       | Mikkilineni | Shipping         |
|         127 | James       | Landry      | Shipping         |
|         128 | Steven      | Markle      | Shipping         |
|         129 | Laura       | Bissot      | Shipping         |
|         130 | Mozhe       | Atkinson    | Shipping         |
|         131 | James       | Marlow      | Shipping         |
|         132 | TJ          | Olson       | Shipping         |
|         133 | Jason       | Mallin      | Shipping         |
|         134 | Michael     | Rogers      | Shipping         |
|         135 | Ki          | Gee         | Shipping         |
|         136 | Hazel       | Philtanker  | Shipping         |
|         137 | Renske      | Ladwig      | Shipping         |
|         138 | Stephen     | Stiles      | Shipping         |
|         139 | John        | Seo         | Shipping         |
|         140 | Joshua      | Patel       | Shipping         |
|         141 | Trenna      | Rajs        | Shipping         |
|         142 | Curtis      | Davies      | Shipping         |
|         143 | Randall     | Matos       | Shipping         |
|         144 | Peter       | Vargas      | Shipping         |
|         145 | John        | Russell     | Sales            |
|         146 | Karen       | Partners    | Sales            |
|         147 | Alberto     | Errazuriz   | Sales            |
|         148 | Gerald      | Cambrault   | Sales            |
|         149 | Eleni       | Zlotkey     | Sales            |
|         150 | Peter       | Tucker      | Sales            |
|         151 | David       | Bernstein   | Sales            |
|         152 | Peter       | Hall        | Sales            |
|         153 | Christopher | Olsen       | Sales            |
|         154 | Nanette     | Cambrault   | Sales            |
|         155 | Oliver      | Tuvault     | Sales            |
|         156 | Janette     | King        | Sales            |
|         157 | Patrick     | Sully       | Sales            |
|         158 | Allan       | McEwen      | Sales            |
|         159 | Lindsey     | Smith       | Sales            |
|         160 | Louise      | Doran       | Sales            |
|         161 | Sarath      | Sewall      | Sales            |
|         162 | Clara       | Vishney     | Sales            |
|         163 | Danielle    | Greene      | Sales            |
|         164 | Mattea      | Marvins     | Sales            |
|         165 | David       | Lee         | Sales            |
|         166 | Sundar      | Ande        | Sales            |
|         167 | Amit        | Banda       | Sales            |
|         168 | Lisa        | Ozer        | Sales            |
|         169 | Harrison    | Bloom       | Sales            |
|         170 | Tayler      | Fox         | Sales            |
|         171 | William     | Smith       | Sales            |
|         172 | Elizabeth   | Bates       | Sales            |
|         173 | Sundita     | Kumar       | Sales            |
|         174 | Ellen       | Abel        | Sales            |
|         175 | Alyssa      | Hutton      | Sales            |
|         176 | Jonathon    | Taylor      | Sales            |
|         177 | Jack        | Livingston  | Sales            |
|         178 | Kimberely   | Grant       | NULL             |
|         179 | Charles     | Johnson     | Sales            |
|         180 | Winston     | Taylor      | Shipping         |
|         181 | Jean        | Fleaur      | Shipping         |
|         182 | Martha      | Sullivan    | Shipping         |
|         183 | Girard      | Geoni       | Shipping         |
|         184 | Nandita     | Sarchand    | Shipping         |
|         185 | Alexis      | Bull        | Shipping         |
|         186 | Julia       | Dellinger   | Shipping         |
|         187 | Anthony     | Cabrio      | Shipping         |
|         188 | Kelly       | Chung       | Shipping         |
|         189 | Jennifer    | Dilly       | Shipping         |
|         190 | Timothy     | Gates       | Shipping         |
|         191 | Randall     | Perkins     | Shipping         |
|         192 | Sarah       | Bell        | Shipping         |
|         193 | Britney     | Everett     | Shipping         |
|         194 | Samuel      | McCain      | Shipping         |
|         195 | Vance       | Jones       | Shipping         |
|         196 | Alana       | Walsh       | Shipping         |
|         197 | Kevin       | Feeney      | Shipping         |
|         198 | Donald      | OConnell    | Shipping         |
|         199 | Douglas     | Grant       | Shipping         |
|         200 | Jennifer    | Whalen      | Administration   |
|         201 | Michael     | Hartstein   | Marketing        |
|         202 | Pat         | Fay         | Marketing        |
|         203 | Susan       | Mavris      | Human Resources  |
|         204 | Hermann     | Baer        | Public Relations |
|         205 | Shelley     | Higgins     | Accounting       |
|         206 | William     | Gietz       | Accounting       |
+-------------+-------------+-------------+------------------+
107 rows in set (0.00 sec)

MariaDB [csd2204s18]> select avy(salary),department_id from employees group by derpartment_id;
ERROR 1305 (42000): FUNCTION csd2204s18.avy does not exist
MariaDB [csd2204s18]> select avg(salary),department_id from employees group by derpartment_id;
ERROR 1054 (42S22): Unknown column 'derpartment_id' in 'group statement'
MariaDB [csd2204s18]> select avg(salary),department_id from employees group by department_id;
+--------------+---------------+
| avg(salary)  | department_id |
+--------------+---------------+
|  7000.000000 |             0 |
|  4400.000000 |            10 |
|  9500.000000 |            20 |
|  4150.000000 |            30 |
|  6500.000000 |            40 |
|  3475.555556 |            50 |
|  5760.000000 |            60 |
| 10000.000000 |            70 |
|  8955.882353 |            80 |
| 19333.333333 |            90 |
|  8600.000000 |           100 |
| 10150.000000 |           110 |
+--------------+---------------+
12 rows in set (0.00 sec)

MariaDB [csd2204s18]> select first_name, last_name, salary from employeea e where salary >(select avg(salary) from employees group by department_id having department_id = e.department_id);
ERROR 1146 (42S02): Table 'csd2204s18.employeea' doesn't exist
MariaDB [csd2204s18]> select first_name, last_name, salary from employees e where salary >(select avg(salary) from employees group by department_id having department_id = e.department_id);
+------------+-----------+----------+
| first_name | last_name | salary   |
+------------+-----------+----------+
| Steven     | King      | 24000.00 |
| Alexander  | Hunold    |  9000.00 |
| Bruce      | Ernst     |  6000.00 |
| Nancy      | Greenberg | 12000.00 |
| Daniel     | Faviet    |  9000.00 |
| Den        | Raphaely  | 11000.00 |
| Matthew    | Weiss     |  8000.00 |
| Adam       | Fripp     |  8200.00 |
| Payam      | Kaufling  |  7900.00 |
| Shanta     | Vollman   |  6500.00 |
| Kevin      | Mourgos   |  5800.00 |
| Renske     | Ladwig    |  3600.00 |
| Trenna     | Rajs      |  3500.00 |
| John       | Russell   | 14000.00 |
| Karen      | Partners  | 13500.00 |
| Alberto    | Errazuriz | 12000.00 |
| Gerald     | Cambrault | 11000.00 |
| Eleni      | Zlotkey   | 10500.00 |
| Peter      | Tucker    | 10000.00 |
| David      | Bernstein |  9500.00 |
| Peter      | Hall      |  9000.00 |
| Janette    | King      | 10000.00 |
| Patrick    | Sully     |  9500.00 |
| Allan      | McEwen    |  9000.00 |
| Clara      | Vishney   | 10500.00 |
| Danielle   | Greene    |  9500.00 |
| Lisa       | Ozer      | 11500.00 |
| Harrison   | Bloom     | 10000.00 |
| Tayler     | Fox       |  9600.00 |
| Ellen      | Abel      | 11000.00 |
| Nandita    | Sarchand  |  4200.00 |
| Alexis     | Bull      |  4100.00 |
| Kelly      | Chung     |  3800.00 |
| Jennifer   | Dilly     |  3600.00 |
| Sarah      | Bell      |  4000.00 |
| Britney    | Everett   |  3900.00 |
| Michael    | Hartstein | 13000.00 |
| Shelley    | Higgins   | 12000.00 |
+------------+-----------+----------+
38 rows in set (0.00 sec)

MariaDB [csd2204s18]> select distinct(salary) from employees e1 where 5 = (select count(distinct(salary)) from employees e2 where e2.salary >=e1.salary);
+----------+
| salary   |
+----------+
| 13000.00 |
+----------+
1 row in set (0.01 sec)

MariaDB [csd2204s18]> select distinct(salary) from employees e1 where 3 = (select count(distinct(salary)) from employees e2 where e2.salary >=e1.salary);
+----------+
| salary   |
+----------+
| 14000.00 |
+----------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> select distinct(salary) from employees e1 where 3 = (select count(distinct(salary)) from employees e2 where e2.salary <=e1.salary);
+---------+
| salary  |
+---------+
| 2400.00 |
+---------+
1 row in set (0.01 sec)

MariaDB [csd2204s18]> select * from (select * from employees order by employee_id desc limit 10) order by employee_id asc;
ERROR 1248 (42000): Every derived table must have its own alias
MariaDB [csd2204s18]> select * from (select * from employees order by employee_id desc limit 10)e1 order by employee_id asc;
+-------------+------------+-----------+----------+--------------+------------+------------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME | LAST_NAME | EMAIL    | PHONE_NUMBER | HIRE_DATE  | JOB_ID     | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+------------+-----------+----------+--------------+------------+------------+----------+----------------+------------+---------------+
|         197 | Kevin      | Feeney    | KFEENEY  | 650.507.9822 | 1987-09-22 | SH_CLERK   |  3000.00 |           0.00 |        124 |            50 |
|         198 | Donald     | OConnell  | DOCONNEL | 650.507.9833 | 1987-09-23 | SH_CLERK   |  2600.00 |           0.00 |        124 |            50 |
|         199 | Douglas    | Grant     | DGRANT   | 650.507.9844 | 1987-09-24 | SH_CLERK   |  2600.00 |           0.00 |        124 |            50 |
|         200 | Jennifer   | Whalen    | JWHALEN  | 515.123.4444 | 1987-09-25 | AD_ASST    |  4400.00 |           0.00 |        101 |            10 |
|         201 | Michael    | Hartstein | MHARTSTE | 515.123.5555 | 1987-09-26 | MK_MAN     | 13000.00 |           0.00 |        100 |            20 |
|         202 | Pat        | Fay       | PFAY     | 603.123.6666 | 1987-09-27 | MK_REP     |  6000.00 |           0.00 |        201 |            20 |
|         203 | Susan      | Mavris    | SMAVRIS  | 515.123.7777 | 1987-09-28 | HR_REP     |  6500.00 |           0.00 |        101 |            40 |
|         204 | Hermann    | Baer      | HBAER    | 515.123.8888 | 1987-09-29 | PR_REP     | 10000.00 |           0.00 |        101 |            70 |
|         205 | Shelley    | Higgins   | SHIGGINS | 515.123.8080 | 1987-09-30 | AC_MGR     | 12000.00 |           0.00 |        101 |           110 |
|         206 | William    | Gietz     | WGIETZ   | 515.123.8181 | 1987-10-01 | AC_ACCOUNT |  8300.00 |           0.00 |        205 |           110 |
+-------------+------------+-----------+----------+--------------+------------+------------+----------+----------------+------------+---------------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> select department_id, drpartment_name from departments where department
    -> ;
ERROR 1054 (42S22): Unknown column 'drpartment_name' in 'field list'
MariaDB [csd2204s18]> select department_id, drpartment_name from departments where department_id not in (select distinct(department_id) from employees);
ERROR 1054 (42S22): Unknown column 'drpartment_name' in 'field list'
MariaDB [csd2204s18]> select department_id, department_name from departments where department_id not in (select distinct(department_id) from employees);
+---------------+----------------------+
| department_id | department_name      |
+---------------+----------------------+
|           120 | Treasury             |
|           130 | Corporate Tax        |
|           140 | Control And Credit   |
|           150 | Shareholder Services |
|           160 | Benefits             |
|           170 | Manufacturing        |
|           180 | Construction         |
|           190 | Contracting          |
|           200 | Operations           |
|           210 | IT Support           |
|           220 | NOC                  |
|           230 | IT Helpdesk          |
|           240 | Government Sales     |
|           250 | Retail Sales         |
|           260 | Recruiting           |
|           270 | Payroll              |
+---------------+----------------------+
16 rows in set (0.00 sec)

