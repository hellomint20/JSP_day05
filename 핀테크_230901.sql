create table test_board(
id number(4) primary key, --�۹�ȣ
name varchar2(20),
title varchar2(100),
content varchar2(300),
savedate date default sysdate, -- �� ��Ͻ� �ڵ� ��¥ ���
hit number(4) default 0, --��ȸ�� �ڵ� ���
idgroup number(4), -- ���� �۵� ��Ƶδ� �÷�
step number(4), -- ��� ������ ����
indent number(4) -- ��� �鿩���� Ƚ��
);
create sequence test_board_seq;  

commit;