import java.util.Arrays;

/*
 �迭�� ��ü��.
 1. �迭�� ��ü��(new���ؼ� ����)
 2. new �� ���ؼ� ��������� ����ڿ��� heap �� ���������.
 3. �����迭(�����迭) : �迭�� ũ��� �ѹ� �������� �����ȴ�.
 4. �迭�� �ʼ��� �ؾ��ϴ� �ڷᱸ���� �⺻�̴�.  // �Ի���趧 �ڷᱸ���� �⺻�̴�.  
    
 */
public class Ex01_Array_Basic {
	public static void main(String[] args) {
		 int s, s1, s2, s3;
		int[] score= new int[3]; //�̰� �迭�� ����� ���� ���� �����.  ���ȣ(÷��, index)
		System.out.println(score[0]);
		score[0] = 101; //������ �濡 (index)�� ����ؼ� ���� �־��ش�.
		score[1] = 20;
		score[2] = 300;
		System.out.println(score[0]);
		
		//���� ������ �׻� index������ 1ũ��. ((���ǰ���)n-1 == ������ index ���̴�)
		
		//score[3] = 40; //���� 3����.. ���������� index >> 2
		// java.lang.ArrayIndexOutOfBoundsException  
		//���ܰ� �߻��߾�(�����������)
		//�׷��� �����Ϸ��� ������ ���α׷��� ����..\
		//������ �߻��������� �ұ��ϰ� �ϴ� �����Ű�� ���Ѱ� (try ~catch����)
		//������ �ذ��ϴ� ���� �ƴϰ� ���α׷��� ���� ����Ǵ� ���� ���´�.
		System.out.println("END");  // 21���ٿ��� ������ ���⶧���� 27������ ������ �ȵ�.
		
		//Array �迭 (������ ���� �� �´� ����� : for��)
		for(int i=0;i<3;i++) {
			System.out.printf("[%d]=%d\t",i,score[i]);
		}
		System.out.println();
		for(int i = 0;i<score.length; i++) {//length�� �迭�� ����! �����ֳ�!
			System.out.printf("[%d]=%d\t",i,score[i]);
		}
		System.out.println();
		
		//Tip Array �����ִ� Ŭ����
		String result = Arrays.toString(score); //�����ϰ� �迭�ȿ� ������ �������ش�. ������ ������ ����������. for ���� �ͼ������� ������. ȸ��������� toString ���� ����!
		System.out.println(result);
		
		Arrays.sort(score);  //�ڵ����� �����ش�.  �굵 ������ ����������. for�� �����鼭 �����ؼ� ��ġ�ٲٴ� �۾��� �ؾ��Ѵ�. ���蹮���δ� ����! �����Ҷ� ������.
		System.out.println();
		result = Arrays.toString(score); 
		System.out.println(result);
		
		//�Ի���� ������  �迭���Ĺ����� ���� ���ϴ�. 
		
		//12,8,4,50  ��׸� ������� �����Ϸ��� ��ġ�Ҷ� ���� ���� ��� �����־��� ������ �ʿ��ϴ�.(�ڷᱸ����==�����͵��� �󸶳����� �������� ��ó?��ü�Ұų� �ϴ� �����̴�.����Ƚ���� ����..)
		
		//Today Point
		//�迭3����   �ܿ��!
		//���� ���� �ʴ� ����� ĥ�ǿ�..
		int[] arr = new int[5]; //�⺻ (���ǰ���)
		int[] arr2 = new int[] {100,200,300}; //�ʱⰪ�� ���ؼ� ���� ����� ���� �ʱ�ȭ
		int[] arr3 = {11,22,33,44,55}; //�����Ϸ��� �˾Ƽ� new�� �ڵ����� �Ѵ�. �̹���� ���� ���� ���ȴ�.
		//javascript : (var)let cararr = [1,2,3,4,5]; �ڹٶ� �ڹٽ�ũ��Ʈ����̴ٸ���.
		
		for(int i =0; i<arr3.length;i++) {
			System.out.println(arr3[i]);
		}
		
		//�迭�� ��ü��(new ...memory >> heap)
		int[] arr4; //�迭�� ��ü�⶧���� ����� �Ҵ��� �и��Ҽ��ֵ�.
		arr4 = new int[] {21,22,23,24,25};
		System.out.println("arr4 : " + arr4);
		//�迭�� �Ҵ��� (�ּҰ��Ҵ�)
		int[] arr5= arr4;
		//����
		System.out.println(arr5 == arr4);
		
		//Car c = new Car();
		//Car c2 = c;
		
		String[] strarr = new String[] {"��","��","�ٶ�"};
		char[] ch = new char[10]; //qlsanswk '\u0000'
		for(int i = 0;i< ch.length;i++) {
			System.out.println(">"+ch[i]+"<"); //���ڶ� > < �̷��Գ���
		}
		
		//8���� �⺻Ÿ�� +String >> Array Ÿ�԰���
		//**** Ŭ����Ÿ��(����� ���� Ÿ��) >> ArrayŸ�� ����
		//Car c = new Car();
		//Car c2 = new Car();
		//Car c3 = new Car();
		
		//Car[] cars = new car[10];    �̷��� �ϴ°� �ξ� ���ϱ��ϴ�.
		
				
		}
	}


