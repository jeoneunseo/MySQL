-- -------------------------------------------------------------
--                                      병원업무관리 프로젝트
-- -------------------------------------------------------------

-- -------------------------------
--                   DB 초기화
-- -------------------------------
DROP DATABASE IF EXISTS 병원업무관리_DB;
DROP USER IF EXISTS pam7461@localhost; 
CREATE DATABASE 병원업무관리_DB;
CREATE USER pam7461@localhost IDENTIFIED WITH mysql_native_password by 'qwer1234!;' ;
GRANT ALL PRIVILEGES ON 병원업무관리_DB.* TO pam7461@localhost WITH GRANT OPTION;

USE 병원업무관리_DB;


-- -------------------------------
--               의사 테이블 정의
-- -------------------------------
CREATE TABLE 의사(
	의사ID VARCHAR(10) PRIMARY KEY NOT NULL UNIQUE,
    담당진료과목 VARCHAR(20) NOT NULL,
    성명 VARCHAR(20) NOT NULL,
    성별 VARCHAR(10) NOT NULL,
    연락처 VARCHAR(20) NOT NULL UNIQUE,
    이메일 VARCHAR(20) UNIQUE,
    직급 VARCHAR(10)
);

-- -------------------------------
--             간호사 테이블 정의
-- -------------------------------
CREATE TABLE 간호사 (
	간호사ID VARCHAR(10) PRIMARY KEY NOT NULL UNIQUE,
    담당업무 VARCHAR(40) NOT NULL,
    성명 VARCHAR(20) NOT NULL UNIQUE,
    성별 VARCHAR(10) NOT NULL,
    이메일 VARCHAR(20) NOT NULL,
    직급 VARCHAR(10)  
);

-- -------------------------------
--               환자 테이블 정의
-- -------------------------------
CREATE TABLE 환자 (
	환자ID VARCHAR(10) PRIMARY KEY NOT NULL UNIQUE,
    환자성명 VARCHAR(20) NOT NULL,
    주민번호 VARCHAR(14) NOT NULL UNIQUE,
    성별 VARCHAR(10) NOT NULL,
    주소 VARCHAR(50) NOT NULL,
    연락처 VARCHAR(20) NOT NULL,
    이메일 VARCHAR(20) UNIQUE,
    직업 VARCHAR(10)NOT NULL,
    의사ID VARCHAR(10),
    간호사ID VARCHAR(10),
	FOREIGN KEY(의사ID) REFERENCES 의사(의사ID),
    FOREIGN KEY(간호사ID) REFERENCES 간호사(간호사ID)
);

-- -------------------------------
--               진료 테이블 정의
-- -------------------------------
CREATE TABLE 진료 (
	진료ID INT NOT NULL,
    의사ID VARCHAR(10) NOT NULL,
    환자ID VARCHAR(10) NOT NULL,
    진료내용 VARCHAR(100) NOT NULL,
    진료날짜 DATE NOT NULL,
    PRIMARY KEY(진료ID,의사ID,환자ID),
    FOREIGN KEY(의사ID) REFERENCES 의사(의사ID),
    FOREIGN KEY(환자ID) REFERENCES 환자(환자ID)
);




-- -------------------------------
--                의사 자료 삽입
-- -------------------------------
-- 	의사ID VARCHAR(10) PRIMARY KEY NOT NULL UNIQUE,
--     담당진료과목 VARCHAR(20) NOT NULL,
--     성명 VARCHAR(20) NOT NULL,
--     성별 VARCHAR(10) NOT NULL,
--     연락처 VARCHAR(20) NOT NULL UNIQUE,
--     이메일 VARCHAR(20) UNIQUE,
--     직급 VARCHAR(10)
INSERT INTO 의사 VALUES('1001','흉부외과','홍길동','남','010-1111-1111','pam7461@naver.com','과장');
INSERT INTO 의사 VALUES('1002','일반외과','이몽룡','남','010-2222-2222','pam7462@naver.com','진료부장');
INSERT INTO 의사 VALUES('1003','호흡기외과','성춘향','여','010-3333-3333','pam7463@naver.com','부원장');
INSERT INTO 의사 VALUES('1004','소화기외과','월매','여','010-4444-4444','pam7464@naver.com','외래교수');
INSERT INTO 의사 VALUES('1005','소아청소년과','변사또','남','010-5555-5555','pam7465@naver.com','원장');

