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

insert into sample1(num,fname,lname,tel,addr,regdate) values(1,'kim','young','02','서울시',null);
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

-- 컬럼의 이름을 바꿀땐 modify가 아니라 rename column이다.
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

alter table sample3 disable constraint sample_fk_join_id;  -- 제약조건 비활성화
alter table sample3 enable constraint sample_fk_join_id;  -- 제약조건 활성화
alter table sample3 disable primary key cascade; -- 제약조건 무시하고 기본키 비활성화
alter table sample3 enable primary key ; -- 제약조건 무시하고 기본키 활성화
alter table sample3 read only; alter table sample3 read write;

-- 객체를 삭제할 때 ----------------------
drop table sample3;
drop table sample4 cascade CONSTRAINTS; -- 제약조건 무시 삭제
drop table sample4 cascade CONSTRAINTS purge; -- recyclebin 저장무시

-- truncate : delete처럼 데이터를 삭제할 때 사용. (차이점 delete는 롤백 가능, ddl은 롤백이 안된다.)
truncate table sample1;

-- 모든 번호는 pk설정 -------------------------------
-- 각 테이블별 번호에 사용될 시퀀스 각각생성

-- 사람테이블 person
-- 번호, 이름, 나이, 생일
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

-- 게시글테이블 board
-- 번호,제목,내용,작성자,작성일자
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

-- 상품테이블product
-- 번호,제품명,모델,가격,개수(pcount)
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

-- 학교테이블 - 임의의 컬럼pk용 번호포함 5컬럼(데이터는 10개행 씩 추가)
CREATE TABLE 대학교 
(
  대학교ID NUMBER NOT NULL 
, 대학교이름 VARCHAR2(40) NOT NULL 
, 위치 VARCHAR2(100) NOT NULL 
, 설립연도 NUMBER NOT NULL 
, 학생수 NUMBER NOT NULL 
, CONSTRAINT 대학교_PK PRIMARY KEY 
  (
    대학교ID 
  )
  ENABLE 
);

INSERT INTO 대학교 (대학교ID, 대학교이름, 위치, 설립연도, 학생수) VALUES (1, '서울대학교', '서울', 1943, 30000);
INSERT INTO 대학교 (대학교ID, 대학교이름, 위치, 설립연도, 학생수) VALUES (2, '인천대학교', '인천', 1974, 22000);
INSERT INTO 대학교 (대학교ID, 대학교이름, 위치, 설립연도, 학생수) VALUES (3, '부산대학교', '부산', 1941, 18000);
INSERT INTO 대학교 (대학교ID, 대학교이름, 위치, 설립연도, 학생수) VALUES (4, '강원대학교', '강원', 1982, 19200);
INSERT INTO 대학교 (대학교ID, 대학교이름, 위치, 설립연도, 학생수) VALUES (5, '전북대학교', '전북', 1983, 16000);
INSERT INTO 대학교 (대학교ID, 대학교이름, 위치, 설립연도, 학생수) VALUES (6, '인하대학교', '인천', 1968, 27000);
INSERT INTO 대학교 (대학교ID, 대학교이름, 위치, 설립연도, 학생수) VALUES (7, '연세대학교', '서울', 1942, 38000);
INSERT INTO 대학교 (대학교ID, 대학교이름, 위치, 설립연도, 학생수) VALUES (8, '고려대학교', '서울', 1965, 25000);
INSERT INTO 대학교 (대학교ID, 대학교이름, 위치, 설립연도, 학생수) VALUES (9, '한양대학교', '서울', 1945, 24000);
INSERT INTO 대학교 (대학교ID, 대학교이름, 위치, 설립연도, 학생수) VALUES (10, '이화대학교', '서울', 1938, 12000);


-- 학과테이블 - 임의의 컬럼pk용 번호포함 5컬럼(데이터는 10개행 씩 추가)
CREATE TABLE 학과 
(
  학과ID NUMBER NOT NULL 
, 학과명 VARCHAR2(50) NOT NULL 
, 대학교ID NUMBER NOT NULL 
, 설립연도 NUMBER NOT NULL 
, 학생수 NUMBER NOT NULL 
, CONSTRAINT 학과_PK PRIMARY KEY 
  (
    학과ID 
  )
  ENABLE 
);

