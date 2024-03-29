show tables;
-- book의 모든 것, orders의 모든 것 --
SELECT *
FROM book,orders
WHERE book.bookid=orders.bookid;

-- book과 orders를 대상으로 bookid가 일치하는 자료들 중 saleprice가 20000 이상인 bookid,bookname,daleprice,orderdate를 출력하시오 --
SELECT book.bookid,bookname,saleprice,orderdate
FROM book,orders
WHERE book.bookid=orders.bookid AND orders.saleprice>=20000;

-- book과 orders를 대상으로 bookid가 일치하는 자료들을 대상으로 bookid,bookname,saleprice,orderdate를 출력하시오 --
SELECT book.bookid,bookname,saleprice,orderdate
FROM book INNER JOIN orders ON book.bookid=orders.bookid;

-- book과 orders를 대상으로 bookid가 일치하는 자료들을 대상으로 bookid,bookname,saleprice,orderdate를 출력하시오 --
SELECT book.bookid,bookname,saleprice,orderdate
FROM book LEFT OUTER JOIN orders ON book.bookid = orders.bookid;

-- book과 orders를 대상으로 orders은 모든 데이터를 다 가져오고 book은 orders와 일치하는 bookid,bookname,saleprice,orderdate를 출력하시오 --
SELECT book.bookid,book.bookname,orders.saleprice,orders.orderdate
FROM orders LEFT OUTER JOIN book ON book.bookid = orders.bookid;

-- 양쪽 테이블의 모든 자료 --
SELECT book.bookid,bookname,saleprice,orderdate
FROM book LEFT OUTER JOIN orders ON book.bookid = orders.bookid
UNION
SELECT book.bookid,book.bookname,orders.saleprice,orders.orderdate
FROM orders LEFT OUTER JOIN book ON book.bookid = orders.bookid;

-- book.bookid와 customer.phone가 정확하게 일치하는 모든 자료를 출력하시오. --
SELECT *
FROM book INNER JOIN customer ON book.bookid=customer.phone;

-- LEFT JOIN --
SELECT *
FROM book LEFT JOIN customer ON book.bookid=customer.phone;

-- RIGHT JOIN --
SELECT *
FROM customer LEFT JOIN book ON book.bookid=customer.phone;

-- FULL JOIN --
SELECT *
FROM book LEFT JOIN customer ON book.bookid=customer.phone
UNION
SELECT *
FROM customer LEFT JOIN book ON book.bookid=customer.phone;







