package HomeWork_Bank.Team_4;

public class Program {
	public static void main(String[] args) {
		 
        Bank bank = new Bank();
        bank.addAccount("1", "ȫ�浿");
        bank.addAccount("2", "������");
        bank.addAccount("3", "ȫ�浿");
 
        bank.getAccount("2").deposit(200); // 2�� ���¿� 200�� �Ա�
        bank.getAccount("2").withdraw(100); // 2�� ���¿� 100�� ���
 
        System.out.println(bank.getAccount("1")); // ���¹�ȣ�� ���¸� ã�´�
        System.out.println(bank.findAccounts("ȫ�浿")); // �����ڸ����� ���� ���
        System.out.println(bank.getAccounts()); // ���� ����� ����
        System.out.println(bank.getTotalAccount()); // �Ѱ��¼��� ��ȯ�Ѵ�
 
        System.out.println(bank.getAccount("2").getBalance()); // 2�������� �ܰ� Ȯ���Ѵ�
        System.out.println(bank.getAccount("2").getTransactions());
 
        for (Transaction trans : bank.getAccount("2").getTransactions()) {
            System.out.println(trans.getKind() + " �ݾ� " + trans.getAmount()); // �ŷ������� ����
        }
 
    }
}
