--20200514        �������� ����       WebJSP/  WebServlet_93_Board_Mvc_Action_Notice_New / �ȿ��־� 
CREATE TABLE board(
board_num number,              --�۹�ȣ
board_name VARCHAR2(20),   --�ۼ���
board_pass  VARCHAR2(15),     --�ۼ��� ���
board_subject VARCHAR2(50),  --������
board_content VARCHAR2(2000), --�۳���
board_file VARCHAR(50), --���� ÷�ε� ���� �̸�
board_re_ref NUMBER,     --������(���� ����)
board_re_lev  NUMBER,    --���� ���� (�鿩����)(depth)
board_re_seq  NUMBER,   --���� ���� (step)
board_readcount NUMBER, --���� ��ȸ��
board_date DATE,          --�۾� ��¥
PRIMARY KEY(board_num)
);

alter table board
add notice varchar2(10);

desc board;

