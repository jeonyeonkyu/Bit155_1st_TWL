package Ex04_Array;

public class Ex03_Array_Lotto_Main {
    public static void main(String[] args) {
        //모닝 커피 퀴즈 (3분) : 시간 :3분
        int[][] score3 = new int[][]{
                {11, 12},
                {13, 14},
                {15, 16}
        };

        //개선된 for문을 사용해서 배열값 출력
        for (int[] col : score3) {
            for (int val : col) {
                System.out.println("값 : " + val);
            }
        }
    }
}
