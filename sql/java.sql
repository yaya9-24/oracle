create table test2(fname varchar2(20));


insert into test2 values('S1234');
insert into test2 values('1234S_1234');
insert into test2 values('$S_1234');
insert into test2 values('sssS_1234');
insert into test2 values('THE X\_Y');
insert into test2 values('THE1 X_Y');
insert into test2 values('THE X\&Y');
insert into test2 values('THE X&Y');
insert into test2 values('THE2 X_Y');

select fname from test2 where fname like '%S\_%' escape '\';

drop table "JAVA"."TEST2";

create table test(
 num number,
 name varchar2(20)
);
insert into test(num,name) values(1,'kim1');
insert into test(num,name) values(2,'kim2');
insert into test(num,name) values(3,'kim3');
insert into test(num,name) values(4,'kim4');
insert into test(num,name) values(5,'kim5');

select * from test;

update test set name='lee' where num=1;
update test set name='lee' where num>3;
update test set name='kim33' where name='lee';

delete from test where num=4;


create table sample1(
num number primary key,
fname varchar2(20),
lname varchar2(20) not null,
tel varchar2(20) not null,
addr varchar2(100),
regdate date default sysdate
);

insert into sample1(num,fname,lname,tel,addr,regdate) values(1,'kim','young','02','�����',null);
create sequence sample1_seq;

drop table sample1;
CREATE TABLE SAMPLE1 
(
  NUM NUMBER NOT NULL 
, FNAME VARCHAR2(20) DEFAULT 'gil dong' 
, LNAME VARCHAR2(20) NOT NULL 
, TEL VARCHAR2(20) NOT NULL 
, ADDR VARCHAR2(100) 
, REGDATE DATE DEFAULT sysdate 
, CONSTRAINT SAMPLE1_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);

drop SEQUENCE SAMPLE1_SEQ;
CREATE SEQUENCE SAMPLE1_SEQ;

create table sample2(num number);

alter table sample2 add (fname varchar2(20));
alter table sample2 add (lname varchar2(20));
alter table sample2 add (tel varchar2(20));
alter table sample2 add (addr varchar2(100));
alter table sample2 add (memo varchar2(100));

alter table sample2 modify (momo date);
alter table sample2 modify (num number primary key);
alter table sample2 modify (memo date default sysdate);

-- �÷��� �̸��� �ٲܶ� modify�� �ƴ϶� rename column�̴�.
alter table sample2 rename column memo to regdate;

alter table sample2 drop column addr;
alter table sample2 add (addr varchar2(100));

alter table sample2 add (addr2 varchar2(100));
alter table sample2 add (addr3 varchar2(100));
alter table sample2 add (addr4 varchar2(100));
alter table sample2 set unused column addr2;
alter table sample2 set unused (addr3,addr4);
alter table sample2 drop unused columns;
--------------------------------------------------------------
create table sample3 (num number, join_id varchar2(20));
create table sample4 (join_id varchar2(20) primary key);

alter table sample3 add constraint sample_pk primary key(num);
alter table sample3 drop constraint sample_pk;

alter table sample3 add constraint sample_fk_join_id
foreign key(join_id) references sample4(join_id);
alter table sample3 drop constraint sample_fk_join_id;

alter table sample3 disable constraint sample_fk_join_id;  -- �������� ��Ȱ��ȭ
alter table sample3 enable constraint sample_fk_join_id;  -- �������� Ȱ��ȭ
alter table sample3 disable primary key cascade; -- �������� �����ϰ� �⺻Ű ��Ȱ��ȭ
alter table sample3 enable primary key ; -- �������� �����ϰ� �⺻Ű Ȱ��ȭ
alter table sample3 read only; alter table sample3 read write;

-- ��ü�� ������ �� ----------------------
drop table sample3;
drop table sample4 cascade CONSTRAINTS; -- �������� ���� ����
drop table sample4 cascade CONSTRAINTS purge; -- recyclebin ���幫��

