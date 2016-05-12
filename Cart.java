package entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Cart implements Serializable {

	List<CartItem> list=new ArrayList<CartItem>();
	
	public List<CartItem> getList(){
		return list;
	}
	
	public void setList(List<CartItem> list){
		this.list=list;
	}
	
	public void addCartItem(CartItem item){
		/*for(CartItem it:list){
			if(it.getBook().getId()==item.getBook().getId())
				return;
		}
		list.add(item);*/
		 for (Iterator<CartItem> iter = list.iterator(); iter.hasNext();) {  
	            CartItem list = iter.next();  
	            if(list.getBook().getId() == item.getBook().getId()) {  
	                list.setCount(list.getCount() + 1);  
	                return;  
	            }  
	        }  
	          
	       list.add(item);  
	}
	
	public double getTotalPrice(){
		double d=0.0;
		for(Iterator<CartItem> it=list.iterator();it.hasNext();){
			CartItem current=it.next();
		//d+=current.getBook().getPrice()*current.getCount();
		//	d+=current.getBook().getPrice()*current.getBook().getNumber();
			d+=current.getBook().getPrice();
		}
		return d;
	}
	
	public void removeItem(CartItem item){
		list.remove(item);
	}
	
	public void deleteItemById(String bookId){
		for(Iterator<CartItem> iter=list.iterator();iter.hasNext();){
			CartItem item=iter.next();
			if(item.getBook().getId().equals(bookId)){
				iter.remove();
				return;
			}
		}
	}
	public void clearCart(){
		list.clear();
	}
	
	
	
      
}
