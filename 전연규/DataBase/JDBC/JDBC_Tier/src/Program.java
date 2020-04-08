
import java.util.List;
import java.util.Scanner;

import DAO.DeptDao;
import DTO.Dept;

public class Program {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        DeptDao dao = new DeptDao();
        while (true) {
            System.out.println("1.전체조회 2.조건조회 3.데이터삽입 4.데이터 수정 5.데이터 삭제");
            int num = Integer.parseInt(in.nextLine());
            switch (num) {
                case 1: //전체조회
                    System.out.println("[전체조회]************");
                    List<Dept> deptlist = dao.getDeptAllList();
                    if (deptlist != null) {
                        DeptPrint(deptlist);
                    }
                    break;
                case 2: //조건조회
                    System.out.println("조회할 deptno 번호");
                    int deptno = Integer.parseInt(in.nextLine());
                    System.out.println("[조건조회]************");
                    Dept dept2 = dao.getDeptListByDeptno(deptno);
                    if (dept2 != null) {
                        System.out.println(dept2.toString());
                    }
                    break;
                case 3: //데이터 삽입
                    Dept dept3 = new Dept();
                    System.out.println("삽입할 부서번호 ");
                    dept3.setDeptno(Integer.parseInt(in.nextLine()));
                    System.out.println("삽입할 부서이름 ");
                    dept3.setDname(in.nextLine());
                    System.out.println("삽입할 부서지역 ");
                    dept3.setLoc(in.nextLine());
                    int num3 = dao.insertDept(dept3);
                    if (num3 > 0) {
                        System.out.println("데이터 삽입 성공");
                    } else {
                        System.out.println("데이터 삽입 실패");
                    }
                    break;
                case 4: //수정
                    Dept dept4 = new Dept();
                    System.out.println("부서이름과 지역을 수정할 부서번호");
                    dept4.setDeptno(Integer.parseInt(in.nextLine()));
                    System.out.println("수정할 부서이름 ");
                    dept4.setDname(in.nextLine());
                    System.out.println("수정할 부서지역 ");
                    dept4.setLoc(in.nextLine());
                    int num4 = dao.updateDept(dept4);
                    if (num4 > 0) {
                        System.out.println("데이터 삽입 성공");
                    } else {
                        System.out.println("데이터 삽입 실패");
                    }
                    break;
                case 5: //삭제
                    System.out.println("삭제할 부서번호");
                    int num5 = dao.deleteDept(Integer.parseInt(in.nextLine()));
                    if (num5 > 0) {
                        System.out.println("데이터 삭제 성공");
                    } else {
                        System.out.println("데이터 삭제 실패");
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