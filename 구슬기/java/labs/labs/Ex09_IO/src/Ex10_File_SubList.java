import java.io.File;
import java.util.ArrayList;


//�̰� �����ؾ���  
public class Ex10_File_SubList {
	static int totalfiles = 0; //����
	static int totaldirs=0;    //����

	public static void main(String[] args) {
		if(args.length != 1) {
			System.out.println("����: java[������ ���ϸ�][��θ�]");
			System.out.println("����   : java Ex10_File_SubList C:\\Temp");
			System.exit(0);
		}
		File f = new File(args[0]); //args[0] �濡 �ִ� ���� ��η� ����ϰڽ��ϴ�.
		if(!f.exists() ||!f.isDirectory()) { // �����ϴ°ǰ���? �����ΰ���?
			System.out.println("��ȿ���� ���� ���丮");
			System.exit(0);
		}
		//if�� �ΰ��� ����ߴٴ� ���� �������� ���, �����ΰ�쿡 ���
		
		printFileList(f);   //���� f �� �Ķ���ͷ� �Ʒ� �Լ��� �ѱ�.
	    System.out.println("���� �� ���ϼ� : "+ totalfiles);
	    System.out.println("���� �� ������ : "+ totaldirs);

	}
	
	
	static void printFileList(File dir) { //f�� �Ķ����
		System.out.println("[Full Path : " + dir.getAbsolutePath() + "]"); //������ ����
		
		ArrayList<Integer> subdir = new ArrayList<Integer>(); 
		File[] files = dir.listFiles();  //f(Temp)�� ������ �迭�� �ѱ�
		
		//C:\\Temp
		//files[0] >> a.txt ������ ��������
		//files[1] >> aaaa ��������������
		for(int i = 0; i< files.length ; i++) {
			String filename = files[i].getName(); //������ or ���ϸ�
			if(files[i].isDirectory()) {
				filename = "<DIR> [" + filename + "]";
				subdir.add(i); //�� �̷�����?  ArrayList �� ���丮�� ���ȣ�� �����ִ°� .. ����� F ����� D �϶� �� ���ȣ�� �˰�����Ŵ�.
				               //ArrayList >> ���⿡�� ������ ���Ե�  �׸��� �� �������ִ� �迭�� ��� �����ϱ� ������������ Ž���ϰ� �ȴ�.
			}else {
				filename = filename + "/ " + files[i].length() + "Byte"; 
			}
			System.out.println("    " +filename);
		}
        int dirnum = subdir.size(); //���� ����
        int filenum = files.length - dirnum; //���ϰ���
        
        
		//������ (���� �, ���� �)
        totaldirs += dirnum; //�� ���� ���� ����
        totalfiles += filenum; //�� ���� ���� ����
        
        System.out.println("[Current dirNum] : " + dirnum);
        System.out.println("[Current fileNum] : " + filenum);
        System.out.println("**********************************************");
        
        
        //POINT
      //C:\\Temp
      		//files[0] >> a.txt ����
      		//files[1] >> aaaa ����
            //...
            //files[4] >> bbbb ���� 
        
        // 
        for(int j = 0; j< subdir.size() ; j++) {
        	int index = subdir.get(j);  //subdir�� get �Լ��� �Ἥ 0>>���� ���� aaaa ������� 1>>���� bbbb�� ����´�. 
        	//subdir�� �ִ� ������ index �� �ѱ�ϱ� index 0 >> aaaa, 1 >> bbbb  �� ����ְ� �Ǵµ� �װ� �� printFileList�� �Ķ���ͷ� ������ �� ����. 
        	printFileList(files[index]); //files�� 1���濡 �ִ°�, �׹�°�濡 �ִ°� �Ķ���� dir���� ���´�. �������� ������ �������հ� �ϴ°Ŵ�...���ʱ��� �������°�..
        }
        
	}

}
