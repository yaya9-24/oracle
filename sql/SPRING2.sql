create sequence seq_member;

ALTER TABLE MEMBER  
MODIFY (PROFILE DEFAULT 'default.png' );

insert into
		member(num,id,pw,name,tel)
		values(seq_member.nextval,'admin5','hi1111','lee','010');

drop table board;        
CREATE TABLE BOARD 
(
  NUM NUMBER NOT NULL 
, TITLE VARCHAR2(50) NOT NULL 
, CONTENT VARCHAR2(2000) 
, WRITER VARCHAR2(20) NOT NULL 
, WDATE date default sysdate 
,img_name varchar2(50) default 'default.png'
, CONSTRAINT BOARD_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
drop sequence seq_board;
create sequence seq_board;

ALTER TABLE BOARD ADD CONSTRAINT BOARD_FK1 FOREIGN KEY(WRITER)
REFERENCES MEMBER(ID)ON DELETE CASCADE ENABLE;

select count(*) count from member ;

--시작행 끝행이 주어지면 해당 행들만 검색하세요.(rownum,row_number())
--1,5 : 1~5
--6,10 : 6~10

select * from (select member.*,rownum as rnum from member order by num desc)
where rnum between 6 and 10;

select * from (select row_number() over(order by num desc) as rnum, member.* from member)
where rnum between 6 and 10;

