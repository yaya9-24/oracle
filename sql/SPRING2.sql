create sequence seq_member;

ALTER TABLE MEMBER  
MODIFY (PROFILE DEFAULT 'default.png' );

insert into
		member(num,id,pw,name,tel)
		values(seq_member.nextval,'admin5','hi1111','lee','010');