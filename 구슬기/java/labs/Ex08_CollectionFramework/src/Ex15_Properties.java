import java.util.Properties;

/*
 Map �������̽��� ������ Ŭ����
 Ư���� ������ map <String,String> (key, value)
 ������Ų Ŭ���� : Properties
 ������ 
 APP ��ü�� ���� : ȯ�溯�� : ���α׷��� ����: ���� ��� : ���뺯��
 
 ex)
 config.properties
 
 */
public class Ex15_Properties {
	public static void main(String[] args) {
		Properties prop = new Properties();
		prop.setProperty("master", "bit@bit.or.kr");
		prop.setProperty("version", "1.x.x.x");
		prop.setProperty("defaultpath", "C:\\Temp\\images");
		//////////////////////////////////////////////////////////
		//������ ���� ����������
		System.out.println(prop.getProperty("master"));
		System.out.println(prop.getProperty("defaultpath"));

	}

}
