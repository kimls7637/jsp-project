CREATE TABLE MEMBER(
   ID VARCHAR(200) PRIMARY KEY,
   PW VARCHAR(20) NOT NULL,
   NAME VARCHAR(10) NOT NULL,
   PHONE VARCHAR(20) UNIQUE 
);

CREATE TABLE PRODUCT(
   PNUM INT PRIMARY KEY NOT NULL,
   PNAME VARCHAR(200) NOT NULL,
   PPRICE INT NOT NULL,
   PIMG VARCHAR(200) NOT NULL,
   PCNT INT NOT NULL,
   PCATE VARCHAR(20) NOT NULL
);

CREATE TABLE REVIEW(
   RNUM INT PRIMARY KEY,
   RPNUM INT NOT NULL,
   RID VARCHAR(200) NOT NULL,
   RCONTENT VARCHAR(500) NOT NULL,
   RGRADE INT NOT NULL,
   RDATE VARCHAR(50) NOT NULL
);


CREATE TABLE ORDERPRODUCT(
   OPK INT PRIMARY KEY,
   ONUM INT NOT NULL,
   OID VARCHAR(200) NOT NULL,
   ONAME VARCHAR(50) NOT NULL,
   OPHONE VARCHAR(50) NOT NULL,
   OADDRESS VARCHAR(500) NOT NULL,
   ODATE VARCHAR(200) NOT NULL,
   OPNUM INT NOT NULL,
   OCNT INT NOT NULL,
   OMSG VARCHAR(200)
);

CREATE TABLE QNA(
   QNUM INT PRIMARY KEY ,
   QTITLE VARCHAR(200) NOT NULL,
   QID VARCHAR(200) NOT NULL,
   QCONTENT VARCHAR(500) NOT NULL,
   QDATE VARCHAR(200) NOT NULL,
   QREPLY VARCHAR(500) 
);


INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),?,?,?,?,?,?,?,?,?)

INSERT INTO MEMBER (ID, PW, NAME)  VALUES ('admin', 'admin123','관리자');
INSERT INTO MEMBER VALUES ('dltmdfbf', 'asdf1234','이승률','010-5433-0078');
INSERT INTO MEMBER VALUES ('rnjswlals', 'asdf1234','권지민','010-9941-9780');
INSERT INTO MEMBER VALUES ('a','a','a','010-0000-0000');
INSERT INTO ORDER VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),?,?,?,?,?,?,?,?,?)

select * from member;
select * from PRODUCT;
select * from ORDERPRODUCT;
select * from QNA;
select * from REVIEW;

drop table member;
drop table PRODUCT;
drop table ORDERPRODUCT;
drop table QNA;
drop table REVIEW;
delete from product;
delete from orderproduct where onum=133;
SELECT * FROM (SELECT OPNUM,OCNT,PNAME,PIMG,PPRICE FROM (SELECT OPNUM,OCNT,PNAME,PIMG,PPRICE FROM ORDERPRODUCT,PRODUCT WHERE ORDERPRODUCT.OPNUM=PRODUCT.PNUM) GROUP BY OPNUM,OCNT,PNAME,PIMG,PPRICE ORDER BY SUM(OCNT) DESC) WHERE ROWNUM<=6 ORDER BY OCNT DESC;

/*이름가격이미지재고카테고리*/
INSERT INTO PRODUCT VALUES((SELECT NVL(MAX(PNUM),0)+1 FROM PRODUCT),?,?,?,?,?)
INSERT INTO PRODUCT VALUES((SELECT NVL(MAX(PNUM),0)+1 FROM PRODUCT),'ari',3000,'sdf',3,'sdf');


DROP TABLE PRODUCT;
DROP TABLE MEMBER;
DROP TABLE ORDERPRODUCT;
INSERT INTO MEMBER VALUES ('admin','admin123','관리자','000-0000-0000');
INSERT INTO MEMBER VALUES ('dltmdfbf','dltmdfbf123','이승률','010-1111-1111');
INSERT INTO MEMBER VALUES ('rnjswlals','rnjswlals123','권지민','010-2222-2222');
INSERT INTO MEMBER VALUES ('thsalstjd','thsalstjd123','손민성','000-3333-3333');
INSERT INTO MEMBER VALUES ('rlagksqlc','rlagksqlc123','김한빛','000-4444-4444');
INSERT INTO MEMBER VALUES ('rladltmf','rladltmf123','김이슬','000-5555-5555');
INSERT INTO MEMBER VALUES ('rlagudwls','rladltmf123','김형진','000-6666-6666');

INSERT INTO PRODUCT VALUES((SELECT NVL(MAX(PNUM),0)+1 FROM PRODUCT),'D',15000,'D',5,'F');

INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'dltmdfbf','받는사람','받는사람연락처','주소','2023-02-01',23,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rnjswlals','받는사람','받는사람연락처','주소','2023-02-01',23,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'thsalstjd','받는사람','받는사람연락처','주소','2023-02-01',23,2,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rlagksqlc','받는사람','받는사람연락처','주소','2023-02-01',23,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rladltmf','받는사람','받는사람연락처','주소','2023-02-02',15,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rlagudwls','받는사람','받는사람연락처','주소','2023-01-31',15,3,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rnjswlals','받는사람','받는사람연락처','주소','2023-01-31',9,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),132,'rnjswlals','받는사람','받는사람연락처','주소','2023-02-01',9,5,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),132,'rnjswlals','받는사람','받는사람연락처','주소','2023-02-01',9,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rlagksqlc','받는사람','받는사람연락처','주소','2023-01-31',7,2,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rlagksqlc','받는사람','받는사람연락처','주소','2023-01-31',7,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rlagudwls','받는사람','받는사람연락처','주소','2023-02-01',7,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'thsalstjd','받는사람','받는사람연락처','주소','2023-02-01',5,2,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rladltmf','받는사람','받는사람연락처','주소','2023-02-01',5,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rlagudwls','받는사람','받는사람연락처','주소','2023-02-01',3,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rnjswlals','받는사람','받는사람연락처','주소','2023-02-01',3,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rladltmf','받는사람','받는사람연락처','주소','2023-02-02',7,3,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'dltmdfbf','받는사람','받는사람연락처','주소','2023-02-02',1,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rnjswlals','받는사람','받는사람연락처','주소','2023-02-01',6,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rladltmf','받는사람','받는사람연락처','주소','2023-02-02',6,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'dltmdfbf','받는사람','받는사람연락처','주소','2023-02-02',6,1,'메세지');



INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),?,?,?,?,?,?,?,?,?)
SELECT * FROM MEMBER;
SELECT * FROM PRODUCT;
SELECT * FROM ORDERPRODUCT;
SELECT * FROM REVIEW;
SELECT * FROM QNA;

DROP TABLE ORDERPRODUCT;
INSERT INTO 

SELECT OPK,ONUM,OID,PNAME,PPRICE FROM ORDERPRODUCT,PRODUCT WHERE ORDERPRODUCT.OPNUM=PRODUCT.PNUM;

DELETE FROM QNA WHERE QNUM='' OR QID='dltmdfbf';
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),(SELECT NVL(MAX(ONUM),100)+1 AS ONUM FROM ORDERPRODUCT),'rnjswlals','EE','010-','DDDDDDD주소','2023-01-12',5,2,'메세지');

INSERT INTO QNA VALUES(2,'TITLE','ID','CONTENT','SYSDATE','REFLY');
INSERT INTO QNA VALUES(5,'DDD0','dltmdfbf','ddddddddd','2023-01-24','dddd');

/*베스트상품 6개보기 (판매량 기준) 오라클에 limit없음*/

/*SELECT OPNUM, SUM(OCNT) FROM ORDERPRODUCT WHERE ROWNUM<=1 GROUP BY OPNUM, OCNT ORDER BY SUM(OCNT) DESC LIMIT 1;*/

/*베스트상품 6개보기 (판매량 기준) 오라클에 limit없음*/
SELECT * FROM (SELECT OPNUM, SUM(OCNT) FROM ORDERPRODUCT GROUP BY OPNUM, OCNT ORDER BY SUM(OCNT) DESC) WHERE ROWNUM<=1;

SELECT * FROM (SELECT OPNUM, SUM(OCNT) FROM ORDERPRODUCT GROUP BY OPNUM, OCNT ORDER BY SUM(OCNT) ASC) WHERE ROWNUM<=1;

ORDER BY SUM(OCNT) DESC LIMIT 
UPDATE SET QREPLY='asdf' FROM QNA WHERE QNUM=

DROP TABLE QNA;
SELECT QNUM,QTITLE,QID,RPAD(SUBSTR(QID,1,3),LENGTH(QID),'*') AS QSTARID,QCONTENT,QDATE,QREPLY FROM QNA ORDER BY QNUM DESC
SELECT* FROM QNA;

INSERT INTO QNA VALUES(2,'TITLE','ID','CONTENT','SYSDATE','REFLY');
SELECT * FROM (SELECT OPK,ONUM,OID,ONAME,OPHONE,OADDRESS,ODATE,OPNUM,OCNT,OMSG,PNAME,PPRICE FROM ORDERPRODUCT,PRODUCT WHERE ORDERPRODUCT.OPNUM=PRODUCT.PNUM) WHERE OID='kimls'


SELECT SUBSTR(ODATE,-5) AS ODATE, SUM(OCNT*PPRICE) AS TOTALDAY FROM(SELECT * FROM (SELECT ODATE,OCNT,PPRICE FROM ORDERPRODUCT,PRODUCT WHERE ORDERPRODUCT.OPNUM=PRODUCT.PNUM) WHERE ODATE='2023-01-25') GROUP BY ODATE;

SELECT * FROM (SELECT OID,SUM(OCNT*PPRICE) AS IDTOTALPRICE FROM (SELECT OID,OCNT,PPRICE FROM ORDERPRODUCT,PRODUCT WHERE ORDERPRODUCT.OPNUM=PRODUCT.PNUM) GROUP BY OID ) WHERE ROWNUM<=5 ORDER BY IDTOTALPRICE DESC;

INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),1111,'EE','EE','010-','DDDDDDD주소','2023-01-19',5,2,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),1111,'EE','EE','010-','DDDDDDD주소','2023-01-19',21,3,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),1111,'EE','EE','010-','DDDDDDD주소','2023-01-19',11,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),1111,'EE','EE','010-','DDDDDDD주소','2023-01-20',15,2,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),1111,'EE','EE','010-','DDDDDDD주소','2023-01-20',18,2,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),1111,'EE','EE','010-','DDDDDDD주소','2023-01-21',7,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),1111,'EE','EE','010-','DDDDDDD주소','2023-01-22',26,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),1111,'EE','EE','010-','DDDDDDD주소','2023-01-22',19,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),1111,'EE','EE','010-','DDDDDDD주소','2023-01-23',19,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),1111,'EE','EE','010-','DDDDDDD주소','2023-01-23',19,1,'메세지');
INSERT INTO ORDERPRODUCT VALUES((SELECT NVL(MAX(OPK),0)+1 FROM ORDERPRODUCT),1111,'EE','EE','010-','DDDDDDD주소','2023-01-24',6,1,'메세지');