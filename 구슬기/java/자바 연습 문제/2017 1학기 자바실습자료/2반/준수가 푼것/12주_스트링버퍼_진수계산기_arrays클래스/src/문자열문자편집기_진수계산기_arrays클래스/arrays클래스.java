package ���ڿ�����������_��������_arraysŬ����;

import java.util.Random;
import java.util.*;

public class arraysŬ���� {
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
		System.out.println("���� �߻�");
		str =Arrays.toString(intarr);
		System.out.print("������ �迭 : " + str);
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
		System.out.print("\n��ȯ�� �� ��� : ");
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