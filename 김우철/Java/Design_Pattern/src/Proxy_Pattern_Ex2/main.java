//https://readystory.tistory.com/132

package Proxy_Pattern_Ex2;

public class main {
	public static void main(String[] args) {
		CommandExecutor executor = new CommandExecutorProxy("ReadyKim", "wrong_pwd");
		try {
			executor.runCommand("ls -ltr");
			executor.runCommand("rm -rf abc.pdf");
		} catch (Exception e) {
			System.out.println("Exception Message::" + e.getMessage());
		}
	}
}