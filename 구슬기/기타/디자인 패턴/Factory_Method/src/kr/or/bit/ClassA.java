package kr.or.bit;

public class ClassA {
	 public Type createType(String type){
	        TypeFactory factory = new TypeFactory();   //�� ��ü�� �����Ѵ�.
	        Type returnType = factory.createType(type);  //

	        return returnType;
	    }
}
