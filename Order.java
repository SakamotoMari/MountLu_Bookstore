package entity;
import java.io.Serializable;
import java.sql.Date;
public class Order implements Serializable{

	private String username;
	private String bookid;
	private int number;
	
	public Order(){
		super();
	}
	public Order(String username,String bookid,int number){
		this.username=username;
		this.bookid=bookid;
		this.number=number;
	}
	public String getUsername(){
		return username;
	}
	public void setUsername(String username){
		this.username=username;
	}
	public String getBookid(){
		return bookid;
	}
	public void setBookid(String bookid){
		this.bookid=bookid;
	}
	public int getNumber(){
		return number;
	}
	public void setNumber(int number){
		this.number=number;
	}
}
