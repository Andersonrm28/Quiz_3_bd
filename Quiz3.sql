-- creacion de tablespace
CREATE TABLESPACE quiz
	DATAFILE 'quiz1.dbf' SIZE 15m,
             'quiz2.dbf' SIZE 15m,
             'quiz3.dbf' SIZE 15m;

-- creacion de profile
CREATE PROFILE student LIMIT 
IDLE_TIME              20;
  
-- creacion de usuario y permisos usuario_1
CREATE USER usuario_1
IDENTIFIED BY usuario_1
DEFAULT TABLESPACE quiz;
ALTER USER usuario_1 PROFILE student;
GRANT CREATE SESSION TO usuario_1;
GRANT CREATE TABLE TO usuario_1;

-- creacion de usuario y permisos usuario_2
CREATE USER usuario_2
IDENTIFIED BY usuario_2
DEFAULT TABLESPACE quiz;
ALTER USER usuario_2 PROFILE student;

-- crear tabla
create table attacks (
	id INT,
	url VARCHAR(2048),
	ip_address VARCHAR(20),
	number_of_attacks INT,
	time_of_last_attack TIMESTAMP
);

-- Consultas
-- 1. Count the urls which have been attacked and have the protocol 'https'
select count(*)
from attacks
where number_of_attacks > 0 and url like 'https%';

-- 2. List the records where the URL attacked matches with google (it does not matter if it is google.co.jp, google.es, google.pt, etc) order by number of attacks ascendent
select *
from attacks
where url like '%google%'
order by number_of_attacks asc

-- 3. List the ip addresses and the time of the last attack if the attack has been produced the last year (2017) (Hint: https://stackoverflow.com/a/30071091)
