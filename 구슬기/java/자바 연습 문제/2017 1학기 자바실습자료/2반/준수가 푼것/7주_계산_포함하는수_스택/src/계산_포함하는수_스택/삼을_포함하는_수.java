package ���_�����ϴ¼�_����;
import java.util.Random; // import
public class ����_�����ϴ�_�� {
	public static void main(String[] args) {
		Random ran = new Random();
		int num = ran.nextInt(100) + 1 ;
		int i;
		
		
		System.out.println("���� �߻� : " + num);
		Conversion CV = new Conversion();
		int[] A = CV.multiplyThree(num);
		int[] B = CV.IncludeThree(num);
		System.out.print("3�� ��� : ");
		for(i=0 ; i<A.length ; i++){
			System.out.print(A[i] + " ");
			if((i+1)%5==0){
				System.out.println();
				System.out.print("\t");
			}
		}
		System.out.print("\n3�� �����ϴ� �� : ");
		for(i=0; i<B.length ; i++){
			System.out.print(B[i] + " ");
			if((i+1)%5==0){
				System.out.println();
				System.out.print("\t");
			}
		}
		
		
	}
}
