package Ex05_OOP;

//두개의 설계도
class Tv{
    boolean power;
    int ch;
    void power() {
        this.power = !this.power;
    }
    void chUp() {
        this.ch++;
    }
    void chDown() {
        this.ch--;
    }
}

class Vcr{ //비디오 플레이어
    boolean power;
    void power() {
        this.power = !this.power;
    }
    void play() {
        System.out.println("재생하기");
    }
    void stop() {
        System.out.println("정지하기");
    }
    void rew() {}
    void ff() {}
}
//Tv 설계도 , Vcr 설계도
//TvVcr 라는 설계도를 만들어 주세요
//기존에 Tv, Vcr 설계도 잘 이용해봐
//상속, 포함
//class TvVcr extends Tv, Vcr  다중상속금지 (x)
//class Tv extends Vcr
//class TvVcr extends Tv  계층적 상속 ..... 같은 이름 기능들 문제 ....(x)

//질문
//TvVcr 설계도 새롭게 .. Tv 설계도 , Vcr 설계도 활용
//1조) class TvVcr{ Tv t; Vcr v;  }
//2조) class TvVcr{ Tv t; Vcr v;  }
//3조) class TvVcr extends Vcr { Tv t;}
//4조) class TvVcr extends Tv { Vcr v;}
//5조) class TvVcr{ Tv t; Vcr v;  }

//TvVcr 주기능 : 메인 기능 >> 비중이 높은 클래스 > 상속
//나머지 포함

class TvVcr extends Tv{
    Vcr vcr;
    TvVcr(){
        vcr = new Vcr();
    }
}


public class Ex03_Inherit_Single {
    public static void main(String[] args) {
        TvVcr t = new TvVcr();
        t.power();
        System.out.println("Tv 전원상태 : " + t.power);
        t.chUp();
        System.out.println("Tv 채널상태 : " + t.ch);

        //비디오
        t.vcr.power();
        System.out.println("비디오 전원상태 : " + t.vcr.power);
        t.vcr.play();
        t.vcr.stop();

        t.vcr.power();
        t.power();
        System.out.println("Tv 전원상태 : " + t.power);
        System.out.println("비디오 전원상태 : " + t.vcr.power);
    }

}
