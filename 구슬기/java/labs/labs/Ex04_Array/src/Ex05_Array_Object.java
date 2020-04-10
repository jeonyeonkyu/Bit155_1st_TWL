import kr.or.bit.Emp;

public class Ex05_Array_Object {

	public static void main(String[] args) {
		// 1.��� 3���� ���弼�� (�� �迭�� ����ϼ���
		// 1000, "ȫ�浿"
		// 2000, "������"
		// 3000, "������"

		// 1�� ���
		Emp[] emps = new Emp[3]; // �游����Ű�.
		emps[0] = new Emp(); // ��ü �ּҸ� ������ش�
		emps[0].setEmpno(1000); // getter setter �Լ��� ���� �־��ش�
		emps[0].setEname("ȫ�浿");

		emps[1] = new Emp();
		emps[1].setEmpno(2000);
		emps[1].setEname("������");

		emps[2] = new Emp();
		emps[2].setEmpno(3000);
		emps[2].setEname("������");

		// ��� 3���� ����� �̸��� ����ϼ���.
		for (int i = 0; i < emps.length; i++) {
			emps[i].empInfoPrint();
		}

		// 2�� ���
		// int[] arr = new int[]{10,20,30}
		Emp[] emps2 = new Emp[] { new Emp(1000, "�̾�"), new Emp(1000, "�ھ�") };
		for (int i = 0; i < emps2.length; i++) {
			emps2[i].empInfoPrint();

			// 3�� ���
			// int[] arr = {10,20}
			Emp[] emps3 = { new Emp(3, "�达"), new Emp(4, "ȫ��") };
			for (int i1 = 0; i1 < emps3.length; i1++) {
				emps3[i1].empInfoPrint();

			}

		}
	}
}
