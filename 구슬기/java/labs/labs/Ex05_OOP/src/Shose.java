class Shoes{
    String texture = "leather";
//    void standard () {
//        System.out.println("����: leather");
//    }
}
class Common{ // ���� (����, ������)
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
class DressShoes extends Shoes{ //��� ����
    Common common; // ���԰���
    int heel; // Ư����
    DressShoes(){
        this(4,new Common("white", 230));
    }
    DressShoes(int heel,Common common){
        this.heel = heel;
        this.common = common;
    }
    
}
//���� : ���θ� ���弼��
//1. ���δ� �Ź��̴� <���>
//2. �Ź��� ������ ������ �ִ� (������ leather)
//3. ���δ� ����, ����� ������ �ִ� <����>
//4. ���δ� ���� ������ �ִ� (Ư����) heel
//���� default ������ 4�� ������
//����, �������� default�� ���� white, 230 ������ �ִ�..
//�⺻���� �������� ������ ���� ����, �������� ���� �Է¹��� �� �ִ�
public class Shose {
    public static void main(String[] args) {
        DressShoes ds = new DressShoes();
        System.out.println("����: " + ds.texture);
        System.out.println("����: " + ds.common.color);
        System.out.println("������: " + ds.common.size);
        System.out.println("��: " + ds.heel);
        
        DressShoes ds2 = new DressShoes(10,new Common("red", 250));
        System.out.println("����: " + ds2.texture);
        System.out.println("����: " + ds2.common.color);
        System.out.println("������: " + ds2.common.size);
        System.out.println("��: " + ds2.heel);
        //������� �Լ��� �����ϰ� ����ϰ� ���ּ���........
    }
}