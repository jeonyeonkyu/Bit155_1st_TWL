package kr.or.bit;

public class ClassA {
	 public Type createType(String type){
	        TypeFactory factory = new TypeFactory();   //새 객체를 생성한다.
	        Type returnType = factory.createType(type);  //

	        return returnType;
	    }
}
