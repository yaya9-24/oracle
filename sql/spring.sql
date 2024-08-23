CREATE TABLE PRODUCT 
(
  NUM NUMBER NOT NULL 
, PNAME VARCHAR2(50 BYTE) 
, MODEL VARCHAR2(100 BYTE) 
, PRICE NUMBER 
, COUNT NUMBER 
, USER_ID VARCHAR2(50 BYTE) NOT NULL 
, IMG_NAME VARCHAR2(200 BYTE) NOT NULL 
, CONSTRAINT PRODUCT_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);

drop sequence seq_product;
CREATE SEQUENCE seq_product;