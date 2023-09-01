create table test_board(
id number(4) primary key, --글번호
name varchar2(20),
title varchar2(100),
content varchar2(300),
savedate date default sysdate, -- 글 등록시 자동 날짜 등록
hit number(4) default 0, --조회수 자동 등록
idgroup number(4), -- 같은 글들 모아두는 컬럼
step number(4), -- 답글 끼리의 정렬
indent number(4) -- 답글 들여쓰기 횟수
);
create sequence test_board_seq;  

commit;