import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;

/*
  I/O
  추상클래스
  InputStream(입력통로), OutputStream(출력통로)  byte 값을 읽고 쓸수 있는 추상클래스들이다.
  두개의 클래스를 상속(재정의)하는 클래스를 통해 입출력 작업을 할수 있다.
  
  대상에 따라서
  1.Memory :       ByteArrayInputStream  / ByteArrayOutputstream     메모리에 값을 쓰거나 읽을때 사용되는통로
  2.File(중요):     FileInputStream      / FileOutput  
  3.
  
  
  
  
 */
public class Ex01_Stream {

	public static void main(String[] args) throws IOException {
		//byte (-128~127) 정수가 저장가능한 타입
		byte[] inSrc = {0,1,2,3,4,5,6,7,8,9};
		byte[] outSrc = null; //현재는 메모리를 가지고 있지 않아요.
		//자원 (리소스)를  쓰려고한다.  그래서 빨대 인풋 아웃풋중에 인풋빨대를 inSrc에 꽂았다. 
		//read 함수는 한개의 값씩 읽어들인다
		//읽어들인 값을 outSrc 에 쓸것이다.
		
		
		//내가 데이터를 read, write 하는 대상을 Memory   
		ByteArrayInputStream input = null;
		ByteArrayOutputStream output = null;
		
		input = new ByteArrayInputStream(inSrc);   //read //inSrc 에다가 인풋빨대를 꽂았다.  배열자원에 빨대를 꽂은것.
		//생성자를 통해서 inSrc 배열의 갓ㅂ을 read 할 준비가 된거
		output = new ByteArrayOutputStream(); //write 
		
		System.out.println("outSrc before : "+Arrays.toString(outSrc)); //outSrc before : null
		
		//공식같은 로직( 암기)
		int data = 0;
		while((data = input.read())!=-1) {  //쭉 읽어들인값을 data에 넣고 그값이 -1이 아니라면 // 더이상 read 할 data가 없다면 -1 //빨대안을 읽기시작하는것.
			System.out.println("dataqa : "+ data);
			//System.out.println("input.read() : "+input.read() );
			//read() 함수는 내부적으로 next() 기능을 포함하고 있다. 그래서 읽고 그 다음값으로 이동해버림. while을 돌때마다 1,3,5, 이런식으로 읽게됨.
			output.write(data); 
			//자기자신에게 data 변수의 값을 read 해서 write 해야겠다.
			//write 대상이 output이다.      data 를 쭉읽어서 output에 쓴다. 
			//(ByteArrayOutputStream)자신의 통로에 read 가지고 있는다.**********
		}
		
		
		
		outSrc = output.toByteArray();
		//toByteArray() >> 자기가 가지고 있는 값을 배열로 만들어서 그 주소값을 outSrc에게 할당 한것.
		System.out.println("outsrc : "+ Arrays.toString(outSrc));   //outsrc : [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
		//첫수업이라서 한거지 어차피 배열도 메모리니까 메모리 읽어서 메모리쓰는 작업은 하지 않는다.

	}

}
