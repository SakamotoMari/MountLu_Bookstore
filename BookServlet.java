package servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Book;
import entity.BookMgr;

public class BookServlet extends HttpServlet{
	
	 public BookServlet(){
     	super();
     }
	 public void destroy() {
			super.destroy(); // Just puts "destroy" string in log
			// Put your code here
		}
	
	 public void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			processRequest(request,response);
		}

		/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	 
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException{
		
		processRequest(request,response);
		
		}	
	
	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String operation = request.getParameter("operation");
		String name= request.getParameter("name");		
		HttpSession session = request.getSession();		
		BookMgr bookMgr = new BookMgr();
		if(operation.equals("del")){
			if(bookMgr.deleteBook(name)){
				request.getRequestDispatcher("/book/delete.jsp").forward(request, response);
			}
			else{
				PrintWriter out = response.getWriter();
				out.println("<script> alert('É¾³ý²»³É¹¦');</script>");
			}
		}
		if(operation.equals("add")){
			String id=request.getParameter("id");
			String booktype=request.getParameter("booktype");
			//String name=request.getParameter("name");
			String author=request.getParameter("author");
			String press=request.getParameter("press");
			String price=request.getParameter("price");
			String amount=request.getParameter("amount");
			String pic=request.getParameter("pic");
			
		
			//System.out.println("userType=" + userType);
			Book book = new Book(id,Integer.parseInt(booktype),name,author,press,Double.parseDouble(price),Integer.parseInt(amount),pic);
			if(bookMgr.addBook(book) ==2){
				request.getRequestDispatcher("/book/main.jsp").forward(request, response);
			}
			else if(bookMgr.addBook(book) ==1){
				PrintWriter out = response.getWriter();
				request.getRequestDispatcher("/book/addBook.jsp").forward(request, response);
			}
		}
		if(operation.equals("edit")){
			String id=request.getParameter("id");
			String booktype=request.getParameter("booktype");
			//String name=request.getParameter("name");
			String author=request.getParameter("author");
			String press=request.getParameter("press");
			String price=request.getParameter("price");
			String amount=request.getParameter("amount");
			String pic=request.getParameter("pic");
			System.out.println("bookname=" + name);
			Book book = new Book(id,Integer.parseInt(booktype),name,author,press,Double.parseDouble(price),Integer.parseInt(amount),pic);
			if(bookMgr.editBook(book) ==2){
				request.getRequestDispatcher("/book/main.jsp").forward(request, response);
			}
			else if(bookMgr.addBook(book) ==1){
				PrintWriter out = response.getWriter();
				request.getRequestDispatcher("/book/editBook.jsp?name=" +name).forward(request, response);
			}
		}
		if(operation.equals("search")){
			
			
		}
	}
}
	
