package kr.or.bit;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Admin {
    private String adminId;
    private int adminPwd;
    private int totalBalance;
    Scanner scanner = new Scanner(System.in);
    public List<ShowSelection> addShow = new ArrayList<ShowSelection>(); // 공연 개설 - 안되면 함수로.... public
                                                                         // List<ShowSelection> addShow(){return null};
    ShowSelection showselection = new ShowSelection();
    ShowInfo showinfo = new ShowInfo();

    // ***********동률*****************
    // 한번 개설된 공연은 더이상 개설할수 없게 해야된다....... + 2개 받기,,,, 공연종류 + 날짜
    public void addConcert() { // 공연개설(private 해버리면 공연개설목록이 관리자로그인 메뉴에서 안보임)
        File file = new File("show.txt");
        FileWriter filewriter = null;
        BufferedWriter bufferedwriter = null;

        Loop: while (true) {
            System.out.println("어떤 공연을 개설하시겠습니까??");
            System.out.println("1.발레");
            System.out.println("2.음악회");
            System.out.println("3.오페라");
            System.out.println("4.adminLogin 메뉴로 돌아가기");
            System.out.print("1~4중하나를 입력하세요:");
            int selection = Integer.parseInt(scanner.nextLine());

            switch (selection) {
            case 1: // 발레 공연을 개설
                System.out.println("개설할 공연 날짜를 입력하세요(4.1)(4.4)");
                String showDate = scanner.nextLine();
                if (showDate.equals("4.1")) {
                    showselection.Ballet1();
                    System.out.println("4.1공연이 개설되었습니다");
                } else if (showDate.equals("4.4")) {
                    showselection.Ballet2();
                    System.out.println("4.4공연이 개설되었습니다");
                } else {
                    System.out.println("잘못 입력하셨습니다. 다시입력하세요");

                }
                break;

            case 2: // 음악회 개설
                System.out.println("개설할 공연 날짜를 입력하세요(4.2)(4.6)");
                String showDate2 = scanner.nextLine();
                if (showDate2.equals("4.2")) {
                    showselection.Concert1();
                    System.out.println("4.2공연이 개설되었습니다");
                } else if (showDate2.equals("4.6")) {
                    showselection.Concert2();
                    System.out.println("4.6공연이 개설되었습니다");
                } else {
                    System.out.println("잘못 입력하셨습니다.");

                }
                break;

            case 3: // 오페라 공연 개설
                System.out.println("개설할 공연 날짜를 입력하세요(4.3)(4.5)(4.7)");
                String showDate3 = scanner.nextLine();
                if (showDate3.equals("4.3")) {
                    showselection.Opera1();
                    System.out.println("4.3공연이 개설되었습니다");
                } else if (showDate3.equals("4.5")) {
                    showselection.Opera2();
                    System.out.println("4.5공연이 개설되었습니다");
                } else if (showDate3.equals("4.7")) {
                    showselection.Opera3();
                    System.out.println("4.7공연이 개설되었습니다");
                } else {
                    System.out.println("잘못 입력하셨습니다.");

                }
                break;
            case 4:// adminLogin 메뉴로 돌아가기
                break Loop; // while문을 탈출함
            default:
                break;

            }// switch End

        } // Loop:while End
    }// addConcert() End

    public void reviseShow() { // 공연 수정
        Loop1: while (true) {
            System.out.println("어떤 공연을 수정하시겠습니까??");
            System.out.println("1.발레");
            System.out.println("2.음악회");
            System.out.println("3.오페라");
            System.out.println("4.adminLogin 메뉴로 돌아가기");
            System.out.print("1~4중하나를 입력하세요:");
            int selection = Integer.parseInt(scanner.nextLine());
            Loop2: switch (selection) {
            case 1:
                System.out.println("수정할 발레공연 날짜를 입력하세요(4.1)(4.4)");
                String showDate = scanner.nextLine(); // showData 에 발레회차를 넣음

                if (showDate.equals("4.1")) {

                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.1")) {
                            // showselection.showList.get(i).getShowType().equals("Ballet1")
                            System.out.println("시작 시간:19:00" + " " + "종료시간:22:00");

                            System.out.println("수정할 시작시간을 입력하세요");
                            String startShow = scanner.nextLine();
                            System.out.println("수정할 종료시간을 입력하세요");
                            String EndShow = scanner.nextLine();

                            String start = startShow;
                            String End = EndShow;

                            showselection.showList.get(i).setStartShow(start);
                            showselection.showList.get(i).setEndShow(End);
                            System.out.println("수정된 시작시간" + showselection.showList.get(i).getStartShow());
                            System.out.println("수정된 종료시간" + showselection.showList.get(i).getEndShow());
                            break Loop2;
                        }

                    }
                    break;
                } else if (showDate.equals("4.4")) {

                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.4")) {
                            System.out.println("시작 시간:19:00" + " " + "종료시간:22:00");

                            System.out.println("수정할 시작시간을 입력하세요");
                            String startShow = scanner.nextLine();
                            System.out.println("수정할 종료시간을 입력하세요");
                            String EndShow = scanner.nextLine();

                            String start = startShow;
                            String End = EndShow;

                            showselection.showList.get(i).setStartShow(start);
                            showselection.showList.get(i).setEndShow(End);
                            System.out.println("수정된 시작시간" + showselection.showList.get(i).getStartShow());
                            System.out.println("수정된 종료시간" + showselection.showList.get(i).getEndShow());
                            break Loop2;
                        }
                    }
                    break;
                }else{
                    System.out.println("잘못입력함...다시입력");
                    break;
                }
             
            case 2:
                System.out.println("수정할 음악회공연 날짜를 입력하세요(4.2)(4.4)");
                String showDate2 = scanner.nextLine(); // showData 에 발레회차를 넣음

                if (showDate2.equals("4.2")) {

                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.2")) {
                            // showselection.showList.get(i).getShowType().equals("Ballet1")
                            System.out.println("시작 시간:19:00" + " " + "종료시간:21:00");

                            System.out.println("수정할 시작시간을 입력하세요");
                            String startShow = scanner.nextLine();
                            System.out.println("수정할 종료시간을 입력하세요");
                            String EndShow = scanner.nextLine();

                            String start = startShow;
                            String End = EndShow;

                            showselection.showList.get(i).setStartShow(start);
                            showselection.showList.get(i).setEndShow(End);
                            System.out.println("수정된 시작시간" + showselection.showList.get(i).getStartShow());
                            System.out.println("수정된 종료시간" + showselection.showList.get(i).getEndShow());
                            break Loop2;
                        }

                    }
                    break;
                } else if (showDate2.equals("4.6")) {

                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.6")) {
                            System.out.println("시작 시간:19:00" + " " + "종료시간:21:00");

                            System.out.println("수정할 시작시간을 입력하세요");
                            String startShow = scanner.nextLine();
                            System.out.println("수정할 종료시간을 입력하세요");
                            String EndShow = scanner.nextLine();

                            String start = startShow;
                            String End = EndShow;

                            showselection.showList.get(i).setStartShow(start);
                            showselection.showList.get(i).setEndShow(End);
                            System.out.println("수정된 시작시간" + showselection.showList.get(i).getStartShow());
                            System.out.println("수정된 종료시간" + showselection.showList.get(i).getEndShow());
                            break Loop2;
                        }

                    }
                    break;
                } else {
                    System.out.println("잘못입력함...다시입력");
                    break;
                }
                
            case 3:
                System.out.println("수정할 오페라 날짜를 입력하세요(4.3)(4.5)(4.7)");
                String showDate3 = scanner.nextLine(); // showData 에 발레회차를 넣음

                if (showDate3.equals("4.3")) {

                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.3")) {
                            // showselection.showList.get(i).getShowType().equals("Ballet1")
                            System.out.println("시작 시간:14:00" + " " + "종료시간:17:00");

                            System.out.println("수정할 시작시간을 입력하세요");
                            String startShow = scanner.nextLine();
                            System.out.println("수정할 종료시간을 입력하세요");
                            String EndShow = scanner.nextLine();

                            String start = startShow;
                            String End = EndShow;

                            showselection.showList.get(i).setStartShow(start);
                            showselection.showList.get(i).setEndShow(End);
                            System.out.println("수정된 시작시간" + showselection.showList.get(i).getStartShow());
                            System.out.println("수정된 종료시간" + showselection.showList.get(i).getEndShow());
                            break Loop2;
                        }

                    }
                    break;
                } else if (showDate3.equals("4.5")) {

                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.5")) {
                            System.out.println("시작 시간:14:00" + " " + "종료시간:17:00");

                            System.out.println("수정할 시작시간을 입력하세요");
                            String startShow = scanner.nextLine();
                            System.out.println("수정할 종료시간을 입력하세요");
                            String EndShow = scanner.nextLine();

                            String start = startShow;
                            String End = EndShow;

                            showselection.showList.get(i).setStartShow(start);
                            showselection.showList.get(i).setEndShow(End);
                            System.out.println("수정된 시작시간" + showselection.showList.get(i).getStartShow());
                            System.out.println("수정된 종료시간" + showselection.showList.get(i).getEndShow());
                            break Loop2;
                        }

                    }
                    break;
                }else if (showDate3.equals("4.7")) {

                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.7")) {
                            System.out.println("시작 시간:14:00" + " " + "종료시간:17:00");

                            System.out.println("수정할 시작시간을 입력하세요");
                            String startShow = scanner.nextLine();
                            System.out.println("수정할 종료시간을 입력하세요");
                            String EndShow = scanner.nextLine();

                            String start = startShow;
                            String End = EndShow;

                            showselection.showList.get(i).setStartShow(start);
                            showselection.showList.get(i).setEndShow(End);
                            System.out.println("수정된 시작시간" + showselection.showList.get(i).getStartShow());
                            System.out.println("수정된 종료시간" + showselection.showList.get(i).getEndShow());
                            break Loop2;
                        }

                    }
                    break;
                } else {
                    System.out.println("잘못입력함...다시입력");
                    break;
                }    
                
                
            case 4:
                break Loop1;
            default:
                break;
            }
        }
    }// showRevise() End

    public void cancelShow() { // 공연 취소
        Loop: while (true) {
            System.out.println("어떤 공연을 취소하시겠습니까??");
            System.out.println("1.발레");
            System.out.println("2.음악회");
            System.out.println("3.오페라");
            System.out.println("4.adminLogin 메뉴로 돌아가기");
            System.out.print("1~4중하나를 입력하세요:");
            int selection = Integer.parseInt(scanner.nextLine());

            switch (selection) {
            case 1: // 발레 공연을 개설
                System.out.println("취소할 공연 날짜를 입력하세요(4.1)(4.4)");
                String showDate = scanner.nextLine();

                if (showDate.equals("4.1")) {
                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.1")) {
                            showselection.showList.remove(i);
                        }
                    }
                    System.out.println("4.1공연이 취소되었습니다");
                } else if (showDate.equals("4.4")) {
                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.4")) {
                            showselection.showList.remove(i);
                        }
                    }
                    System.out.println("4.4공연이 취소되었습니다");
                } else {
                    System.out.println("잘못 입력하셨습니다. 다시입력하세요");

                }
                break;

            case 2: // 음악회 개설
                System.out.println("개설할 공연 날짜를 입력하세요(4.2)(4.6)");
                String showDate2 = scanner.nextLine();
                if (showDate2.equals("4.2")) {
                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.2")) {
                            showselection.showList.remove(i);
                        }
                    }
                    System.out.println("4.2공연이 취소되었습니다");
                } else if (showDate2.equals("4.6")) {
                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.6")) {
                            showselection.showList.remove(i);
                        }
                    }
                    System.out.println("4.6공연이 취소되었습니다");
                } else {
                    System.out.println("잘못 입력하셨습니다.");

                }
                break;

            case 3: // 오페라 공연 개설
                System.out.println("취소할 공연 날짜를 입력하세요(4.3)(4.5)(4.7)");
                String showDate3 = scanner.nextLine();
                if (showDate3.equals("4.3")) {
                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.3")) {
                            showselection.showList.remove(i);
                        }
                    }
                    System.out.println("4.3공연이 취소되었습니다");
                } else if (showDate3.equals("4.5")) {
                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.5")) {
                            showselection.showList.remove(i);
                        }
                    }
                    System.out.println("4.5공연이 취소되었습니다");
                } else if (showDate3.equals("4.7")) {
                    for (int i = 0; i < showselection.showList.size(); i++) {
                        if (showselection.showList.get(i).getShowDate().equals("4.7")) {
                            showselection.showList.remove(i);
                        }
                    }
                    System.out.println("4.7공연이 취소되었습니다");
                } else {
                    System.out.println("잘못 입력하셨습니다.");

                }
                break;
            case 4:// adminLogin 메뉴로 돌아가기
                break Loop; // while문을 탈출함
            default:
                break;
            }// switch End
        } // Loop:while End
    }// showCancle() End

    // IO사용 Reader
    public void checkList() { //공연 목록 확인(좌석도 같이보여줌) 만들어진 공연목록 전체가나옴 IO(Reader로읽음)
        StringReader input = null;
        String a = showselection.showList.toString();
        try {
            input = new StringReader(a);
            input.read();
        }catch(Exception e) {
        }
        System.out.println(a);
    }//checkList() End

    // ***********뒤*****************
    private void checkBalance() { // 총매출 확인 //고객까지 같이 봐야함.... 뒷줄

    }// checkBalance() End

//	private void end() {// 종료
//	
//	}// end() End

    public String getAdminId() {
        return adminId;
    }

    public int getAdminPwd() {
        return adminPwd;
    }

    public int getTotalBalance() {
        return totalBalance;
    }

}// Admin End
