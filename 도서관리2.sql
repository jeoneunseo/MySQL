DROP DATABASE IF EXISTS 도서관리_DB;
CREATE DATABASE IF NOT EXISTS 도서관리_DB;
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

CREATE TABLE 주문회원(
	주문번호 VARCHAR(11) NOT NULL,
    주문날짜 DATE,
    회원번호 VARCHAR(5) NOT NULL,
    PRIMARY KEY (주문번호),
    FOREIGN KEY(회원번호) REFERENCES 회원정보(회원번호)
);

CREATE TABLE 도서정보(
	도서시리얼넘버 VARCHAR(8) NOT NULL,
    도서명 VARCHAR(8) NOT NULL UNIQUE,
    PRIMARY KEY (도서시리얼넘버)
);

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







