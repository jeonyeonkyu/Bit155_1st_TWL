import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Ex02_ArrayList {

	//Today Point
	public static void main(String[] args) {
	ArrayList arraylist = new ArrayList();
	
	arraylist.add(100);
	arraylist.add(200);
	arraylist.add(300);
	
	for(int i = 0; i<arraylist.size() ; i++) {
		System.out.println(arraylist.get(i));      
	}
	
	System.out.println(arraylist.toString());   //[100, 200, 300]
	
	//Ư������ ���� ���� ������
	System.out.println("Ư���濡 �ִ� ��:"+ arraylist.get(0)); //Ư���濡 �ִ� ��:100
	
	//add ���������� ������ �ֱ�
	//arraylist.add overloading....index , element
	arraylist.add(0, 111); // 0��° �濡 111�� ���.   ������ʴ´�.
	System.out.println(arraylist.toString()); //[111, 100, 200, 300] Ư���濡 ���� �ָ� �̷��� �����ְ� ���������� �ڷ� �з�����.
	arraylist.add(4, 444);
	System.out.println(arraylist.toString()); //[111, 100, 200, 300, 444]   
	
	//��������� ������ �߰�, ���� >> ArrayList (������ �ִ� ������ ����)
	//õ���ϰ�쿡 0���濡 ���������� �����͵��� 1000�� �������� �ϴ�...���������ʴ�.
	//�������� ������ �߰�, ������ �����Ѵ�.^^*  �̹� ���ִ� �� �ڿ� �߰��ϰ�, �ڿ��� ���� �߶󳻴� ������ �����Ѵ�. 
	
	//������ ����(add) : �߰�>> ������ ������ �̵�
	//������ ����...
	//arraylist.remove(index)
	//arraylist.add(index, element);
	
	//ArrayList �� ������ �Լ��� �н��ϸ� �ȴ�!!!  ��ġ ��Ʈ���� �Լ�����ó��
	//���ΰ� Ž���� �˷��ִ� �Լ� contains
	System.out.println(arraylist.contains(200));  //200�� ���ԵǾ������� true  
	System.out.println(arraylist.contains(5555)); //false
	
	//isEmpty   �� ����ִ�?
	System.out.println(arraylist.isEmpty()); //false �� ��������ʾ�.
	                                         //true  >> size ==0 
	
	//clear  
	arraylist.clear(); //siza ==0
	System.out.println(arraylist.isEmpty()); //ture
	
	//�� ������ ����� 0������ ä������. 
	arraylist.add(101);
	arraylist.add(102);
	arraylist.add(103);
	System.out.println(arraylist.toString()); //[101, 102, 103] 
	
	//remove ����
	System.out.println("������ :"+ arraylist.size());   //������ :3
    Object value = arraylist.remove(0);              //0��° ���� ���� ����       
    System.out.println("������ ������:"+ value);         //������ ������:101     ��������ʰ� ���ڸ��� ä������� �ڿ� �ֵ��� �������.
    System.out.println(arraylist.toString());        //[102, 103]
    
    //POINT-----------------------------------------------------------------------------------------------
    //������..... �ϻ�ٹݻ�ó�� ����Ѵ�...�������
    List li = new ArrayList(); //������...?     List��  ArrayList  Type �Ǻθ��      
                               // li �� �پ��� �ֵ��� ������ �ִ�.      ������ >> Ȯ�强, ������
    //li.add(e)
    //ArrayList alist = new ArrayList();   //�̷��� �ᵵ ������ ����.    �̰ź��� ������ ���� �� �����Ѵ�.
    li.add("��");
    li.add("��");
    li.add("��");
    li.add("��");
    
    List li4 = li.subList(0, 2);   //sublist�� ������ִ� �����Ͱ� �ᱹ���� ������ �ִ� ������ �����̱���. ��? List�� �޾����ϱ�
    System.out.println(li4.toString()); // [��, ��]   
    
    ArrayList alist = new ArrayList();
    alist.add(50);
    alist.add(1);
    alist.add(7);
    alist.add(40);
    alist.add(45);
    alist.add(3);
    alist.add(15);
    
    //Arrays.Sort(a);
    
    System.out.println("before : "+ alist.toString());  //before : [50, 1, 7, 40, 45, 3, 15]
    Collections.sort(alist);    //�ʺ������ڰ� �̰� ���� �Ƿ��� ���� �ʴ´�... 
    System.out.println("after : "+ alist.toString());  //after : [1, 3, 7, 15, 40, 45, 50]
   
    //[1, 3, 7, 15, 40, 45, 50]  ū�������� �����ϴ� ���?  �̹� sort�� ���ĵȰŸ� ������ 
    
    Collections.reverse(alist);   
    System.out.println("reverse : "+ alist.toString()); //reverse : [50, 45, 40, 15, 7, 3, 1]
    
    //�迭�� ���� 
    //ũ�⸦ �����Ҽ� ����.
    //�� �������� �������� �߰�, ������ �ð��� ������ �ɸ���.  �����͸� �߰��ϰų� �����ϱ� ���� ���� �����͸� �Űܾ� �Ѵ�. �׷��� ���������߰��� �������� �����ͻ����� ������.  ���������� ������ �ڸ� �ٹٲٰ� ������. 
    
 
    
   
    
	}

}
