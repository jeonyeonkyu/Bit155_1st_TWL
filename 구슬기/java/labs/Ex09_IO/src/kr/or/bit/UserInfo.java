
/*
 
  ��ü ���.. 
  ��ü(Car, Tv) �̷��ֵ��� ����� ��Ʈ��ũ�� ����, ���ϰ���(txt ���� ��ü write , ��ü read), ���μ��� ���� ���(Ư���� ���α׷� ���� ���  ex) a.class, b.class)
  ����ȭ : ��ü�� �����ؼ� ���� ���� ������ ����..
  ������ȭ : ��ü�� �ٽ� �����ϴ� ����
  �ǽ�
  ��� >> ���� >> ��ü�� write(����ȭ) ������ ����ȭ�ؼ� ���Ű�
  ��� >> ���� >> ��ü read  ( ������ȭ)
  
  �� , ������  : ���� ���̴� ��.. �̷��� ����ȭ�� ����� �ȵȴ�.
 �׷��� ����ȭ ������ ��ǰ�� ���赵�� �ٸ���. implements Serializable �������̽��� �پ��־�߸� ����ȭ�� �����ϴ�.
  
  
   ���� �����ߴٰ� �ً� �����㿡 �ٽ� �����Ѵٰ� ����..
  
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
