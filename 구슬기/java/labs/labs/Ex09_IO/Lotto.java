package kr.or.bit;

import java.util.Random;
import java.util.Scanner;

/*   
 *1. 1~45까지의 난수를 발생시켜 6개의 배열에 담으세요
      (int)(Math.random()*45 + 1)
      lotto[0] = 44 , lotto[1] = 1 .... lotto[5] = 33
 *2. 배열에 담긴 6개의 배열값은 중복값이 나오면 안되요  (중복값 검증 :별찍기 비슷)     기능
 *3. 배열에 있는 6개의 값은 낮은 순으로 정렬 시키세요  (정렬 : 자리바꿈)             기능
 *4. 위 결과를 담고 있는 배열을 출력하세요 (화면 출력)                           기능

 추후에는 별도의 클래스 분리해서 Lotto.java ..... 
 현재 main 함수 안에서 사용 ....연습...

조별 1개 입니다
  
  
  타입 : 8가지 +String + class + 배열(Array) :배열도 하나의 타입임
  8가지 기본타입 빼고 나머지는 다 주소값을 받는다.

 */
//설계도
//클래스의 멤버필드는 배열이던 클래스이던 초기화는 생성자에서 하자  !!! 필요하다면 오버로딩
public class Lotto {
	// public int[] numbers; //다른 패키지에서 사용하려하니까 public 보호하려면 캡슐화
	// public int[] numbers = new int[6]; 틀린코드 아녜여
//	private int numbers; //여기에서 초기화하는 것보다 25번처럼 하는게 좋아보인
//	
//	public Lotto() { //생성자, 목적은 멤버필드 초기화
//		this(10); //this생성자를 쓰면 더 이쁘대..    //객체를 생성하면 10이 자동으로 들어간다.
//	}
//	public Lotto(int numbers) {               // 객체를 만들때마다 숫자를 입력할수있다.
//		this.numbers=numbers;
//	}

	private int[] numbers; // 초기화는 생성자에서 하는게 좋다.
	private Scanner scanner; // =new Scanner(System.in);
	private Random r; // = new Random();

	public Lotto() {
		// 초기화(member field)
		numbers = new int[6];
		scanner = new Scanner(System.in);
		r = new Random();
	}
	// 기능....(method)안에서 >>함수 하나당 기능 한개만
	// 무슨 번호 추출해주세요.
	// 중복값이 나오면 안되요
	// 낮은 순으로 정렬 시키세요
	// 출력하세요 (화면출력)
	// 메뉴 기능.....선택...
	// 1>> 로또 추출
	// 2>> 프로그램 종료

	public void selectLottoNumber() {
		loop_1: while (true) {
			String selectionnum = showMenu(scanner);
			switch (selectionnum) {
			case "1":
//			makeLottoNumber(r,numbers); //이렇게 안해도 쓰지만, 연습하기위해 파라메터 를 채운다. r은 주소값 numbers는 배열의 주소값     //실번호추출
//			showLottoNumbers(); //정렬 하고 출력하기
				do {
					makeLottoNumber(r, numbers);
				} while (!checkAverage());
				showLottoNumbers();
				checkNum();
				
				break;
			case "2": // 프로그램 종료 : return (함수 탈출), System.exit(0), 라벨 값
				System.out.println("Good Lucky^^");
				break loop_1; // break 하게되면 라벨 꽂아놓은 곳에서부터 다시 돈다. 원래는 스위치 탈출하는 브레이크하면 와일문을 빠진다. 굉장히 특수한 문법임.(라벨
								// 이름은 상관없음)
			default:
				System.out.println("Not in Operation~~");
				break;
			}
		}
	}

	// private 으로 한 개발자의 의도는 무엇일까?
	// 내부에서만 사용하겠다.감춰둔거임 밖에선 퍼블릭.
	private String showMenu(Scanner sc) { // 연습이니까 (parameter)연습할거임
		System.out.println("******************");
		System.out.println("*1. 당첨예상 번호 호출*");
		System.out.println("*2. 프로그램 종료 ^^!*");
		System.out.println("******************");
		System.out.println("원하는 작업 번호를 입력하세요:");
		String selectionnum = sc.nextLine();
		return selectionnum;
	}

	// 번호추출, 중복값 배제
	private void makeLottoNumber(Random r, int[] numbers) { // parameter연습
		for (int i = 0; i < 6; i++) {
			numbers[i] = r.nextInt(45) + 1;// (int) (Math.random() * 45 + 1); 얘보다 편하다.
			for (int j = 0; j < i; j++) { // j < i (채워진 개수 만큼 비교)
				if (numbers[i] == numbers[j]) {
					i--; // point 같은 방의 값을 바꾸어여 한다
					break;
				}
			}
		}
	}

	// 화면에 출력하는 기능 하나뽑음
	private void showLottoNumbers() {
		System.out.println("[선택한 Lotto 번호]");

		for (int i = 0; i < numbers.length; i++) {
			for (int j = i + 1; j < numbers.length; j++) {
				if (numbers[i] > numbers[j]) {
					int temp = numbers[i];
					numbers[i] = numbers[j];
					numbers[j] = temp;
				}
			}
		}
		for (int i = 0; i < numbers.length; i++) {
			System.out.printf("[%2d]",numbers[i]);
		}
		System.out.println();

	}

	// 규칙을 발견했다! (배열의 합의 평균이 특정 범위에서 벗어나면 재추출)
	private boolean checkAverage() {
		int sum = 0;
		int average = 0;
		for (int num : numbers) {
			sum += num;
		}
		average = sum / numbers.length;
		System.out.println("평균 : " + average);
		return (average >= 15 && average <= 35); // true , false 를 내보낸다. 내가원하는 평균의 범위가 아니면 다시 뽑게 하고싶다. 그걸 스위치문에서함.
	}
	
	//홀수 짝수 나누기
	private void checkNum() {
		System.out.print("짝수 : ");
        for (int i = 0; i < numbers.length; i++) {
            if(numbers[i]%2==0) {
                System.out.printf("[%2d]",numbers[i]);}
        }
        System.out.println();
        System.out.print(" 홀수 : ");
            for (int i = 0; i < numbers.length; i++) {      
            if(numbers[i]%2!=0){
                System.out.printf("[%2d]",numbers[i]);}
        }
            {
        System.out.println();
	}
	

}
