import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;

/*
  I/O
  �߻�Ŭ����
  InputStream(�Է����), OutputStream(������)  byte ���� �а� ���� �ִ� �߻�Ŭ�������̴�.
  �ΰ��� Ŭ������ ���(������)�ϴ� Ŭ������ ���� ����� �۾��� �Ҽ� �ִ�.
  
  ��� ����
  1.Memory :       ByteArrayInputStream  / ByteArrayOutputstream     �޸𸮿� ���� ���ų� ������ ���Ǵ����
  2.File(�߿�):     FileInputStream      / FileOutput  
  3.
  
  
  
  
 */
public class Ex01_Stream {

	public static void main(String[] args) throws IOException {
		//byte (-128~127) ������ ���尡���� Ÿ��
		byte[] inSrc = {0,1,2,3,4,5,6,7,8,9};
		byte[] outSrc = null; //����� �޸𸮸� ������ ���� �ʾƿ�.
		//�ڿ� (���ҽ�)��  �������Ѵ�.  �׷��� ���� ��ǲ �ƿ�ǲ�߿� ��ǲ���븦 inSrc�� �ȾҴ�. 
		//read �Լ��� �Ѱ��� ���� �о���δ�
		//�о���� ���� outSrc �� �����̴�.
		
		
		//���� �����͸� read, write �ϴ� ����� Memory   
		ByteArrayInputStream input = null;
		ByteArrayOutputStream output = null;
		
		input = new ByteArrayInputStream(inSrc);   //read //inSrc ���ٰ� ��ǲ���븦 �ȾҴ�.  �迭�ڿ��� ���븦 ������.
		//�����ڸ� ���ؼ� inSrc �迭�� ������ read �� �غ� �Ȱ�
		output = new ByteArrayOutputStream(); //write 
		
		System.out.println("outSrc before : "+Arrays.toString(outSrc)); //outSrc before : null
		
		//���İ��� ����( �ϱ�)
		int data = 0;
		while((data = input.read())!=-1) {  //�� �о���ΰ��� data�� �ְ� �װ��� -1�� �ƴ϶�� // ���̻� read �� data�� ���ٸ� -1 //������� �б�����ϴ°�.
			System.out.println("dataqa : "+ data);
			//System.out.println("input.read() : "+input.read() );
			//read() �Լ��� ���������� next() ����� �����ϰ� �ִ�. �׷��� �а� �� ���������� �̵��ع���. while�� �������� 1,3,5, �̷������� �аԵ�.
			output.write(data); 
			//�ڱ��ڽſ��� data ������ ���� read �ؼ� write �ؾ߰ڴ�.
			//write ����� output�̴�.      data �� ���о output�� ����. 
			//(ByteArrayOutputStream)�ڽ��� ��ο� read ������ �ִ´�.**********
		}
		
		
		
		outSrc = output.toByteArray();
		//toByteArray() >> �ڱⰡ ������ �ִ� ���� �迭�� ���� �� �ּҰ��� outSrc���� �Ҵ� �Ѱ�.
		System.out.println("outsrc : "+ Arrays.toString(outSrc));   //outsrc : [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
		//ù�����̶� �Ѱ��� ������ �迭�� �޸𸮴ϱ� �޸� �о �޸𸮾��� �۾��� ���� �ʴ´�.

	}

}
