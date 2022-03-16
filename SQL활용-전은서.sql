-- 1번
DROP DATABASE IF EXISTS member_db; -- 기존의 db 삭제
DROP USER IF EXISTS member_db@localhost; -- 기존의 user 삭제

CREATE DATABASE member_db; -- member_db 생성
CREATE USER member_db@localhost IDENTIFIED WITH mysql_native_password BY 'member_db'; -- 계정 생성

GRANT ALL PRIVILEGES ON member_db.* TO member_db@localhost WITH GRANT OPTION;
USE member_db;


-- 2번 login_info 테이블 생성
CREATE TABLE login_info(
	member_num INT PRIMARY KEY AUTO_INCREMENT, -- 정수형의 자동입력되는 기본키
    member_id VARCHAR(18) NOT NULL UNIQUE, -- 중복되지 않은 필수 문자열
    member_pass VARCHAR(18) NOT NULL -- 필수 문자열
);

-- 3번 자료 입력
INSERT INTO login_info(member_id,member_pass) 
			VALUES('pam7461','123456'); -- 아이디가 중복되지 않는 자료 입력
INSERT INTO login_info(member_id,member_pass) 
			VALUES('pam7462','123456'); -- member_num은 자동입력
INSERT INTO login_info(member_id,member_pass) 
			VALUES('pam7463','123456');
INSERT INTO login_info(member_id,member_pass) 
			VALUES('pam7464','123456');
INSERT INTO login_info(member_id,member_pass) 
			VALUES('pam7465','123456');
INSERT INTO login_info(member_id,member_pass)
			VALUES('pam7466','123456');
INSERT INTO login_info(member_id,member_pass) 
			VALUES('pam7467','123456');
INSERT INTO login_info(member_id,member_pass) 
			VALUES('pam7468','123456');
INSERT INTO login_info(member_id,member_pass) 
			VALUES('pam7469','123456');
INSERT INTO login_info(member_id,member_pass) 
			VALUES('pam7470','123456');



-- 4번 데이터 선택(필드명을 변경하여 '회원번호' 내림차순 정렬로 출력)
SELECT member_num as 회원번호, member_id as 회원아이디, member_pass as 패스워드
FROM login_info
ORDER BY 회원번호 DESC;



-- 5번 notice 테이블 생성
CREATE TABLE notice(
	notice_num INT PRIMARY KEY AUTO_INCREMENT,
    notice_tit VARCHAR(40) NOT NULL,
    notice_txt VARCHAR(1000),
    notice_date DATETIME DEFAULT CURRENT_TIMESTAMP, -- 자동입력되는 날짜
    user_name VARCHAR(30),
    user_num INT NOT NULL
);

-- 6번 자료입력
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항1','동해물과 백두산이 마르고1','홍길동',1);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항2','동해물과 백두산이 마르고2','이몽룡',2);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항3','동해물과 백두산이 마르고3','성춘향',3);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항4','동해물과 백두산이 마르고4','김사또',4);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항5','동해물과 백두산이 마르고5','홍길순',5);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항6','동해물과 백두산이 마르고6','이승만',6);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항7','동해물과 백두산이 마르고7','박정희',7);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항8','동해물과 백두산이 마르고8','이순신',8);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항9','동해물과 백두산이 마르고9','김길동',9);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항10','동해물과 백두산이 마르고10','김사부',10);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항11','동해물과 백두산이 마르고11','박혁거세',11);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항12','동해물과 백두산이 마르고12','박목월',12);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항13','동해물과 백두산이 마르고13','정주영',13);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항14','동해물과 백두산이 마르고14','정몽주',14);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항15','동해물과 백두산이 마르고15','최치원',15);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항16','동해물과 백두산이 마르고16','조치원',16);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항17','동해물과 백두산이 마르고17','가가린',17);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항18','동해물과 백두산이 마르고18','윤봉길',18);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항19','동해물과 백두산이 마르고19','이명박',19);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항20','동해물과 백두산이 마르고20','박근혜',20);


-- 7번 데이터 선택(필드명을 변경하여 '작성일' 오름차순, '일련번호' 내림차순 정렬 출력)
SELECT notice_num as 일련번호, notice_tit as 제목, notice_txt as 내용, notice_date as 작성일, user_name as 작성자, user_num as 회원번호
FROM notice
ORDER BY 작성일 asc,일련번호 desc;

-- 8번 함수, 조건 사용(성 별로 인원수)
SELECT SUBSTR(user_name,1,1) as 성,CONCAT(count(*),'명') as 인원수
FROM notice
/* WHERE SUBSTR(user_name,1,1)='조'*/
GROUP BY SUBSTR(user_name,1,1);

-- 9번 자료삭제(제목이 없는 자료 삭제)
DELETE FROM notice
WHERE notice_tit IS NULL;


-- 10번 자료변경
UPDATE login_info
SET member_pass='qwer1234'
WHERE member_num=5;

-- 11번 인덱스 설정
CREATE INDEX idx_notice ON notice(notice_tit,user_name);

-- 12번 인덱스 검증
SELECT * FROM notice WHERE user_num>=5; 
SELECT * FROM notice WHERE notice_tit='문의사항5';
SELECT * FROM notice WHERE user_name='이순신'; 

-- 13번 뷰 생성
CREATE VIEW my_view(회원아이디,제목,내용,작성일,작성자)
AS SELECT
	notice.user_num,
	notice.notice_tit,
	notice.notice_txt,
	notice.notice_date,
	notice.user_name
FROM notice JOIN login_info ON notice.user_num = login_info.member_num;
SELECT * FROM my_view;

-- 14번 뷰2 생성
CREATE VIEW my_view2(제목,작성일,작성자,회원아이디)
AS SELECT 제목,작성일,작성자,회원아이디
FROM my_view;
SELECT * FROM my_view2;

-- 15번 DB,USER삭제
DROP DATABASE IF EXISTS member_db; -- 기존의 db 삭제
DROP USER IF EXISTS member_db@localhost; -- 기존의 user 삭제





