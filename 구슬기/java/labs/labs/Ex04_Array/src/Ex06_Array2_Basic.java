
public class Ex06_Array2_Basic {

	public static void main(String[] args) {
		//2차원(행과열)
		//[행][열]
		//*영화관 예약(좌석) 좌석 배치
		
		//미리 추후과제중에 하나는 영화관 좌석 배치...만들기
		//지도(경도, 위도)
		
		int[][] score = new int[3][2];
		System.out.println(score[0][0]); 
		
		score[0][0] =100;
		score[0][1] =200;
		
		score[1][0] =300;
		score[1][1] =400;
		
		score[2][0] =500;
		score[2][1] =600;
		
		//행의 수 , 열의 수
		
		
		//행의 개수는 : 배열이름.length > score.length
		//열의 개수는 : 배열이름[i].length
		//배열이름[0].length >> 0행의 열의 개수
		//배열이름[1].length >> 1행의 열의 개수   *********이거 진짜 중요
		
		for(int i = 0;i< score.length ;i++) {
			for(int j = 0;j<score[i].length;j++) {  //행이 가진 열의 주소로 접근한다.
				System.out.printf("score[%d][%d]=%d\t",i,j,score[i][j]);
			}
			System.out.println();
		}

	}

}
