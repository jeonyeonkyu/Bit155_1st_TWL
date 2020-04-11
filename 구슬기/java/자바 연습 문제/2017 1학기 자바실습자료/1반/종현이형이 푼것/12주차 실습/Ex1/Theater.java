
abstract class Theater {
	
	char chRow;
	int iCol;
	boolean[][] isArrSeat = new boolean[3][5];
	
	abstract void printWelcom();
	
	abstract void reserveSeat(char row, int col);
	
	abstract void checkSeat();
	
	
}