INSERT INTO 학과 (학과ID, 학과명, 대학교ID, 설립연도, 학생수) VALUES (1, '국문학과', 1, 1943, 50);
INSERT INTO 학과 (학과ID, 학과명, 대학교ID, 설립연도, 학생수) VALUES (2, '기계학과', 2, 1976, 77);
INSERT INTO 학과 (학과ID, 학과명, 대학교ID, 설립연도, 학생수) VALUES (3, '철학과', 3, 1947, 28);
INSERT INTO 학과 (학과ID, 학과명, 대학교ID, 설립연도, 학생수) VALUES (4, '신소재공학과', 4, 2000, 56);
INSERT INTO 학과 (학과ID, 학과명, 대학교ID, 설립연도, 학생수) VALUES (5, '전산학과', 5, 1987, 48);
INSERT INTO 학과 (학과ID, 학과명, 대학교ID, 설립연도, 학생수) VALUES (6, '의학과', 6, 1968, 100);
INSERT INTO 학과 (학과ID, 학과명, 대학교ID, 설립연도, 학생수) VALUES (7, '물리학과', 7, 1942, 88);
INSERT INTO 학과 (학과ID, 학과명, 대학교ID, 설립연도, 학생수) VALUES (8, '전자공학과', 8, 1972, 67);
INSERT INTO 학과 (학과ID, 학과명, 대학교ID, 설립연도, 학생수) VALUES (9, '화학공학과', 9, 1970, 35);
INSERT INTO 학과 (학과ID, 학과명, 대학교ID, 설립연도, 학생수) VALUES (10, '경영학과', 10, 1940, 100);
-- 학생테이블 - 임의의 컬럼pk용 번호포함 5컬럼(데이터는 10개행 씩 추가)
CREATE TABLE 학생 
(
  학생ID NUMBER NOT NULL 
, 이름 VARCHAR2(40) NOT NULL 
, 학과ID NUMBER NOT NULL 
, 입학년도 NUMBER NOT NULL 
, 나이 NUMBER NOT NULL 
, CONSTRAINT 학생_PK PRIMARY KEY 
  (
    학생ID 
  )
  ENABLE 
);
INSERT INTO 학생 (학생ID, 이름, 학과ID, 입학년도, 나이, 전공ID) VALUES (1, '김철수', 1, 2024, 20,1);
INSERT INTO 학생 (학생ID, 이름, 학과ID, 입학년도, 나이, 전공ID) VALUES (2, '김영희', 2, 2023, 21,2);
INSERT INTO 학생 (학생ID, 이름, 학과ID, 입학년도, 나이, 전공ID) VALUES (3, '송종민', 3, 2023, 22,3);
INSERT INTO 학생 (학생ID, 이름, 학과ID, 입학년도, 나이, 전공ID) VALUES (4, '김다현', 4, 2022, 23,4);
INSERT INTO 학생 (학생ID, 이름, 학과ID, 입학년도, 나이, 전공ID) VALUES (5, '최사나', 5, 2022, 24,5);
INSERT INTO 학생 (학생ID, 이름, 학과ID, 입학년도, 나이, 전공ID) VALUES (6, '최대한', 6, 2024, 25,6);
INSERT INTO 학생 (학생ID, 이름, 학과ID, 입학년도, 나이, 전공ID) VALUES (7, '오주영', 7, 2023, 26,7);
INSERT INTO 학생 (학생ID, 이름, 학과ID, 입학년도, 나이, 전공ID) VALUES (8, '김도연', 8, 2017, 27,8);
INSERT INTO 학생 (학생ID, 이름, 학과ID, 입학년도, 나이, 전공ID) VALUES (9, '허만휘', 9, 2015, 28,9);
INSERT INTO 학생 (학생ID, 이름, 학과ID, 입학년도, 나이, 전공ID) VALUES (10, '김치형', 10, 2016, 29,10);



