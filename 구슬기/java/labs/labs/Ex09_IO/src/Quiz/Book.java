package Quiz;

import java.io.Serializable;

//도서 클래스

public class Book implements Serializable{  //클래스의 직렬화 기능은 java.io.Serializable 인터페이스를 구현하는 클래스에 의해 가능합니다

      final String isbn;

      String title;

      int price;

      public Book(String isbn, String title,int price){

             this.isbn = isbn;

             this.title = title;

             this.price = price;

      }

      public String ISBN(){

             return isbn;

      }

      public String toString(){

             return String.format("ISBN:%s 이름:%s 가격:%d", isbn, title,price);        }

}