-- truncate : deleteó�� �����͸� ������ �� ���. (������ delete�� �ѹ� ����, ddl�� �ѹ��� �ȵȴ�.)
truncate table sample1;

-- ��� ��ȣ�� pk���� -------------------------------
-- �� ���̺� ��ȣ�� ���� ������ ��������

-- ������̺� person
-- ��ȣ, �̸�, ����, ����
drop table person;
create table person(
num number primary key,
name varchar2(20),
age number,
birthday date
);
drop sequence seq_person;
create sequence seq_person;

---------------------DML
select * from person;
select count(*) cnt from person;

insert into 
person(num,name,age,birthday)
values(seq_person.nextval,'kim',11,'2024-11-11');

update person set name='lee',age=22,birthday='2024-12-12'
where num =2;

delete from person where num>=3 and num<5;



------------------DML
insert into member(num,id,pw,name,tel)
values(seq_member.nextval, 'admin','hi1111','kim1','010-2222-4444');

update member set id = 'admin22', pw = '22hihi',name = 'lee', tel = '010-2222-2222'
where num>=2 and num<=3;

delete from member where num>=8;

-- �Խñ����̺� board
-- ��ȣ,����,����,�ۼ���,�ۼ�����
drop table board;
create table board(
num number primary key,
title varchar2(20) not null,
content varchar2(20) not null,
writer varchar2(20),
wdate varchar2(20)
);

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

----------------------DML
insert into board(num,title,content,writer)
values(seq_board.nextval,'JAVA','JAVA+ORACLE','kim2');

update board set title='title', content='content24',wdate=sysdate
where num =1;

delete from board where num>2 and num<=5;

-- ��ǰ���̺�product
-- ��ȣ,��ǰ��,��,����,����(pcount)
create table product(
num number primary key,
pname varchar2(20),
model varchar2(20),
price number,
pcount number);