-- -------------------------------
--               간호사 자료 삽입
-- -------------------------------
-- 	간호사ID VARCHAR(10) PRIMARY KEY NOT NULL UNIQUE,
--     담당업무 VARCHAR(40) NOT NULL,
--     성명 VARCHAR(20) NOT NULL UNIQUE,
--     성별 VARCHAR(10) NOT NULL,
--     이메일 VARCHAR(20) NOT NULL,
--     직급 VARCHAR(10)  
INSERT INTO 간호사 VALUES('2001','외래','홍길순','여','ppk001@naver.com','사원');
INSERT INTO 간호사 VALUES('2002','외래','이몽철','남','ppk002@naver.com','사원');
INSERT INTO 간호사 VALUES('2003','외래','성춘왕','여','ppk003@naver.com','계약직');
INSERT INTO 간호사 VALUES('2004','병실','월병','여','ppk004@naver.com','대리');
INSERT INTO 간호사 VALUES('2005','병실','변사순','여','ppk005@naver.com','사원');
INSERT INTO 간호사 VALUES('2006','응급','강감찬','남','ppk006@naver.com','파견');

-- -------------------------------
--                환자 자료 삽입
-- -------------------------------
-- 	환자ID VARCHAR(10) PRIMARY KEY NOT NULL UNIQUE,
--     환자성명 VARCHAR(20) NOT NULL,
--     주민번호 VARCHAR(14) NOT NULL UNIQUE,
--     성별 VARCHAR(10) NOT NULL,
--     주소 VARCHAR(50) NOT NULL,
--     연락처 VARCHAR(20) NOT NULL,
--     이메일 VARCHAR(20) UNIQUE,
--     직업 VARCHAR(10)NOT NULL,
--     의사ID VARCHAR(10),
--     간호사ID VARCHAR(10),
INSERT INTO 환자 VALUES('3001','이승만','090909-1111111','남','서울시','011-111-1111',NULL,'전직대통령','1001','2001');
INSERT INTO 환자 VALUES('3002','윤보선','090909-2222222','남','서울시','011-222-2222',NULL,'전직대통령','1002','2002');
INSERT INTO 환자 VALUES('3003','박정희','090909-3333333','남','구미','011-333-3333',NULL,'전직대통령','1003','2003');
INSERT INTO 환자 VALUES('3004','최규하','090909-4444444','남','서울시','011-444-4444',NULL,'전직대통령','1004','2004');
INSERT INTO 환자 VALUES('3005','전두환','090909-5555555','남','고령','011-555-5555',NULL,'전직대통령','1005','2005');
INSERT INTO 환자 VALUES('3006','노태우','090909-6666666','남','서울시','011-666-6666',NULL,'전직대통령','1001','2006');
INSERT INTO 환자 VALUES('3007','김영삼','090909-7777777','남','마산','011-777-7777',NULL,'전직대통령','1002','2001');
INSERT INTO 환자 VALUES('3008','김대중','090909-8888888','남','광주','011-888-8888',NULL,'전직대통령','1003','2002');
INSERT INTO 환자 VALUES('3009','노무현','090909-9999999','남','김해','011-999-9999',NULL,'전직대통령','1004','2003');
INSERT INTO 환자 VALUES('3010','이명박','090909-0000000','남','일본','011-000-0000',NULL,'전직대통령','1005','2004');


-- -------------------------------
--                진료 자료 삽입
-- -------------------------------
-- 	진료ID INT NOT NULL,
--     의사ID VARCHAR(10) NOT NULL,
--     환자ID VARCHAR(10) NOT NULL,
--     진료내용 VARCHAR(100) NOT NULL,
--     진료날짜 DATE NOT NULL,
INSERT INTO 진료 VALUES(2201001,'1001','3010','감기몸살','2022-01-01');
INSERT INTO 진료 VALUES(2201002,'1003','3009','코로나','2022-01-01');
INSERT INTO 진료 VALUES(2201003,'1005','3008','소화불량','2022-01-01');
INSERT INTO 진료 VALUES(2201004,'1004','3010','감기몸살','2022-01-01');
INSERT INTO 진료 VALUES(2201005,'1002','3001','사마귀','2022-01-01');
INSERT INTO 진료 VALUES(2201006,'1004','3002','여드름','2022-01-01');
INSERT INTO 진료 VALUES(2201007,'1001','3010','소화불량','2022-01-01');
INSERT INTO 진료 VALUES(2201008,'1002','3005','감기몸살','2022-01-01');
INSERT INTO 진료 VALUES(2201009,'1004','3003','복통','2022-01-01');
INSERT INTO 진료 VALUES(2201010,'1005','3004','','2022-01-03');
INSERT INTO 진료 VALUES(2201011,'1002','3006','감기몸살','2022-01-03');


desc 의사;
desc 간호사;
desc 환자;
desc 진료;

SELECT 의사.성명,환자.환자성명,진료.진료날짜,진료.진료내용
FROM 의사 JOIN 진료 ON 의사.의사ID=진료.의사ID JOIN ON 진료.환자ID=환자.환자ID;













