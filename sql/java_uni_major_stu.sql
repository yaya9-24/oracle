-- 학교, 학과, 전공, 학생 한 번에 데이터 생성하기

-- 학교테이블 - 임의의 컬럼pk용 번호포함 5컬럼(데이터는 10개행 씩 추가)-----
drop table 대학교 cascade constraints;
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

drop sequence seq_universary;
create sequence seq_universary;
exec pc_universary_insert;

------ end 학교테이블 ----------------

-- 학과테이블 - 임의의 컬럼pk용 번호포함 5컬럼(데이터는 10개행 씩 추가) ------
drop table 학과 cascade constraints;
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

drop sequence seq_major;
create sequence seq_major;
exec pc_major_insert;

-----------end 학과테이블 ------------------------

-- 학생테이블 - 임의의 컬럼pk용 번호포함 5컬럼(데이터는 10개행 씩 추가)
drop table 학생;
CREATE TABLE 학생 
(
  학생ID NUMBER NOT NULL 
, 이름 VARCHAR2(40) NOT NULL 
, 학과ID NUMBER NOT NULL 
, 입학년도 NUMBER NOT NULL 
, 나이 NUMBER NOT NULL
, 전공ID NUMBER NOT NULL
, CONSTRAINT 학생_PK PRIMARY KEY 
  (
    학생ID 
  )
  ENABLE 
);

drop sequence seq_student;
create sequence seq_student;
exec pc_student_insert;

----------end 학생테이블 ------------


-- 전공테이블 - 임의의 컬럼pk용 번호포함 5컬럼(데이터는 10개행 씩 추가)
drop table 전공 cascade constraints;
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

drop sequence seq_jg;
create sequence seq_jg;
exec pc_jg_insert;

---------end 전공테이블 --------

-----참조 제약조건 추가---------------
ALTER TABLE 학과 ADD CONSTRAINT 학과_FK1 FOREIGN KEY(대학교ID)
    REFERENCES 대학교(대학교ID)ENABLE;
ALTER TABLE 학생 ADD CONSTRAINT 학생_FK1 FOREIGN KEY(학과ID)
    REFERENCES 학과(학과ID)ENABLE;
ALTER TABLE 학생 ADD CONSTRAINT 학생_FK2 FOREIGN KEY(전공ID )
    REFERENCES 전공(전공ID )ENABLE;