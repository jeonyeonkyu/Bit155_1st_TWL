package Ex09_IO;

import java.io.File;
import java.util.ArrayList;

public class Ex10_File_SubList {
    static int totalfiles=0;
    static int totaldirs=0;

    public static void main(String[] args) {
        if(args.length != 1) {
            System.out.println("사용법 : java [실행할 파일명] [경로명]");
            System.out.println("예시    : java Ex10_File_SubList C:\\Temp");
            System.exit(0);
        }
        File f = new File(args[0]);
        if(!f.exists() || !f.isDirectory()) {
            System.out.println("유효하지 않은 디렉토리");
            System.exit(0);
        }

        //정상적인 경로 , 폴더
        printFileList(f);
        System.out.println("누적 총 파일수 : " + totalfiles);
        System.out.println("누적 총 폴더수 : " + totaldirs);
    }
    static void printFileList(File dir) {
        System.out.println("[ Full Path : " + dir.getAbsolutePath() + " ]");

        ArrayList<Integer> subdir = new ArrayList<Integer>();
        File[] files = dir.listFiles();
        //C:\\Temp
        //files[0] >> a.txt
        //files[1] >> aaaa
        //...
        //files[4] >> bbbb
        for(int i = 0 ; i < files.length ; i++) {
            String filename = files[i].getName(); //폴더명 or 파일명
            if(files[i].isDirectory()) {
                filename = "<DIR> [" + filename + "]";
                subdir.add(i); //?? why  [0] >> 1  [1] >> 4\
                //ArrayList >> dir폴더 배열값....
            }else {
                filename = filename + " / " + files[i].length() + "Byte";
            }
            System.out.println("   " + filename);
        }
        int dirnum = subdir.size(); // 폴더 개수
        int filenum = files.length - dirnum; //파일개수

        //누적값 (폴더 몇개 , 파일 몇개)
        totaldirs += dirnum; //총 누적 폴더 개수
        totalfiles += filenum; //총 파일 누적 개수

        System.out.println("[Current dirNum ] : " + dirnum);
        System.out.println("[Current fileNum ] : " + filenum);
        System.out.println("********************************");

        //POINT
        //C:\\Temp
        //files[0] >> a.txt
        //files[1] >> aaaa
        //...
        //files[4] >> bbbb

        //subdir   [0] > 1  , [1]  >  4
        for(int j = 0 ; j < subdir.size() ; j++) {
            int index = subdir.get(j); // [0] > 1  , [1] > 4
            printFileList(files[index]); //aaaa
        }

    }
}
