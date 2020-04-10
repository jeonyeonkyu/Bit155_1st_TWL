import java.util.ArrayList;

import kr.or.bit.CopyEmp;

class Product {
	int price;
	int bonuspoint;

	Product(int price) {
		this.price = price;
		this.bonuspoint = (int) (this.price / 10.0);
	}
}

class KtTv extends Product { 
	KtTv() {
		super(500); 
	}

	@Override
	public String toString() {
		return "KtTv"; 
	}

}

class Audio extends Product { 
	Audio() {
		super(100);
	}

	@Override
	public String toString() {
		return "Audio";
	}
}

class NoteBook extends Product { 
	NoteBook() {
		super(150);
	}

	@Override
	public String toString() {
		return "NoteBook";
	}
}
 class Emp {
	 int empno;
	 String ename;
	 String job;
	 
	 Emp(int empno, String ename, String job){
		 this.empno = empno;
		 this.ename = ename;
		 this.job =job;
	 }
	
	
 }
public class Ex07_Generic_Quiz {
	public static void main(String[] args) {
		System.out.println("------------------1--------------------");
		
		//1. Array �迭�� ����ؼ� cart ����� ��ǰ�� �������� (Tv, Audio, Notebook)
		Product[] Cart = {new NoteBook(),new Audio(),new KtTv()};
		
		System.out.println("------------------2--------------------");
		
		//2.ArrayList�� ����ؼ� cart�� ����� ��ǰ�� ��������. (Tv, Audio, Notebook)
		//��,generic ����ϼ���
		//��ǰ�� �̸��� ����ϼ���
		ArrayList<Product> plist = new ArrayList<Product>();
		plist.add(new NoteBook());
		plist.add(new Audio());
		plist.add(new KtTv());
		System.out.println(plist.toString());
		
		System.out.println("------------------3--------------------");
		
		//3. EmpŬ������ ����ؼ� ��� 3���� ���弼��. 
		//, �� ArrayList<>�� ����ϼ���.
		ArrayList<Emp> elist = new ArrayList<Emp>();
		elist.add(new Emp(1,"ȫ","IT"));
		elist.add(new Emp(2,"��","IT"));
		elist.add(new Emp(3,"��","IT"));
		
		System.out.println("------------------4--------------------");
		
		//4. ����� ����(���, �̸�, ����) �� ������ for���� ����ؼ� ����ϼ���
		//toString �������������.
		for(Emp e : elist) {
			System.out.println(e.empno +e.ename + e.job);
		}
		
		System.out.println("------------------5--------------------");
		
		//5. ����� ����(���, �̸�, ����) �� �Ϲ� for���� ����ؼ� ����ϼ���
				//toString �������������.
		for(int i = 0;i<elist.size();i++) {
			System.out.println(elist.get(i).empno +
					elist.get(i).ename+
					elist.get(i).job);
			
		}
		
		System.out.println("------------------6--------------------");
		
		// 6.CopyEmp ��� Ŭ������ ���弼��(Emp �� ������)
				// job member field ��ſ� >>
				// private int sal; �� �ٲپ ���弼��(getter ,setter ����)
				// kr.or.bit.CopyEmp �� �ϼ���
				// ArrayList<> ���ʸ� ����ؼ� ��� 3�� ���弼��
				// �Ʒ� ������ ���
				// 100,"��",1000
				// 200,"��",2000
				// 300,"��",3000
		ArrayList<CopyEmp> clist = new ArrayList<CopyEmp>();
		clist.add(new CopyEmp(100, "��", 1000));
		clist.add(new CopyEmp(200, "��", 2000));
		clist.add(new CopyEmp(300, "��", 3000));
		System.out.println(clist.toString());
		
		System.out.println("------------------7--------------------");
		
		// 7.200�� ����� �޿��� 5000���� �����ؼ� ����ϼ���(�Ϲ� for�� �ȿ��� ....)
		//set �Լ�
		for(int i =0;i<clist.size();i++) {
			if(i==1) {
				clist.get(i).setSal(5000);
			}
			System.out.println(clist.get(i));
		}
		System.out.println("------------------7--------------------");
		//�����Դ�
		for(int i =0;i<clist.size();i++) {
			if(clist.get(i).getEmpno()==200) {
				clist.get(i).setSal(5000);
				System.out.println(clist.get(i).toString());
			}
		}
		System.out.println("------------------8--------------------");
				
		// 8.300�� ����� �̸��� "�ñ���" �� �����ؼ� ����ϼ���(������ for�� �ȿ��� ....)
		//set �Լ�
		for(CopyEmp c : clist) {
			clist.get(2).setEname("�ñ���");
			System.out.println(c);
		}
		//�����Դ�
		for(CopyEmp emp : clist) {
			if(emp.getEmpno()==300) {
				emp.setEname("�ñ���");
				System.out.println(emp.toString());
			}
		}
	}

}
