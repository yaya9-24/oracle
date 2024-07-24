-- �б�, �а�, ����, �л� �� ���� ������ �����ϱ�

-- �б����̺� - ������ �÷�pk�� ��ȣ���� 5�÷�(�����ʹ� 10���� �� �߰�)-----
drop table ���б� cascade constraints;
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

drop sequence seq_universary;
create sequence seq_universary;
exec pc_universary_insert;

------ end �б����̺� ----------------

-- �а����̺� - ������ �÷�pk�� ��ȣ���� 5�÷�(�����ʹ� 10���� �� �߰�) ------
drop table �а� cascade constraints;
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

drop sequence seq_major;
create sequence seq_major;
exec pc_major_insert;

-----------end �а����̺� ------------------------

-- �л����̺� - ������ �÷�pk�� ��ȣ���� 5�÷�(�����ʹ� 10���� �� �߰�)
drop table �л�;
CREATE TABLE �л� 
(
  �л�ID NUMBER NOT NULL 
, �̸� VARCHAR2(40) NOT NULL 
, �а�ID NUMBER NOT NULL 
, ���г⵵ NUMBER NOT NULL 
, ���� NUMBER NOT NULL
, ����ID NUMBER NOT NULL
, CONSTRAINT �л�_PK PRIMARY KEY 
  (
    �л�ID 
  )
  ENABLE 
);

drop sequence seq_student;
create sequence seq_student;
exec pc_student_insert;

----------end �л����̺� ------------


-- �������̺� - ������ �÷�pk�� ��ȣ���� 5�÷�(�����ʹ� 10���� �� �߰�)
drop table ���� cascade constraints;
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

drop sequence seq_jg;
create sequence seq_jg;
exec pc_jg_insert;

---------end �������̺� --------

-----���� �������� �߰�---------------
ALTER TABLE �а� ADD CONSTRAINT �а�_FK1 FOREIGN KEY(���б�ID)
    REFERENCES ���б�(���б�ID)ENABLE;
ALTER TABLE �л� ADD CONSTRAINT �л�_FK1 FOREIGN KEY(�а�ID)
    REFERENCES �а�(�а�ID)ENABLE;
ALTER TABLE �л� ADD CONSTRAINT �л�_FK2 FOREIGN KEY(����ID )
    REFERENCES ����(����ID )ENABLE;