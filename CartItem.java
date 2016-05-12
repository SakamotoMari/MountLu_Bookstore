package entity;
import java.io.Serializable;

public class CartItem implements Serializable {

	 private Book book;
	 private int count;
	 
	 public Book getBook(){
		 return book;
	 }
	 public void setBook(Book book){
		 this.book=book;
	 }
	 public int getCount(){
		 return count;
	 }
	 public void setCount(int count){
		 this.count=count;
	 }
}
