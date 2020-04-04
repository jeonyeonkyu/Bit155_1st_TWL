import java.util.Properties;

/*
 Map 인터페이스를 구현한 클래스
 특수한 목적의 map <String,String> (key, value)
 고정시킨 클래스 : Properties
 사용목적 
 APP 전체를 관리 : 환경변수 : 프로그램의 버전: 파일 경로 : 공통변수
 
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
		//각각의 개발 페이지에서
		System.out.println(prop.getProperty("master"));
		System.out.println(prop.getProperty("defaultpath"));

	}

}
