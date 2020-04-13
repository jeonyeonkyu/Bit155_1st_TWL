package Iterator_Pattern_Ex1;

public interface Iterator {
	//다음에 가져올 요소가 있는지 확인하는 추상메소드
	public abstract boolean hasNext();
	//다음의 요소를 가져오는 추상메소드
	public abstract Object next();

}
