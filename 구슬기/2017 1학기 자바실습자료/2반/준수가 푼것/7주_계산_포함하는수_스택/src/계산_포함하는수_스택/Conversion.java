package ���_�����ϴ¼�_����;

public class Conversion {
	int i;
	int j;
	int count;
	public int[] multiplyThree(int a){
		count = 0;
		j=0;
		for (i = 1; i <= a; i++) {
			if (i % 3 == 0) {
				count++;
			}
		}
		int[] num= new int[count];
		for (i = 1; i <= a; i++) {
			if (i % 3 == 0) {
				num[j]=i;
				j++;
			}
		}
		return num;
	}

	public int[] IncludeThree(int a){
		count=0;
		j=0;
		for(i=1; i <= a ; i++){
			if(i%10==3){
				count++;
			}else if((i/10)%10 ==3){
				count++;
			}
		}
		int[] num= new int[count];
		for(i=1; i <= a ; i++){
			if(i%10==3){
				num[j]=i;
				j++;
			}else if((i/10)%10 ==3){
				num[j]=i;
				j++;
			}
		}
		return num;
	}
}
// ���� ����Ű ==> ctrl shift f