package servlet;

import java.io.IOException; 


import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession; 


import entity.Cart; 
import entity.CartItem; 
import entity.Book; 
import org.SessionListener; 
import org.WebUtil; 


public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    static int number=0;//the number of items in the cart

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//get data
		
		String book_id=request.getParameter("id");
		String book_name=request.getParameter("name");
		double book_price=Double.parseDouble(request.getParameter("price"));
		
		//get CART in current Session
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		//if no CART in current Session
		if(cart==null){
			//get id of session,create a cart for it
			String sid=WebUtil.getSessionIdByNameInCookie(request, "sessionId");
			//if have got the sessionId,get previous session through Listener,to see if the cart has existed
			if(sid!=null){
				HttpSession session=SessionListener.getSessionById(sid);
				
				//if has been visited,it means sesionid exists,but cart is not the same way
				//so firstly get it!
				if(session!=null){
					//get CART in previous session
					cart=(Cart)session.getAttribute("cart");
					//now get it!
					if(cart!=null){
						//save the cart in current session
						request.getSession().setAttribute("cart", cart);
						//save this session to Cookie
						WebUtil.addCookie(response,"sessionId",request.getSession().getId(),request.getSession().getMaxInactiveInterval());
						//remove last session,to ensure that the amount of sessionid is equal to that in cookie
						
					}
				}
			}
		}
		
		//new cart
		if(cart==null){
			cart=new Cart();
			//put new cart to current session
			request.getSession().setAttribute("cart", cart);
			//save it to cookie
			WebUtil.addCookie(response, "sessionId", request.getSession().getId(), request.getSession().getMaxInactiveInterval());
		}
		
		//PUT BOOKS INTO CARTIEMS & PUT CARTITEMS INTO CART
		if(book_id!=null &&book_name!=null/*&&book_price!=null*/){
			 Book book=new Book();
			 book.setId(book_id);
	         book.setName(book_name);
	         book.setPrice(book_price);
	         //put books into CARTITEM
	         CartItem item=new CartItem();
	         item.setBook(book);
	         number++;//static int ,the number of items in the cart
	         item.setCount(number);
	         
	         //put ITEMCART into CART
	         cart.addCartItem(item);
		}
		//put the latest cart to request
		request.setAttribute("cart", cart);
		
		//jump...
		request.getRequestDispatcher("/Cart.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
