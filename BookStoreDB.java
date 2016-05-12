package searchbookDB;

import java.sql.*;

public class BookStoreDB {	
	/**
	 * �������ݿ�����
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
	 * �ر����ݿ�����ӡ�����Լ����������Դ
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
	 * ����Ƿ��������SQL���ļ�¼���ڴ������û�ʱ���ڼ���û����Ƿ��Ѵ���
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
	 * ��ִ��ѯ��䣬���ؽ����
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
	 * �������ݿ��¼
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
	 * ɾ�����ݿ��¼
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
import java.io.*;                                    //����java.io��
 import java.util.*;
 import java.sql.*;
 import javax.servlet.*;
 import javax.servlet.http.*;
public class BookStoreDB extends HttpServlet{            //����һ���̳�HttpServlet�Ĺ�����
     ServletConfig config=null;                        //����һ��ServletConfig����
     private String driverName="myBSDB";                    //����˽���ַ�����������ʼ��
     private String username="root";                    //��������ݿ��û���
     private String password="961217";                    //��������ݿ���������
     private String dbName="bookstore";                        //��������ݿ���
     private Connection conn;                        //��ʼ������
     private Statement stmt;                        //��ʼ�����ݿ����
     ResultSet rs=null;                            //��ʼ�������
     public void init(ServletConfig config)throws ServletException{
      super.init(config);                            //�̳и����init()����
      this.config=config;                            //��ȡ������Ϣ
      driverName=config.getInitParameter("driverName");//�������ļ��л�ȡJDBC������
      username=config.getInitParameter("username");    //��ȡ���ݿ��û���
       password=config.getInitParameter("password");    //��ȡ���ݿ���������
       dbName=config.getInitParameter("dbName");    //��ȡҪ���ӵ����ݿ�
         }
     public void doGet(HttpServletRequest req,HttpServletResponse resp)throws IOException,ServletException{
        
         resp.setContentType("text/html;charset=GBK");    //�����ַ������ʽ
         PrintWriter out=resp.getWriter();                //ʵ������������ҳ�����
           out.println("<html>");                    //ʵ�����ɾ�̬Html
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
                   out.println("Servlet�������ݿ�ɹ�");
                   out.println("<table border=1 bordercolorlight=#000000>");
                   out.println("<tr><td width=40>�鼮����</td>");
                   out.println("<td>�鼮����</td>");
                   out.println("<td>�鼮����</td>");
                   out.println("<td>����</td>");
                   out.println("<td>�۸�</td></tr>");
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