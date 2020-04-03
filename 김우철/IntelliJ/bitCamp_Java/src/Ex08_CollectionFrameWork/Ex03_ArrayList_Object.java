package Ex08_CollectionFrameWork;

import Ex08_CollectionFrameWork.kr.or.bit.Emp;

import java.util.ArrayList;
public class Ex03_ArrayList_Object {

    public static void main(String[] args) {
        //사원 1명을 만드세요
        Emp emp = new Emp(100,"김유신","군인");
        System.out.println(emp.toString());

        //Array(고정배열)
        //사원 2명 만드세요
        Emp[] emplist = {new Emp(100,"김씨","일반인"), new Emp(200,"박씨","학생")};
        for(Emp e : emplist) {
            System.out.println(e.toString());
        }
        //한명이 입사를 더 했네요 ... 추가 시키세요 (x)

        //Collection
        ArrayList list = new ArrayList();
        list.add(new Emp(1,"강","IT"));
        list.add(new Emp(2,"홍","IT"));
        System.out.println(list);
        //System.out.println(list.toString());
        //[xx번지.toString() , yy번지.toString()]
        System.out.println(list.get(0)); //Emp [empno=1, ename=강, job=IT]
        //toString .....
        //toString 활용하지 말고 사원 출력해 보세요
        //일반 for문
        for(int i = 0 ; i < list.size() ; i++) {
            //list.get(i)
            //Object obj = list.get(i);
            //Emp e = (Emp)obj;
            //System.out.println(obj);


            Emp e = (Emp)list.get(i); //부모 >> 자식 >> 자식타입에 맞게 casting
            System.out.println(e.getEmpno() + "/" + e.getEname() + "/" + e.getJob());
        }

        //toString 사용하지 말고 개선된 for 문으로 출력하세요
        //왕짜증 ... 캐스팅 ..... 다운 .... 다형성 .....
        //제너릭 (타입을 강제해 )
        for(Object obj : list) {
            Emp e = (Emp)obj;
            System.out.println(e.getEmpno() + "/" + e.getEname() + "/" + e.getJob());
        }

        //Object 불편함 .. generic
        ArrayList<Emp> list2 = new ArrayList<Emp>(); //내가 가지는 방의 타입은 Emp 타입
        list2.add(new Emp(1,"A","IT"));
        list2.add(new Emp(2,"B","IT"));

        for(Emp e : list2) {
            System.out.println(e.getEmpno() + "/" + e.getEname() + "/" + e.getJob());
        }

        //그래서 ... 신규 사원 입사 ....
        list2.add(new Emp(3,"New","New"));
    }

}
