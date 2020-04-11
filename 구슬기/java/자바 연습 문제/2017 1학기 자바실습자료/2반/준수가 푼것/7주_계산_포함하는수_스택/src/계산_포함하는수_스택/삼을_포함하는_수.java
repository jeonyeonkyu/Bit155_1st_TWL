package 계산_포함하는수_스택;
import java.util.Random; // import
public class 삼을_포함하는_수 {
	public static void main(String[] args) {
		Random ran = new Random();
		int num = ran.nextInt(100) + 1 ;
		int i;
		
		
		System.out.println("난수 발생 : " + num);
		Conversion CV = new Conversion();
		int[] A = CV.multiplyThree(num);
		int[] B = CV.IncludeThree(num);
		System.out.print("3의 배수 : ");
		for(i=0 ; i<A.length ; i++){
			System.out.print(A[i] + " ");
			if((i+1)%5==0){
				System.out.println();
				System.out.print("\t");
			}
		}
		System.out.print("\n3을 포함하는 수 : ");
		for(i=0; i<B.length ; i++){
			System.out.print(B[i] + " ");
			if((i+1)%5==0){
				System.out.println();
				System.out.print("\t");
			}
		}
		
		
	}
}