CREATE TABLE PRODUCT 
(
  NUM NUMBER NOT NULL 
, PNAME VARCHAR2(50) NOT NULL 
, MODEL VARCHAR2(2000) NOT NULL 
, PRICE NUMBER NOT NULL 
, COUNT NUMBER default 0
, CONSTRAINT PRODUCT_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
drop sequence seq_product;
CREATE SEQUENCE seq_product;
------------------------- DML
insert into product(num,pname,model,price,count)
values(seq_product.nextval, 'product','iphone',999,5);

update product set pname='computer', model='icom', price=price*0.9, count = count-1
where num>7;

delete from product where num<3;

-- �б����̺� - ������ �÷�pk�� ��ȣ���� 5�÷�(�����ʹ� 10���� �� �߰�)
CREATE TABLE ���б� 
(
  ���б�ID NUMBER NOT NULL 
, ���б��̸� VARCHAR2(40) NOT NULL 
, ��ġ VARCHAR2(100) NOT NULL 
, �������� NUMBER NOT NULL 
, �л��� NUMBER NOT NULL 
, CONSTRAINT ���б�_PK PRIMARY KEY 
  (
    ���б�ID 
  )
  ENABLE 
);

INSERT INTO ���б� (���б�ID, ���б��̸�, ��ġ, ��������, �л���) VALUES (1, '������б�', '����', 1943, 30000);
INSERT INTO ���б� (���б�ID, ���б��̸�, ��ġ, ��������, �л���) VALUES (2, '��õ���б�', '��õ', 1974, 22000);
INSERT INTO ���б� (���б�ID, ���б��̸�, ��ġ, ��������, �л���) VALUES (3, '�λ���б�', '�λ�', 1941, 18000);
INSERT INTO ���б� (���б�ID, ���б��̸�, ��ġ, ��������, �л���) VALUES (4, '�������б�', '����', 1982, 19200);
INSERT INTO ���б� (���б�ID, ���б��̸�, ��ġ, ��������, �л���) VALUES (5, '���ϴ��б�', '����', 1983, 16000);
INSERT INTO ���б� (���б�ID, ���б��̸�, ��ġ, ��������, �л���) VALUES (6, '���ϴ��б�', '��õ', 1968, 27000);
INSERT INTO ���б� (���б�ID, ���б��̸�, ��ġ, ��������, �л���) VALUES (7, '�������б�', '����', 1942, 38000);
INSERT INTO ���б� (���б�ID, ���б��̸�, ��ġ, ��������, �л���) VALUES (8, '������б�', '����', 1965, 25000);
INSERT INTO ���б� (���б�ID, ���б��̸�, ��ġ, ��������, �л���) VALUES (9, '�Ѿ���б�', '����', 1945, 24000);
INSERT INTO ���б� (���б�ID, ���б��̸�, ��ġ, ��������, �л���) VALUES (10, '��ȭ���б�', '����', 1938, 12000);


-- �а����̺� - ������ �÷�pk�� ��ȣ���� 5�÷�(�����ʹ� 10���� �� �߰�)
CREATE TABLE �а� 
(
  �а�ID NUMBER NOT NULL 
, �а��� VARCHAR2(50) NOT NULL 
, ���б�ID NUMBER NOT NULL 
, �������� NUMBER NOT NULL 
, �л��� NUMBER NOT NULL 
, CONSTRAINT �а�_PK PRIMARY KEY 
  (
    �а�ID 
  )
  ENABLE 
);

INSERT INTO �а� (�а�ID, �а���, ���б�ID, ��������, �л���) VALUES (1, '�����а�', 1, 1943, 50);
INSERT INTO �а� (�а�ID, �а���, ���б�ID, ��������, �л���) VALUES (2, '����а�', 2, 1976, 77);
INSERT INTO �а� (�а�ID, �а���, ���б�ID, ��������, �л���) VALUES (3, 'ö�а�', 3, 1947, 28);
INSERT INTO �а� (�а�ID, �а���, ���б�ID, ��������, �л���) VALUES (4, '�ż�����а�', 4, 2000, 56);
INSERT INTO �а� (�а�ID, �а���, ���б�ID, ��������, �л���) VALUES (5, '�����а�', 5, 1987, 48);
INSERT INTO �а� (�а�ID, �а���, ���б�ID, ��������, �л���) VALUES (6, '���а�', 6, 1968, 100);
INSERT INTO �а� (�а�ID, �а���, ���б�ID, ��������, �л���) VALUES (7, '�����а�', 7, 1942, 88);
INSERT INTO �а� (�а�ID, �а���, ���б�ID, ��������, �л���) VALUES (8, '���ڰ��а�', 8, 1972, 67);
INSERT INTO �а� (�а�ID, �а���, ���б�ID, ��������, �л���) VALUES (9, 'ȭ�а��а�', 9, 1970, 35);
INSERT INTO �а� (�а�ID, �а���, ���б�ID, ��������, �л���) VALUES (10, '�濵�а�', 10, 1940, 100);
-- �л����̺� - ������ �÷�pk�� ��ȣ���� 5�÷�(�����ʹ� 10���� �� �߰�)
CREATE TABLE �л� 
(
  �л�ID NUMBER NOT NULL 
, �̸� VARCHAR2(40) NOT NULL 
, �а�ID NUMBER NOT NULL 
, ���г⵵ NUMBER NOT NULL 
, ���� NUMBER NOT NULL 
, CONSTRAINT �л�_PK PRIMARY KEY 
  (
    �л�ID 
  )
  ENABLE 
);
INSERT INTO �л� (�л�ID, �̸�, �а�ID, ���г⵵, ����, ����ID) VALUES (1, '��ö��', 1, 2024, 20,1);
INSERT INTO �л� (�л�ID, �̸�, �а�ID, ���г⵵, ����, ����ID) VALUES (2, '�迵��', 2, 2023, 21,2);
INSERT INTO �л� (�л�ID, �̸�, �а�ID, ���г⵵, ����, ����ID) VALUES (3, '������', 3, 2023, 22,3);
INSERT INTO �л� (�л�ID, �̸�, �а�ID, ���г⵵, ����, ����ID) VALUES (4, '�����', 4, 2022, 23,4);
INSERT INTO �л� (�л�ID, �̸�, �а�ID, ���г⵵, ����, ����ID) VALUES (5, '�ֻ糪', 5, 2022, 24,5);
INSERT INTO �л� (�л�ID, �̸�, �а�ID, ���г⵵, ����, ����ID) VALUES (6, '�ִ���', 6, 2024, 25,6);
INSERT INTO �л� (�л�ID, �̸�, �а�ID, ���г⵵, ����, ����ID) VALUES (7, '���ֿ�', 7, 2023, 26,7);
INSERT INTO �л� (�л�ID, �̸�, �а�ID, ���г⵵, ����, ����ID) VALUES (8, '�赵��', 8, 2017, 27,8);
INSERT INTO �л� (�л�ID, �̸�, �а�ID, ���г⵵, ����, ����ID) VALUES (9, '�㸸��', 9, 2015, 28,9);
INSERT INTO �л� (�л�ID, �̸�, �а�ID, ���г⵵, ����, ����ID) VALUES (10, '��ġ��', 10, 2016, 29,10);



-- �������̺� - ������ �÷�pk�� ��ȣ���� 5�÷�(�����ʹ� 10���� �� �߰�)
CREATE TABLE ���� 
(
  ����ID NUMBER NOT NULL 
, ������ VARCHAR2(50) NOT NULL 
, �а�ID NUMBER NOT NULL 
, �����л��� NUMBER NOT NULL 
, ���� NUMBER NOT NULL 
, CONSTRAINT ����_PK PRIMARY KEY 
  (
    ����ID 
  )
  ENABLE 
);

INSERT INTO ���� (����ID, ������, �а�ID, �����л���, ����) VALUES (1, '������', 1, 52, 3);
INSERT INTO ���� (����ID, ������, �а�ID, �����л���, ����) VALUES (2, '�κ�����', 2, 87, 3);
INSERT INTO ���� (����ID, ������, �а�ID, �����л���, ����) VALUES (3, 'ö��', 3, 56, 3);
INSERT INTO ���� (����ID, ������, �а�ID, �����л���, ����) VALUES (4, '������', 4, 45, 4);
INSERT INTO ���� (����ID, ������, �а�ID, �����л���, ����) VALUES (5, '�����а���', 5, 89, 4);
INSERT INTO ���� (����ID, ������, �а�ID, �����л���, ����) VALUES (6, '�غ���', 6, 87, 3);
INSERT INTO ���� (����ID, ������, �а�ID, �����л���, ����) VALUES (7, '������2', 7, 21, 4);
INSERT INTO ���� (����ID, ������, �а�ID, �����л���, ����) VALUES (8, '���ڱ���', 8, 34, 2);
INSERT INTO ���� (����ID, ������, �а�ID, �����л���, ����) VALUES (9, '���ȭ��', 9, 24, 3);
INSERT INTO ���� (����ID, ������, �а�ID, �����л���, ����) VALUES (10, '�濵��', 10, 52, 3);

insert into 
sample1( num, 
fname, 
lname, 
tel, 
addr ) 
values( sample1_seq.nextval, 
dbms_random.string('A',19),
dbms_random.string('Q',19), 
'010-0000-0000', 
'seoul' );

--- ���ڷ���
select dbms_random.string('A',19)from dual;
--- ��������
select dbms_random.value() from dual;
--- 0~9 �����Ǽ�
select dbms_random.value()*10 from dual;
--- 0~9 ��������
select floor(dbms_random.value()*10) from dual;
--- 1~45 �ζ�����
select floor(dbms_random.value()*45+1) from dual;

--- PL/SQL
--begin
--    for i in 1..50 loop
--        insert into
--        sample1(num,fname,lname,tel,addr)
--        values(sample1_seq.nextval,
--        dbms_random.string('A',19),
--        dbms_random.string('Q',19),
--        '010-0000-0000',
--        'seoul');
--    end loop;
--    commit;
--end;
--/
Select count(*) from sample1;


exec PROCEDURE1();
truncate table sample1;
drop sequence sample1_seq;

update sample1 set fname = 'yangssem' where num=1;
select * from sample1;

update sample1 set fname = 'yangssem2' where fname = 'yangssem';

update sample1
set fname = 'yangssem3',
    lname = 'oracle',
    tel = '010-0000-9494',
    addr = 'busan',
    regdate = '24/12/25'
where fname = 'yangssem2';

update sample1
set num =500001
where fname = 'yangssem3';

create table TEST1 (pnum number,p2num number,pcount number,price number);
insert into test1 values(1001,2001,100,5000);
insert into test1 values(1002,2002,100,3000);
insert into test1 values(1003,2003,100,2000);
insert into test1 values(1004,2003,100,2000);

create table TEST2 (pnum number,p2num number,pcount number,price number);
insert into test2 values(6001,7001,300,7000);
insert into test2 values(6002,7002,300,8000);
insert into test2 values(6003,7003,300,9000);

create table TEST_merge (pnum number,p2num number,pcount number,price 
number);

MERGE INTO test_merge tm USING test1 t1 
 ON (tm.pnum=t1.pnum)
WHEN MATCHED THEN
UPDATE SET tm.p2num=t1.p2num
WHEN NOT MATCHED THEN
INSERT VALUES(t1.pnum, t1.p2num, t1.pcount, t1.price);

MERGE INTO test_merge tm USING test2 t2 
 ON (tm.pnum=t2.pnum)
WHEN MATCHED THEN
UPDATE SET tm.p2num=t2.p2num
WHEN NOT MATCHED THEN
INSERT VALUES(t2.pnum, t2.p2num, t2.pcount, t2.price);

delete from test2;
drop table test1;
select * from test2;

-- �ǽ�
CREATE TABLE TEST_BOARD 
(
  WNUM NUMBER NOT NULL 
, WRITER VARCHAR2(50) NOT NULL 
, TITLE VARCHAR2(100) NOT NULL 
, CON VARCHAR2(100) NOT NULL 
, WDATE DATE default sysdate 
, VCOUNT  NUMBER default 0
, CONSTRAINT TEST_BOARD_PK PRIMARY KEY 
  (
    WNUM 
  )
  ENABLE 
);
create sequence test_board_seq;
drop sequence test_board_seq;

--begin
--    for i in 1..10 loop
--        insert into 
--        test_board(wnum,writer,title,con)
--        values(test_board_seq.nextval,
--        dbms_random.string('A',3),
--        dbms_random.string('A',10),
--        dbms_random.string('A',20));
--    end loop;
--    commit;
--end;

delete from test_board where wnum=4;
delete from test_board where writer='DkX';
insert into test_board(wnum,writer,title,con) values(test_board_seq.nextval,'yangssem','oracle','java');
update test_board set con='��ſ� ORACLE SQL' where writer = 'yangssem';
select * from test_board
where title like '%ORACLE%' or con like '%ORACLE%';
alter table test_board add comm_ch varchar2(50);
truncate table test_board;
drop table test_board;

create table dept( deptno number primary key); 
CREATE TABLE EMP_TAB(
 EMPNO NUMBER(4),
 ENAME VARCHAR2(10),
 JOB_ID VARCHAR2(9),
 MGR NUMBER(4) CONSTRAINT EMP_SELF_KEY REFERENCES EMP_TAB(EMPNO),
 HIRE_DATE DATE,
 SAL NUMBER(7),
 COMM NUMBER(1),
 DEPTNO NUMBER(2) NOT NULL,
 CONSTRAINT EMP_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO),
 CONSTRAINT EMP_EMPNO_PK PRIMARY KEY(EMPNO)
 );
 
 CREATE TABLE test_dept(
 deptno NUMBER PRIMARY KEY, 
 dname VARCHAR2(20) DEFAULT '���ߺ�', 
 loc CHAR(1) CHECK(loc IN('1', '2')));
 
 CREATE TABLE test_emp(
 no NUMBER(4) PRIMARY KEY, 
 name VARCHAR2(20) NOT NULL, 
 loc VARCHAR2(4) CHECK(loc IN('����', '�λ�')),
 jumin CHAR(13) UNIQUE, 
 deptno NUMBER REFERENCES test_dept(deptno) );
 
