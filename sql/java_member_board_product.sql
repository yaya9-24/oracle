-----java21 jdbc ������Ʈ�� sql����----------------------------
-- ȸ�����̺� member
-- ��ȣ, ���̵�,���,�̸�,����
drop table member cascade constraints;
CREATE TABLE MEMBER 
(
  NUM NUMBER NOT NULL 
, ID VARCHAR2(20) NOT NULL 
, PW VARCHAR2(20) NOT NULL 
, name VARCHAR2(20) NOT NULL 
, tel VARCHAR2(20) NOT NULL 
, CONSTRAINT MEMBER_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
drop sequence seq_member;
create sequence seq_member;
exec PC_MEMBER_INSERT;
-------------end member----------------

-------------------------------------
-- ��ǰ���̺�product
-- ��ȣ,��ǰ��,��,����,����(pcount)
DROP TABLE PRODUCT;
CREATE TABLE PRODUCT 
(
  NUM NUMBER NOT NULL 
, PNAME VARCHAR2(50) NOT NULL 
, MODEL VARCHAR2(2000) NOT NULL 
, PRICE NUMBER NOT NULL 
, COUNT NUMBER default 0
, USER_ID VARCHAR2(20)
, CONSTRAINT PRODUCT_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
drop sequence seq_product;
CREATE SEQUENCE seq_product;
exec PC_PRODUCT_INSERT;
------------end product-------------

---------------------------
-- �Խñ� ���̺�
-- ��ȣ,����,����,�ۼ���,�ۼ�����
drop table board;
CREATE TABLE BOARD 
(
  NUM NUMBER NOT NULL 
, TITLE VARCHAR2(50) NOT NULL 
, CONTENT VARCHAR2(2000) 
, WRITER VARCHAR2(20) NOT NULL 
, WDATE date default sysdate 
, CONSTRAINT BOARD_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
drop sequence seq_board;
create sequence seq_board;
exec PC_BOARD_INSERT;
--------------end board-----------------

----------------------------
-- ��� ���̺�
-- ��ȣ,����,�ۼ���,�ۼ�����,�ش�Խñ۹�ȣ
DROP TABLE COMMENTS;
CREATE TABLE COMMENTS 
(
  NUM NUMBER NOT NULL 
, CONTENT VARCHAR2(2000) NOT NULL 
, WRITER VARCHAR2(20) NOT NULL 
, WDATE DATE DEFAULT SYSDATE NOT NULL 
, BNUM NUMBER NOT NULL 
, CONSTRAINT COMMENTS_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);

DROP SEQUENCE SEQ_COMMENTS;
CREATE SEQUENCE SEQ_COMMENTS;
EXEC PC_COMMENTS_INSERT;
------���� �������� �߰�------------------------------
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_UK1 UNIQUE (ID) ENABLE;
ALTER TABLE BOARD ADD CONSTRAINT BOARD_FK1 
    FOREIGN KEY(WRITER)REFERENCES MEMBER(ID)ON DELETE CASCADE ENABLE;
ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_FK1 
    FOREIGN KEY(USER_ID)REFERENCES MEMBER(ID)ON DELETE SET NULL ENABLE;
ALTER TABLE COMMENTS ADD CONSTRAINT COMMENTS_FK1 
FOREIGN KEY(BNUM)REFERENCES BOARD(NUM)ON DELETE CASCADE ENABLE;
--------------------------------------------------

select * from member;
select * from board;
select * from product;
select * from comments;