import kr.or.bit.Bank;

public class Bank_Quize {
	public static void main(String[] args) {
		Bank bank = new Bank();
		bank.addAccount("111-10","��");
		bank.addAccount("111-11","��");
		bank.getAccount("111-10");
		bank.findAccounts("��");
		bank.getAccounts(); //��� ���¸�Ϻ��� 
		bank.getAccounts1().get(0).deposit(1000);  //-->  111-100 ���¿� 1000������ 
		bank.getAccounts1().get(0).getBalance();
		bank.getAccounts1().get(0).withdraw(500);
		bank.getAccounts1().get(0).getBalance();
		System.out.println(bank.getTotalAccount());
	}
}