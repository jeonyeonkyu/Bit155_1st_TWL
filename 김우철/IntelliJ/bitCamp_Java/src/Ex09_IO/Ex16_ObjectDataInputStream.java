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
////userData.txt ����ȭ�� ��ü�� 2��
////��ü�� read  �����·� ���� (������ȭ)
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
//			   in = new ObjectInputStream(bis); //������ �ڵ� ������ȭ
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
//            System.out.println("������ �������� �ʽ��ϴ�.");
//        }
//        catch (EOFException eofe) {
//            System.out.println("��" + eofe.getMessage());
//            eofe.printStackTrace();
//        }
//        catch (IOException ioe) {
//            System.out.println("������ ���� �� �����ϴ�.");
//        }
//        catch (ClassNotFoundException cnfe) {
//            System.out.println("�ش� Ŭ������ �������� �ʽ��ϴ�.");
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
