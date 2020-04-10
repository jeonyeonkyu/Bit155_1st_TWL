package kr.or.bit;
/*
 사원은 사번을 가지고 있고 사번은 숫자 데이터로 관리하려고 한다.
 사원은 이름을 가지고 있고 이름은 문자열 데이터로 관리 하려고 한다.
 사원은 직종을 가지고 있다 직종은 (IT, SALES) 등의 데이터로 관리된다.
 사원은 급여랄 받는다 급여는 숫자 데이터로 관리된다.
 사원은 신체정보를 가지고 있다 신체정보는 키와 몸무게 데이터로 관리된다. //BodyInfo를 만듦
 
 */
public class Emp {
	public int empno;  // default 0
	public String name; //null
	public String job; // null
	public int sal; //0
	
	
	public BodyInfo bodyinfo; //default null (참조 부품타입 디폴트 는 null)
	

}
