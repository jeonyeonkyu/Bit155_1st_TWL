
import java.util.List;
import java.util.Scanner;

import DAO.DeptDao;
import DTO.Dept;

public class Program {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        DeptDao dao = new DeptDao();
        while (true) {
            System.out.println("1.��ü��ȸ 2.������ȸ 3.�����ͻ��� 4.������ ���� 5.������ ����");
            int num = Integer.parseInt(in.nextLine());
            switch (num) {
                case 1: //��ü��ȸ
                    System.out.println("[��ü��ȸ]************");
                    List<Dept> deptlist = dao.getDeptAllList();
                    if (deptlist != null) {
                        DeptPrint(deptlist);
                    }
                    break;
                case 2: //������ȸ
                    System.out.println("��ȸ�� deptno ��ȣ");
                    int deptno = Integer.parseInt(in.nextLine());
                    System.out.println("[������ȸ]************");
                    Dept dept2 = dao.getDeptListByDeptno(deptno);
                    if (dept2 != null) {
                        System.out.println(dept2.toString());
                    }
                    break;
                case 3: //������ ����
                    Dept dept3 = new Dept();
                    System.out.println("������ �μ���ȣ ");
                    dept3.setDeptno(Integer.parseInt(in.nextLine()));
                    System.out.println("������ �μ��̸� ");
                    dept3.setDname(in.nextLine());
                    System.out.println("������ �μ����� ");
                    dept3.setLoc(in.nextLine());
                    int num3 = dao.insertDept(dept3);
                    if (num3 > 0) {
                        System.out.println("������ ���� ����");
                    } else {
                        System.out.println("������ ���� ����");
                    }
                    break;
                case 4: //����
                    Dept dept4 = new Dept();
                    System.out.println("�μ��̸��� ������ ������ �μ���ȣ");
                    dept4.setDeptno(Integer.parseInt(in.nextLine()));
                    System.out.println("������ �μ��̸� ");
                    dept4.setDname(in.nextLine());
                    System.out.println("������ �μ����� ");
                    dept4.setLoc(in.nextLine());
                    int num4 = dao.updateDept(dept4);
                    if (num4 > 0) {
                        System.out.println("������ ���� ����");
                    } else {
                        System.out.println("������ ���� ����");
                    }
                    break;
                case 5: //����
                    System.out.println("������ �μ���ȣ");
                    int num5 = dao.deleteDept(Integer.parseInt(in.nextLine()));
                    if (num5 > 0) {
                        System.out.println("������ ���� ����");
                    } else {
                        System.out.println("������ ���� ����");
                    }
                    break;
            }
        }
    }

    public static void DeptPrint(List<Dept> list) {
        for (Dept dept : list) {
            System.out.println(dept.toString());
        }
    }

}