import java.io.File;
import java.util.ArrayList;


//이거 이해해야함  
public class ExTYPE {
	

	public static void main(String[] args) {
		if(args.length != 1) {
			System.out.println("사용법: java[실행할 파일명][경로명]");
			System.out.println("예시   : java Ex10_File_SubList C:\\Temp");
			System.exit(0);
		}
		File f = new File(args[0]); //args[0] 방에 있는 값을 경로로 사용하겠습니다.
		if(f.isDirectory()) { 
			System.out.println("유효하지 않은 디렉토리");
			System.exit(0);
		}
		//if문 두개를 통과했다는 것은 정상적인 경로, 폴더인경우에 통과
		
		printFileList(f);   //위의 f 를 파라메터로 아래 함수에 넘김.
	    

	}
	
	
	static void printFileList(File dir) { //f가 파라메터
		System.out.println("[Full Path : " + dir.getAbsolutePath() + "]"); //절대경로 나옴
		
		
		//여기서 부터.
		File[] files = dir.listFiles();
		for(int i = 0;i< files.length ;i++) {
			String name = files[i].getName(); 
			//String n = files[i]
			System.out.println( name);
		}
		
//		//C:\\Temp
//		//files[0] >> a.txt 파일이 있을수도
//		//files[1] >> aaaa 폴더가있을수도
//		for(int i = 0; i< files.length ; i++) {
//			String filename = files[i].getName(); //폴더명 or 파일명
//			if(files[i].isDirectory()) {
//				filename = "<DIR> [" + filename + "]";
//				subdir.add(i); //왜 이랬을까?  ArrayList 는 디렉토리의 방번호를 갖고있는거 .. 어떤방은 F 어떤방은 D 일때 그 방번호를 알고싶은거다.
//				               //ArrayList >> 여기에는 폴더만 들어가게됨  그리고 그 폴더만있는 배열을 계속 돌리니까 하위폴더까지 탐색하게 된다.
//			}else {
//				filename = filename + "/ " + files[i].length() + "Byte"; 
//			}
//			System.out.println("    " +filename);
//		}
//        int dirnum = subdir.size(); //폴더 개수
//        int filenum = files.length - dirnum; //파일개수
//        
//        
//		
//       
//        System.out.println("[Current dirNum] : " + dirnum);
//        System.out.println("[Current fileNum] : " + filenum);
//        System.out.println("**********************************************");
//        
//        
//        //POINT
//      //C:\\Temp
//      		//files[0] >> a.txt 파일
//      		//files[1] >> aaaa 폴더
//            //...
//            //files[4] >> bbbb 폴더 
//        
//        // 
//        for(int j = 0; j< subdir.size() ; j++) {
//        	int index = subdir.get(j);  //subdir에 get 함수를 써서 0>>에서 폴더 aaaa 갖고오고 1>>에서 bbbb를 갖고온다. 
//        	//subdir에 있는 폴더를 index 에 넘기니까 index 0 >> aaaa, 1 >> bbbb  이 들어있게 되는데 그걸 또 printFileList의 파라메터로 보내서 또 돈다. 
//        	printFileList(files[index]); //files의 1번방에 있는것, 네번째방에 있는걸 파라메터 dir에게 보냈다. 폴더안의 폴더를 꺼낼수잇게 하는거다...안쪽까지 뒤져보는것..
//        }
        
	}

}
