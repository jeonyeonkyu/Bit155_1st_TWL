package 문자열문자편집기_진수계산기_arrays클래스;

import java.util.Random;
import java.util.*;

public class arrays클래스 {
	public static void main(String[] args){
		
	}
}

class array{
	static int[] intarr = new int[10];
	static int[] ct = new int[10];
	String str;
	String[] strarr;
	void makearray(){
		Random rd = new Random();
		
		for(int i=0; i<intarr.length ; i++){
			intarr[i] = rd.nextInt(10);
		}
		System.out.println("난수 발생");
		str =Arrays.toString(intarr);
		System.out.print("생성된 배열 : " + str);
		/*
		System.out.print("[");
		for(int i=0; i<intarr.length ; i++){
			System.out.print(intarr[i]);
			if(i==(intarr.length-1)){
				break;
			}
			System.out.print(", ");
		}
		System.out.print("]");
		*/
	}
	void arraytrans(){
		for(int i=0; i<intarr.length ; i++){
			ct[intarr[i]]++;
		}
		System.out.print("\n변환된 값 출력 : ");
		for(int i=0; i<intarr.length ; i++){
			if(ct[intarr[i]]!=0){
				System.out.print(intarr[i]);
				System.out.print(ct[i]);
			}
		}
	}
	void printarray(){
	}
}