CREATE TABLE TEST_BOARD(
WNUM NUMBER,
WRITER VARCHAR2(20) CONSTRAINT test_b_writer_nn NOT NULL,
TITLE VARCHAR2(400) CONSTRAINT test_b_title_nn NOT NULL,
CON VARCHAR2(2000) CONSTRAINT test_b_con_nn NOT NULL,
WDATE DATE default SYSDATE CONSTRAINT test_b_wdate_nn NOT NULL, 
VCOUNT NUMBER,
CONSTRAINT test_b_wnum_pk PRIMARY KEY (WNUM)
);

CREATE TABLE TEST_BOARD_COMM 
(
  COMM_ID NUMBER NOT NULL 
, WRITER VARCHAR2(20) NOT NULL 
, TITLE VARCHAR2(400) NOT NULL 
, CON VARCHAR2(2000) NOT NULL 
, WDATE DATE DEFAULT SYSDATE NOT NULL 
, WNUM NUMBER 
, VCOUNT NUMBER 
, CONSTRAINT TEST_BOARD_COMM_PK PRIMARY KEY 
  (
    COMM_ID 
  )
  ENABLE 
);

ALTER TABLE TEST_BOARD_COMM
ADD CONSTRAINT TEST_BOARD_COMM_FK1 FOREIGN KEY
(
  WNUM 
)
REFERENCES TEST_BOARD
(
  WNUM 
)
ON DELETE CASCADE ENABLE;

