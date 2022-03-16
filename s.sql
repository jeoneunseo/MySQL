SELECT * FROM book;
-- book 테이블에서 평균 price 이상인 도서정보를 출력 --
SELECT *
FROM book
WHERE price >=  (
	SELECT AVG(price)
    FROM book
);

-- book테이블에서 price가 가장 큰 도서명을 출력하시오 --
SELECT bookname
FROM book
WHERE price = (
	SELECT MAX(price)
    FROM book
);

-- orders.saleprice가 가장 큰 책의 publisher를 출력 --
SELECT book.publisher
FROM book JOIN orders ON book.bookid = orders.bookid
WHERE orders.saleprice = (
	SELECT MAX(orders.saleprice)
    FROM orders
);

SELECT name, phone
FROM customer
WHERE custid = (
	SELECT custid
    FROM orders
    WHERE saleprice = (
		SELECT MAX(saleprice)
        FROM orders
	)
);

-- 튜플변수 테이블의 이름을 변경 --
-- book => data1, orders => data2 바꿔서 bookid 일치하는 모든 자료를 출력 --
SELECT *
FROM book JOIN orders ON book.bookid = orders.bookid;
