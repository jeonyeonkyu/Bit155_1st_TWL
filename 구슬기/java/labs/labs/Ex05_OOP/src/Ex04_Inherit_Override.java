/*
 Today Point
 
 [상속관계]에서 override : '상속관계'에서 메서드를 [재정의] 하는거   라고 함.    상속이 없으면 오버라이드는 존재하지 않는다.\
 [상속관계]에서 자식 클래스가 부모 클래스의 '메서드'를  [재정의]( 내용 바꾼다)
         재정의 : 틀의 변환( 함수의 이름, 타입) 하는것이 아니라 내용만 {} 중괄호 블럭안의 내용만!

 문법)
 1.부모 함수 이름과 동일해야함.
 2.부로 함수의 파라메터와 동일해야함
 3.부모함수 return Type 동일
 4. 결국 말하자면 {요기내용만 바꿀수있다!}    이게 오버라이드.

  차이점)
  *************************
 오버로딩 = 하나의 이름으로 여러가지기능
 오버라이딩 = 상속관계에서 메서드 재정의
 *****************************
 
 */
class Point2{  //조상클래스
	int x =4;
	int y =5;
	String getPosition() { 
		return "x:" + this.x + "y:" + this.y;
	}
}
class Point3D extends Point2{  //자식클래스
	int z =6;
	//부모의 함수와 틀이 똑같다. >> 내용만 다르다.
	//이게 바로~ 재정의..
	
	//Annotation 은 Java code 만으로 전달할 수 없는 [부가적인 정보]를 컴파일러, 개발툴에 전달
	//@Override >> Annotation >> 재정의 검사를 해라 를 전달한다.
	@Override 
	String getPosition() { 
		return "x:" + this.x + "y:" + this.y +"z:" + this.z;
	}
}
public class Ex04_Inherit_Override {

	public static void main(String[] args) {
		Point3D po = new Point3D();
		System.out.println(po.getPosition()); //내가 재정의한 함수가 호출된다.
		
		
		

	}

}
