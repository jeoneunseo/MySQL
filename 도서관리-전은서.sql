-- -------------------------------------
--                           권한설정
-- -------------------------------------
DROP DATABASE IF EXISTS 도서관리_DB;
DROP USER IF EXISTS pam7462@localhost;
CREATE DATABASE IF NOT EXISTS 도서관리_DB;
CREATE USER pam7462@localhost IDENTIFIED WITH mysql_native_password by 'qwer1234!';
GRANT ALL PRIVILEGES ON 도서관리_db.* TO pam7462@localhost WITH GRANT OPTION;
SHOW DATABASES;

USE 도서관리_DB;
SHOW TABLES;

CREATE TABLE 회원정보(
	회원번호 VARCHAR(5) NOT NULL,
    회원이름 VARCHAR(20) NOT NULL,
    주소 VARCHAR(50) NOT NULL,
    전화번호 VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (회원번호)
);
DESC 회원정보;

CREATE TABLE 주문회원(
	주문번호 VARCHAR(11) NOT NULL,
    주문날짜 DATE,
    회원번호 VARCHAR(5) NOT NULL,
    PRIMARY KEY (주문번호),
    FOREIGN KEY(회원번호) REFERENCES 회원정보(회원번호)
);
DESC 주문회원;

CREATE TABLE 도서정보(
	도서시리얼넘버 VARCHAR(8) NOT NULL,
    도서명 VARCHAR(8) NOT NULL UNIQUE,
    PRIMARY KEY (도서시리얼넘버)
);
DESC 도서정보;

CREATE TABLE 판매정보(
	주문번호 VARCHAR(11) NOT NULL,
    회원번호 VARCHAR(5) NOT NULL,
    도서시리얼넘버 VARCHAR(8) NOT NULL,
    수량 INT,
    단가 INT,
    PRIMARY KEY (주문번호),
	FOREIGN KEY(주문번호) REFERENCES 주문회원(주문번호),
    FOREIGN KEY(회원번호) REFERENCES 회원정보(회원번호),
    FOREIGN KEY(도서시리얼넘버) REFERENCES 도서정보(도서시리얼넘버)
);
DESC 판매정보;
SHOW TABLES;



-- -------------------------------------
--                              삽입
-- -------------------------------------
INSERT INTO 회원정보 VALUES('10001','홍길동','경기도','010-1111-1111');
INSERT INTO 회원정보 VALUES('10002','이몽룡','인천','010-2222-2222');
INSERT INTO 회원정보 VALUES('10003','성춘향','서울','010-3333-3333');
INSERT INTO 회원정보 VALUES('10004','월매','서울','010-4444-4444');
INSERT INTO 회원정보 VALUES('10005','변사또','부산','010-5555-5555');
SELECT * FROM 회원정보;


INSERT INTO 도서정보 VALUES('12345678','HTML1');
INSERT INTO 도서정보 VALUES('48491968','HTML2');
INSERT INTO 도서정보 VALUES('19849844','HTML3');
INSERT INTO 도서정보 VALUES('11115154','HTML4');
INSERT INTO 도서정보 VALUES('64598408','HTML5');
INSERT INTO 도서정보 VALUES('19849546','HTML6');
INSERT INTO 도서정보 VALUES('27256363','HTML7');
INSERT INTO 도서정보 VALUES('56652645','HTML8');
INSERT INTO 도서정보 VALUES('26236526','HTML9');
INSERT INTO 도서정보 VALUES('86867666','HTML10');
SELECT * FROM 도서정보;


INSERT INTO 주문회원 VALUES('20220301001','2022-03-01','10003');
INSERT INTO 주문회원 VALUES('20220301002','2022-03-01','10005');
INSERT INTO 주문회원 VALUES('20220301003','2022-03-01','10001');
INSERT INTO 주문회원 VALUES('20220301004','2022-03-01','10002');
INSERT INTO 주문회원 VALUES('20220301005','2022-03-01','10003');
INSERT INTO 주문회원 VALUES('20220302001','2022-03-02','10002');
INSERT INTO 주문회원 VALUES('20220302002','2022-03-02','10004');
INSERT INTO 주문회원 VALUES('20220302003','2022-03-02','10001');
SELECT * FROM 주문회원;



INSERT INTO 판매정보 VALUES('20220301002','10002','12345678',5,25000);
INSERT INTO 판매정보 VALUES('20220301001','10003','15151515',2,20000);
INSERT INTO 판매정보 VALUES('20220301003','10005','77575675',1,23000);
INSERT INTO 판매정보 VALUES('20220301001','10005','83686638',1,26000);
INSERT INTO 판매정보 VALUES('20220301003','10002','37363646',2,22000);
SELECT * FROM 판매정보;




-- -------------------------------------
--                          자료조회
-- -------------------------------------
SELECT * FROM 회원정보 JOIN 판매정보 ON 회원정보.회원번호 = 판매정보.회원번호;


-- -------------------------------------
--                            변경
-- ------------------------------------- 
SELECT * FROM 판매정보;
UPDATE 판매정보 SET 단가=30000 WHERE 도서시리얼넘버='12345678';
SELECT * FROM 판매정보;


-- -------------------------------------
--                            삭제
-- -------------------------------------
SELECT * FROM 판매정보;
DELETE FROM 판매정보 WHERE 수량 = 0 OR 단가 = 0 OR 수량 IS NULL OR 단가 IS NULL;
SELECT * FROM 판매정보;







