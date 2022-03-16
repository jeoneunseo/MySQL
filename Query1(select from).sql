SELECT * FROM book;
SELECT bookid, bookname, price FROM book;

-- 북 테이블에서 PRICE가 10000이상인 BOOKNAME을 출력하라-- 
SELECT bookname FROM book;
SELECT bookname FROM book WHERE price >= 10000;

-- 북 테이블에서 price가 10000~20000사이인 bookname을 출력하라-- 
SELECT bookname FROM book WHERE price >= 10000 AND price <=20000;
SELECT bookname FROM book WHERE price BETWEEN 10000 AND 20000;

-- 북 테이블에서 bookname이 '축구'로 시작하는 모든 자료를 출력하라-- 
SELECT * FROM book
WHERE bookname LIKE '축구%';

-- 북 테이블에서 bookname이 '이야기'로 끝나는 모든 자료를 출력하라-- 
SELECT *
FROM book
WHERE bookname LIKE '%이야기';
-- 북 테이블에서 bookname이 '축구'로 시작하거나 '이야기'로 끝나는 모든 자료를 출력하라-- 
SELECT *
FROM book
WHERE bookname LIKE '축구%' OR bookname LIKE '%이야기';

-- 북 테이블에서 publisher가 '대한미디어' 이거나 '굿스포츠'인 모든 자료를 출력하라-- 
SELECT *
FROM book
WHERE publisher = '대한미디어' OR publisher = '굿스포츠';

SELECT *
FROM book
WHERE publisher IN('대한미디어', '굿스포츠');

-- 북 테이블에서 publisher가 '대한미디어'가 아니고 '굿스포츠'도 아닌 모든 자료를 출력하라-- 
SELECT *
FROM book
WHERE publisher <> '대한미디어' AND publisher <> '굿스포츠';

SELECT *
FROM book
WHERE publisher NOT IN('대한미디어', '굿스포츠');

-- 북 테이블에서 publisher가 NULL인 모든 자료를 출력하라-- 
SELECT * FROM book WHERE publisher IS NULL;
-- 북 테이블에서 publisher가 NULL이 아닌 모든 자료를 출력하라-- 
SELECT * FROM book WHERE publisher IS NOT NULL;

-- book 테이블에서 pubrisher가 '대한미디어'인 자료를 중복되지 않게 출력하라-- 
SELECT DISTINCT publisher FROM book WHERE publisher='대한미디어';
-- book테이블의 모든 자료를 '일련번호','제목','출판사','가격'으로 변경하여 출력하시오-- 
SELECT bookid AS '일련번호',bookname AS '제목',publisher AS '출판사', price AS '가격' FROM book;

-- book 테이블에서 대한미디어의 가격의 합계를 출력하라-- 
SELECT publisher AS '출판사',sum(price) AS '가격합계'
FROM book
WHERE publisher = '대한미디어';

-- book 테이블에서 대한미디어의 거래건수를 출력하라-- 
SELECT publisher AS '출판사',COUNT(price) AS '거래건수'
FROM book
WHERE publisher = '대한미디어';

-- book 테이블에서 판매가의 합계, 평균,최대,최소,갯수를 출력하라-- 
SELECT SUM(price) AS '합계',
	   AVG(price) AS '평균',
	   MAX(price) AS '최대값',
	   MIN(price) AS '최소값',
	   COUNT(price) AS '갯수'
FROM book;

-- book 테이블에서 각각의 publisher별 가격의 합계를 출력하라 -- 
SELECT publisher AS '출판사',COUNT(publisher) AS '거래건수',(price) AS '가격합계'
FROM book
GROUP BY publisher;


-- ORDER 테이블을 출력하시오-- 
SELECT * FROM orders;
-- ORDER 테이블에서 '주문번호','구매자번호','책번호','구입가격','구입일자'를 출력하시오 --
SELECT orderid AS '주문번호',custid AS '구매자번호',bookid AS '책번호',saleprice AS '구입가격',orderdate AS '구입일자'
FROM orders;


-- ORDER 테이블을 '구매자번호','구입가격'의 합계를 출력하시오 단, 구매자번호별로 구하시오 --
SELECT custid AS '구매자번호',SUM(saleprice) AS '구입가격의 합계'
FROM orders
GROUP BY custid;

-- ORDER 테이블을 '구매자번호','구입가격'의 합계를 출력하시오. 단, 구매자별로 구매건수가 3건 이상인 것 --
SELECT custid AS '구매자번호',SUM(saleprice) AS '구입가격의 합계'
FROM orders
GROUP BY custid
HAVING COUNT(custid) >=3;

-- book 테이블에서 bookname,publisher,price를 publisher의 오름차순으로 정렬하여 출력하시오 --
SELECT bookname,publisher, price
FROM book
ORDER BY publisher ASC;

-- book 테이블에서 bookname,publisher,price를 publisher의 오름차순으로 정렬하고 출판사의 경우 bookname의 내림차순으로 정렬하여 출력하시오 --
SELECT bookname,publisher, price
FROM book
ORDER BY publisher ASC,bookname DESC;

-- orders 테이블에서 custid가 3이하인 고객중, 2회 이상 거래된 고객을 대상으로 custid별 custid,saleprice의 합계, 판매갯수를 custid의 내림차순으로 정렬하여 출력하시오 --
SELECT custid,SUM(saleprice) AS '합계',COUNT(*) AS '판매갯수'
FROM orders
WHERE custid<=3
GROUP BY custid
HAVING COUNT(*)>=2
ORDER BY custid DESC;