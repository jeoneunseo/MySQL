drop database if exists school_db;
drop user if exists school_db@localhost;
create database school_db;
create user school_db@localhost identified with mysql_native_password by 'school_db';
grant all privileges on school_db.* to school_db@localhost with grant option;
use school_db;

create table 학생(
   학번 varchar(8),
    성명 varchar(20),
    성별 enum('남','여'),
    생년월일 date,
    주소 varchar(50),
    전화번호 varchar(20), 
    학과 varchar(20),
    수강과목1 varchar(20),
    수강과목2 varchar(20),
    수강과목3 varchar(20),
    수강과목4 varchar(20),
    수강과목5 varchar(20)    
);

insert into 학생 values('20220101','전은서','여','2022-03-15','인천 동구','010-1111-1111','컴공','국어','영어','윤리','음악','체육');
insert into 학생 values('20220102','오유정','여','2022-03-16','서울 강남구','010-2222-2222','컴공','미술','윤리','수학','음악','미술');
insert into 학생 values('20220103','전인규','남','2022-03-17','경기도 부천시','010-3333-3333','컴공','국어','영어','미술','음악','과학');
insert into 학생 values('20220104','김소연','여','2022-03-18','경기도 안성시','010-4444-4444','컴공','국사','영어','수학','사회','체육');
insert into 학생 values('20220105','정지원','남','2022-03-19','인천 서구','010-5555-5555','컴공','국어','과학','미술','음악','체육');

delete from 학생 where 성명='전은서';

select * from 학생; 





