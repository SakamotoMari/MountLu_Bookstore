package searchbookDB;

import java.sql.*;

public class BookStoreDB {	
	/**
	 * 创建数据库连接
	 * @return
	 */
	public static Connection getConnection() { 
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://localhost/bookstore?user=root&password=961217&useUnicode=true&characterEncoding=utf-8";
			conn = DriverManager.getConnection(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * 关闭数据库的连接、语句以及结果集等资源
	 * @param conn
	 * @param stmt
	 * @param rset
	 */

	public static void clean(Connection conn,Statement stmt, ResultSet rset) {
		try{
			if(rset != null)
				rset.close();
			if(stmt != null)
				stmt.close();
			if(conn != null)
				conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 检查是否存在满足SQL语句的记录，在创建新用户时用于检查用户名是否已存在
	 * @param SqlString
	 * @return
	 */

	public static boolean hasRecord(String SqlString) {
		boolean result = false;
		Connection conn = null;
    	Statement stmt = null;
    	ResultSet rset = null;
    	try {
    		conn = getConnection();
			stmt = conn.createStatement();			
		    rset = stmt.executeQuery(SqlString);
		    while(rset.next()){
		    	result = true;
		    }
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally{
			clean(conn,stmt,rset);
		}
		return result;
	}
	
	/**
	 * 查执行询语句，返回结果集
	 * @param SqlString
	 * @return
	 */
	public static ResultSet query(String SqlString) {
		Connection conn = null;
    	Statement stmt = null;
    	ResultSet rset = null;
    	try {
    		conn = getConnection();
			stmt = conn.createStatement();			
		    rset = stmt.executeQuery(SqlString);		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
		} finally{
			clean(conn,stmt,rset);
		}
		return rset;
	}
	
	/**
	 * 更新数据库记录
	 * @param sql
	 * @return
	 */
	public static boolean update(String sql) {
		boolean result = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			result = true;
		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			clean(conn,stmt,rset);
		}
		return result;
	}
	
	/**
	 * 删除数据库记录
	 * @param sql
	 * @return
	 */
	public static boolean delete(String sql) {
		boolean result = false;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			stmt.execute(sql);
			result = true;
		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			clean(conn,stmt,rset);
		}
		return result;
	}

}

/*package searchbookDB;
import java.io.*;                                    //导入java.io包
 import java.util.*;
 import java.sql.*;
 import javax.servlet.*;
 import javax.servlet.http.*;
public class BookStoreDB extends HttpServlet{            //定义一个继承HttpServlet的公有类
     ServletConfig config=null;                        //定义一个ServletConfig对象
     private String driverName="myBSDB";                    //定义私有字符串常量并初始化
     private String username="root";                    //定义的数据库用户名
     private String password="961217";                    //定义的数据库连接密码
     private String dbName="bookstore";                        //定义的数据库名
     private Connection conn;                        //初始化连接
     private Statement stmt;                        //初始化数据库操作
     ResultSet rs=null;                            //初始化结果集
     public void init(ServletConfig config)throws ServletException{
      super.init(config);                            //继承父类的init()方法
      this.config=config;                            //获取配置信息
      driverName=config.getInitParameter("driverName");//从配置文件中获取JDBC驱动名
      username=config.getInitParameter("username");    //获取数据库用户名
       password=config.getInitParameter("password");    //获取数据库连接密码
       dbName=config.getInitParameter("dbName");    //获取要连接的数据库
         }
     public void doGet(HttpServletRequest req,HttpServletResponse resp)throws IOException,ServletException{
        
         resp.setContentType("text/html;charset=GBK");    //设置字符编码格式
         PrintWriter out=resp.getWriter();                //实例化对象，用于页面输出
           out.println("<html>");                    //实现生成静态Html
           out.println("<head>");
           out.println("<meta http-equiv=\"Content-Type\"content=\"text/html;charset=GBK\">");
           out.println("<title>DataBase Connection</title>");
           out.println("</head>");
           out.println("<body bgcolor=\"white\">");
           out.println("<center>");
           String url="jdbc:mysql://localhost/bookstore?user=root&password=961217&useUnicode=true&characterEncoding=8859_1";
           try{
                 Class.forName("com.mysql.jdbc.Driver");
                 conn=DriverManager.getConnection(url,username,password);
                 stmt=conn.createStatement();
                 String sql="select * from booksr";
                 rs=stmt.executeQuery(sql);
                   out.println("Servlet访问数据库成功");
                   out.println("<table border=1 bordercolorlight=#000000>");
                   out.println("<tr><td width=40>书籍编码</td>");
                   out.println("<td>书籍分类</td>");
                   out.println("<td>书籍名称</td>");
                   out.println("<td>作者</td>");
                   out.println("<td>价格</td></tr>");
                    while(rs.next()){
                     out.println("<tr><td>"+rs.getString(1)+"</td>");
                     out.println("<td>"+rs.getString(2)+"</td>");
                     out.println("<td>"+rs.getString(3)+"</td>");
                     out.println("<td>"+rs.getString(4)+"</td>");
                     out.println("<td>"+rs.getString(5)+"</td>");
                     out.println("<tr>");
                    }
                    out.println("</table>");
                    rs.close();
                    stmt.close();
                    conn.close();    
                   
               }catch(Exception e){
               e.printStackTrace();
               out.println(e.toString());    
               }
               out.println("</center>");
           out.println("</body>");
           out.println("</html>");
            }
            public void doPost(HttpServletRequest req,HttpServletResponse resp)throws IOException,ServletException{
                this.doGet(req,resp);
                }
                public void destory(){
                    config=null;
                    driverName=null;
                    username=null;
                    password=null;
                    dbName=null;
                    conn=null;
                    stmt=null;
                    rs=null;
                    }
 }*/