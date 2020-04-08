package factorymethodpattern;

public abstract class Factory { //공장 
								//피자 팩토리의 부모 클래스
	 
	public abstract Pizza createPizza(String name);
}
