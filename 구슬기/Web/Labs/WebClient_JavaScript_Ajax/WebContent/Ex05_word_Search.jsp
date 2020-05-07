<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //http://localhost:8090/WebClient_JavaScript_Ajax/Ex05_word_Search.jsp?word=a 테스트 방법
 String[] keyword = {
   "Anna"
  ,"Brittany"
  ,"Cinderella"
  ,"Diana"
  ,"Eva"
  ,"Fiona"
  ,"Gunda"
  ,"Hege"
  ,"Inga"
  ,"Johanna"
  ,"Kitty"
  ,"Linda"
  ,"Nina"
  ,"Ophelia"
  ,"Petunia"
  ,"Amanda"
  ,"Raquel"
  ,"Cindy"
  ,"Doris"
  ,"Eve"
  ,"Evita"
  ,"Sunniva"
  ,"Tove"
  ,"Unni"
  ,"Violet"
  ,"Liza"
  ,"Elizabeth"
  ,"Ellen"
  ,"Wenche"
  ,"Vicky" };

String q = request.getParameter("word");
String hint ="";

// lookup all hints from array if $q is different from "" 
if (q != "") {
    q = q.toLowerCase(); 
    int len = q.length(); //an
    for(String str : keyword){
     //out.print(str.substring(0, len));
     if(str.substring(0, len).toLowerCase().equals(q)){
      if(hint ==""){
       //out.print("data : " + hint);
       hint = str;
      }else{
       hint += "." +str;
      }
     }
    }
}
%>
<%= hint == "" ? "no suggestion" : hint %>