-- 전공테이블 - 임의의 컬럼pk용 번호포함 5컬럼(데이터는 10개행 씩 추가)
CREATE TABLE 전공 
(
  전공ID NUMBER NOT NULL 
, 전공명 VARCHAR2(50) NOT NULL 
, 학과ID NUMBER NOT NULL 
, 수강학생수 NUMBER NOT NULL 
, 학점 NUMBER NOT NULL 
, CONSTRAINT 전공_PK PRIMARY KEY 
  (
    전공ID 
  )
  ENABLE 
);

INSERT INTO 전공 (전공ID, 전공명, 학과ID, 수강학생수, 학점) VALUES (1, '국문학', 1, 52, 3);
INSERT INTO 전공 (전공ID, 전공명, 학과ID, 수강학생수, 학점) VALUES (2, '로봇공학', 2, 87, 3);
INSERT INTO 전공 (전공ID, 전공명, 학과ID, 수강학생수, 학점) VALUES (3, '철학', 3, 56, 3);
INSERT INTO 전공 (전공ID, 전공명, 학과ID, 수강학생수, 학점) VALUES (4, '재료공학', 4, 45, 4);
INSERT INTO 전공 (전공ID, 전공명, 학과ID, 수강학생수, 학점) VALUES (5, '디지털공학', 5, 89, 4);
INSERT INTO 전공 (전공ID, 전공명, 학과ID, 수강학생수, 학점) VALUES (6, '해부학', 6, 87, 3);
INSERT INTO 전공 (전공ID, 전공명, 학과ID, 수강학생수, 학점) VALUES (7, '물리학2', 7, 21, 4);
INSERT INTO 전공 (전공ID, 전공명, 학과ID, 수강학생수, 학점) VALUES (8, '전자기학', 8, 34, 2);
INSERT INTO 전공 (전공ID, 전공명, 학과ID, 수강학생수, 학점) VALUES (9, '재료화학', 9, 24, 3);
INSERT INTO 전공 (전공ID, 전공명, 학과ID, 수강학생수, 학점) VALUES (10, '경영학', 10, 52, 3);

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

--- 문자랜덤
select dbms_random.string('A',19)from dual;
--- 난수랜덤
select dbms_random.value() from dual;
--- 0~9 랜덤실수
select dbms_random.value()*10 from dual;
--- 0~9 랜덤정수
select floor(dbms_random.value()*10) from dual;
--- 1~45 로또정수
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

-- 실습
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
update test_board set con='즐거운 ORACLE SQL' where writer = 'yangssem';
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
 dname VARCHAR2(20) DEFAULT '개발부', 
 loc CHAR(1) CHECK(loc IN('1', '2')));
 
 CREATE TABLE test_emp(
 no NUMBER(4) PRIMARY KEY, 
 name VARCHAR2(20) NOT NULL, 
 loc VARCHAR2(4) CHECK(loc IN('서울', '부산')),
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
-- //여러 번 입력해주자.
insert into test_tab
values(test_tab_seq.nextval,'yangssem','서울','1234561234567',100); 
select rowid,num,fname,loc,jumin,deptno from test_tab;

--인덱스 생성
CREATE INDEX TEST_TAB_DEX ON TEST_TAB (FNAME);
--인덱스 검색
select index_name from user_indexes;
--인덱스 삭제
drop index test_tab_dex;

---인덱스 활용1. 정렬시 느린 order by 안 쓰고 index로 정렬가능
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
--    '서울',
--    '1234561234567',
--    100);
--    end loop;
--    commit;
--end;

-- //생성전
select num, fname from test_tab where fname >'0'; -- 인덱스 사용하라는 의미
-- //인덱스 생성
create index test_tab_idx on test_tab(fname);
select num, fname from test_tab where fname >'0' and rownum=1;









select * from member order by num desc;
select * from board order by num desc;