package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		processRequest(request,response);
	}

	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
	
		
		HttpSession session = request.getSession();
		OrderMgr orderMgr=new OrderMgr();
		
		String operation = request.getParameter("operation");
		Object username=session.getAttribute("user");
		String name=(String)username;
		String bookid;
		int number;
			
		 Cart c=(Cart)session.getAttribute("cart");
		 List<CartItem> items = c.getList(); 
		 Order order = new Order();
		 
		if(operation.equals("add")){
			 for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) {  
				 CartItem ci = it.next();  
				 bookid=ci.getBook().getId();
				 number=1;
				 order.setBookid(bookid);
				 order.setNumber(number);
				 order.setUsername(name);
				 if(orderMgr.addOrder(order)==2){   //update successfully
					 request.getRequestDispatcher("/orders.jsp").forward(request, response);
				 }
				 else{
						request.getRequestDispatcher("/orders.jsp").forward(request, response);
					}
			 } 
			c.clearCart();//clear the cart after having submitted all the orders
			
		}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
