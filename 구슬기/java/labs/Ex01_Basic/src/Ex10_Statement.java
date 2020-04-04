import java.util.Scanner;

public class Ex10_Statement {

	public static void main(String[] args) {
		// 반복문(while , do ~wile)
		int i = 10; // local variable
		while (i >= 10) { // 조건true
			System.out.println(i);
			// 반드시 조건에 증가감을 통해 true false를 만들어 주어야함
			i--;
		}

		// while(1~100) 까지의 합
		// 누적값 : 지역변수

//		int sum=0;
//		int j = 1;
//		while(j <=100) {
//			sum += j; //sum = sum+j;
//			j++;
//		}
//		System.out.println("1~100까지의 합 : " +sum); //5050 이게 맞는 것 
//		

		int sum = 0;
		int j = 1;
		while (j <= 100) {
			j++;
			sum += j;
			// 주의 합시다 (순서 고민 )
		}
		System.out.println("1~100까지의 합 : " + sum); // 5150 더하고 바로 false 가 아니라 더하고 합한 후 false로 됨 오차생김

		// while 구구단 출력하세요
		// 로컬변수와 블럭변수의 차이를 이해해야 풀수있음
		int k = 2;
		int w = 1;
		while (k <= 9) {
			w = 1; // w를 다시 1로 초기화
			while (w <= 9) {
				System.out.printf("[%d]*[%d]=[%d]\t", k, w, k * w);
				w++; // 마지막에 10이 되기때문에 위에서 초기화해주는거임

			}
			System.out.println();
			k++;
		}

		// while(true) {if(true) {break;}}

		// do~while : 강제적 수행 .. 무조건 한번은 실행 되게 하겠다(거짓이던 뭐던)
		// do {실행문} while(조건)
		// 메뉴 구성
		// 1.인사
		// 2.급여
		// 당신이 원하는 업무 번호를 입력하세요? do { } 무조건
		// 입력값: 3 while(조건) 에서 판단

		Scanner sc = new Scanner(System.in);
//		int inputdata = 0;
//		do {
//			System.out.println("숫자 입력해(0~9)");
//			inputdata = Integer.parseInt(sc.nextLine());
//		}while(inputdata >= 10); //조건이 true 이면 do 문을 계속 실행
//		//while 조건 값이 true 가 나온다면 do{}을 계속 반복해라
//		//탈출은 inputdata 값이 0~9 온다면 조건 false 반환... 더이상 실행하지 않음
//		System.out.println("당신이 입력한 숫자는 : "+ inputdata);
		
		
		
		
		
		//A~Z
		int alpha = 65; 
		for( alpha =65 ; alpha<91 ; alpha++) {
			System.out.println((char)(alpha));
		}
		
		//1~100  까지 10행10열

		for (int s = 1; s <= 100; s++) {
			System.out.printf("%d\t",s); 
			if(s%10 ==0) {
				System.out.println();
			}
		}
		
		
		//1부터 20까지의 정수 중에서 2또는 3의 배수가 아닌 수의 총합을 구하는 프로그램을 작성하세요.
		int sum5 =0;
		for(int i1 = 1; i1 <=20; i1++) {
			if(i1%2 !=0 && i1%3 !=0) {
				sum +=i1;
		}
		}
		System.out.println("2또는 3의 배수가 아닌 수의 총합:"+sum);
		//2개의 주사위를 던졌을때 눈의 합이 6이 되는 모든 경우의 수를 출력하는 프로그램을 작성하세요.
		int j1 = 0;
		int k1 = 0;
		for(j1 = 1; j1<=6;j1++) {
			for (k1 =1; k1<=6; k1++) {
				if(j1 + k1 == 6) {
					System.out.println("주사위1의 값 : "+j1 + "주사위2의 값: "+ k1);
				}
			}
		}

		
		
		//가위바위보 프로그램
		int user = 0;
        int com;
        Scanner s= new Scanner(System.in);
        System.out.println("가위: 1, 바위: 2, 보: 3");
        user = Integer.parseInt(s.nextLine());
        com = ((int)(Math.random()*3)+1);
        if(user == com) {
            System.out.println("비겼습니다");
        }else if(user==1 && com==2 || user ==2 && com==3 || user == 3 && com==1) {
            System.out.println("컴퓨터 승리");
        }else if(user==1 && com==3 || user ==2 && com==1 || user == 3 && com==2) {
            System.out.println("사용자 승리");
        }
		
        
		
        
        
		
		
	

	}
	}



