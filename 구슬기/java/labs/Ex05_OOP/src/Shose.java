class Shoes{
    String texture = "leather";
//    void standard () {
//        System.out.println("재질: leather");
//    }
}
class Common{ // 공통 (색상, 사이즈)
    String color;
    int size;
    Common(){
        this("white", 230);
    }
    Common(String color, int size){
        this.color = color;
        this.size = size;
    }
}
class DressShoes extends Shoes{ //상속 관계
    Common common; // 포함관계
    int heel; // 특수성
    DressShoes(){
        this(4,new Common("white", 230));
    }
    DressShoes(int heel,Common common){
        this.heel = heel;
        this.common = common;
    }
    
}
//문제 : 구두를 만드세요
//1. 구두는 신발이다 <상속>
//2. 신발은 재질을 가지고 있다 (재질은 leather)
//3. 구두는 색상, 사이즈를 가지고 있다 <포함>
//4. 구두는 굽을 가지고 있다 (특수성) heel
//굽의 default 값으로 4를 가진다
//색상, 사이즈은 default로 각각 white, 230 가지고 있다..
//기본값을 설정하지 않으면 굽과 색상, 사이즈의 값을 입력받을 수 있다
public class Shose {
    public static void main(String[] args) {
        DressShoes ds = new DressShoes();
        System.out.println("재질: " + ds.texture);
        System.out.println("색상: " + ds.common.color);
        System.out.println("사이즈: " + ds.common.size);
        System.out.println("굽: " + ds.heel);
        
        DressShoes ds2 = new DressShoes(10,new Common("red", 250));
        System.out.println("재질: " + ds2.texture);
        System.out.println("색상: " + ds2.common.color);
        System.out.println("사이즈: " + ds2.common.size);
        System.out.println("굽: " + ds2.heel);
        //※출력을 함수로 간략하게 출력하게 해주세요........
    }
}