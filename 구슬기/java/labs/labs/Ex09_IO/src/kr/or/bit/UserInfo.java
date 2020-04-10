
/*
 
  객체 통신.. 
  객체(Car, Tv) 이런애들을 연결된 네트워크를 통해, 파일간에(txt 파일 객체 write , 객체 read), 프로세스 간에 통신(특정한 프로그램 간의 통신  ex) a.class, b.class)
  직렬화 : 객체를 분해해서 줄을 세워 보내는 과정..
  역직렬화 : 객체를 다시 조립하는 과정
  실습
  대상 >> 파일 >> 객체를 write(직렬화) 파일을 직렬화해서 쓸거고
  대상 >> 파일 >> 객체 read  ( 역직렬화)
  
  단 , 조건은  : 본드 붙이는 것.. 이런건 직렬화의 대상이 안된다.
 그래서 직렬화 가능한 제품은 설계도가 다르다. implements Serializable 인터페이스가 붙어있어야만 직렬화가 가능하다.
  
  
   레고를 조립했다가 다뗴어서 보낸담에 다시 조립한다고 보기..
  
 */
package kr.or.bit;

import java.io.Serializable;

public class UserInfo implements Serializable{
	private String name;
	private String pwd;
	private int age;
	
	public UserInfo() {
		
	}
	public UserInfo(String name, String pwd , int age) {
		this.name = name;
		this.pwd = pwd;
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "UserInfo [name=" + name + ", pwd=" + pwd + ", age=" + age + "]";
	}

}
