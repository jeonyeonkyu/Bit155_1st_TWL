
public class Megabox extends Theater{
	void printWelcom(){
		System.out.println("ȯ���մϴ�. �ް��ڽ��Դϴ�.");
	}
	void reserveSeat(char row, int col){
		System.out.println(row+"�� "+col+"������ ���� �Ǿ����ϴ�.");
		if(row=='A'){
			isArrSeat[0][col-1] = true;
		}else if(row=='B'){
			isArrSeat[1][col-1] = true;
		}else if(row=='C'){
			isArrSeat[2][col-1] = true;
		}else{
			System.out.println("�߸��� �Է�");
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
