package kr.or.bit;

public class Ppt5_3 {
	int[] answer = { 1, 4, 4, 3, 1, 4, 4, 2, 1, 3, 2 };
	int[] g = new int[4];
	int[] g2 = { 0, 0, 0, 0 };
	int[] g3 = { 0, 0, 0, 0 };
	int[] g4 = { 0, 0, 0, 0 };   

	int gcount = 0;
	int gcount2 = 0;
	int gcount3 = 0;
	int gcount4 = 0;

	public void starAnswer2() {
		for (int i = 0; i < answer.length; i++) {
			if (answer[i] == 1) {
				g[gcount++] = 1;  //0번 방에 넣은 후 1번방으로 만들어준다. 
			} else if (answer[i] == 2) {
				g2[gcount2++] = 2;
			} else if (answer[i] == 3) {
				g3[gcount3++] = 3;
			} else {
				g4[gcount4++] = 4;
			}
		}
		//switch


		System.out.print("1");
		for (int j = 0; j < g.length; j++) {
			if(g[j]==1) {
			System.out.print("*");
			}
		}
		System.out.println();

		System.out.print("2");
		for (int j = 0; j < g2.length; j++) {
			if(g2[j]==2) {
			System.out.print("*");
			}
		}
		System.out.println();

		System.out.print("3");
		for (int j = 0; j < g3.length; j++) {
			if(g3[j]==3) {
			System.out.print("*");
			}
		}
		System.out.println();

		System.out.print("4");
		for (int j = 0; j < g4.length; j++) {
			if(g4[j]==4) {
			System.out.print("*");
			}
		}

	}

}