------ INDEX

drop table test_tab; 
create table test_tab( num NUMBER(4) , 
fname VARCHAR2(10),
loc VARCHAR2(10), 
jumin CHAR(13), 
deptno NUMBER
);
drop sequence test_tab_seq; 
create sequence test_tab_seq;
-- //���� �� �Է�������.
insert into test_tab
values(test_tab_seq.nextval,'yangssem','����','1234561234567',100); 
select rowid,num,fname,loc,jumin,deptno from test_tab;

--�ε��� ����
CREATE INDEX TEST_TAB_DEX ON TEST_TAB (FNAME);
--�ε��� �˻�
select index_name from user_indexes;
--�ε��� ����
drop index test_tab_dex;

---�ε��� Ȱ��1. ���Ľ� ���� order by �� ���� index�� ���İ���
drop table test_tab; 
create table test_tab( num NUMBER(4) , 
fname VARCHAR2(10),
loc VARCHAR2(10), 
jumin CHAR(13), 
deptno NUMBER
);
drop sequence test_tab_seq; 
create sequence test_tab_seq;

--begin
--    for i in 1..1000 loop
--    insert into test_tab
--    values(test_tab_seq.nextval,
--    sys.dbms_random.string('A',9),
--    '����',
--    '1234561234567',
--    100);
--    end loop;
--    commit;
--end;

-- //������
select num, fname from test_tab where fname >'0'; -- �ε��� ����϶�� �ǹ�
-- //�ε��� ����
create index test_tab_idx on test_tab(fname);
select num, fname from test_tab where fname >'0' and rownum=1;









select * from member order by num desc;
select * from board order by num desc;