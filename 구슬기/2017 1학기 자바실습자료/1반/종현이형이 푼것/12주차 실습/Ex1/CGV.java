
public class CGV extends Theater {
	void printWelcom(){
		System.out.println("환영합니다. CGV입니다.");
	}
	void reserveSeat(char row, int col){
		System.out.println(row+"열 "+col+"번으로 예약 되었습니다.");
		if(row=='A'){
			isArrSeat[0][col-1] = true;
		}else if(row=='B'){
			isArrSeat[1][col-1] = true;
		}else if(row=='C'){
			isArrSeat[2][col-1] = true;
		}else{
			System.out.println("잘못된 입력");
		}
	}
	void checkSeat(){
		System.out.println("  1 2 3 4 5");
		for(int i=0; i<isArrSeat.length; i++){
			if(i==0){
				System.out.print("A ");
			}else if(i==1){
				System.out.print("B ");
			}else{
				System.out.print("C ");
			}
			for(int j=0; j<isArrSeat[i].length; j++){
				if(isArrSeat[i][j]==true){
					System.out.print("1 ");
				}else{
					System.out.print("0 ");
				}
			}
			System.out.println();
		}
	}
	
}
