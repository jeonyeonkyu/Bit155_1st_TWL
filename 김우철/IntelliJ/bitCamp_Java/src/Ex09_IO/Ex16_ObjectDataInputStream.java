//package Ex09_IO;
//
//import java.io.BufferedInputStream;
//import java.io.EOFException;
//import java.io.FileInputStream;
//import java.io.FileNotFoundException;
//import java.io.IOException;
//import java.io.ObjectInputStream;
//
//import kr.or.bit.UserInfo;
//
////userData.txt 직렬화된 객체가 2개
////객체를 read  원상태로 복원 (역직렬화)
//
//public class Ex16_ObjectDataInputStream {
//	public static void main(String[] args) {
//		String filename = "UserData.txt";
//
//		FileInputStream fis = null;
//		BufferedInputStream bis = null;
//		ObjectInputStream in = null;
//
//		try {
//			   fis= new FileInputStream(filename);
//			   bis = new BufferedInputStream(fis);
//			   in = new ObjectInputStream(bis); //한줄의 코드 역직렬화
//
//			   //UserInfo r1 = (UserInfo)in.readObject();
//			   //UserInfo r2 = (UserInfo)in.readObject();
//			   //System.out.println(r1.toString());
//			   //System.out.println(r2.toString())\;
//			   Object users = null;
//
//			   while((users = in.readObject()) != null) {
//				   System.out.println(((UserInfo)users).toString());
//			   }
//		}catch (FileNotFoundException fnfe) {
//            System.out.println("파일이 존재하지 않습니다.");
//        }
//        catch (EOFException eofe) {
//            System.out.println("끝" + eofe.getMessage());
//            eofe.printStackTrace();
//        }
//        catch (IOException ioe) {
//            System.out.println("파일을 읽을 수 없습니다.");
//        }
//        catch (ClassNotFoundException cnfe) {
//            System.out.println("해당 클래스가 존재하지 않습니다.");
//		}finally {
//			try {
//				in.close();
//				bis.close();
//				fis.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//
//	}
//
//}
//
//
//
//
//
//
//
//
//
