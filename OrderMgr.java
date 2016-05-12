package entity;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import searchbookDB.BookStoreDB;

public class OrderMgr {
	private HashMap<String, User> orderList;
	public OrderMgr(){
		
	}
	
	public HashMap getOrderList() {
		HashMap orderList = new HashMap();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		Order order = null;
		try {
			conn = BookStoreDB.getConnection();
			String sql = "select * from orders";
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while (rset.next()) {
				order = new Order(rset.getString("username"),
						rset.getString("bookid"), rset.getInt("number")
					);

				orderList.put(rset.getString("username"), order);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;
	}
	public HashMap getOrderlistByUser(String username){
		HashMap orderList = new HashMap();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		Order order = null;
		try {
			conn = BookStoreDB.getConnection();
			String sql = "select * from orders where username=('"
			+username+"')";
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while (rset.next()) {
				order = new Order(rset.getString("username"),
						rset.getString("bookid"), rset.getInt("number")
					);

				orderList.put(order.getBookid(), order);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;
	}

	public int addOrder(Order newOrder) {
		int result = 0; //
		
			String sql = "insert into orders values('"//(username,bookid,number)
					+ newOrder.getUsername()
					+ "','"
					+ newOrder.getBookid()
					+ "',"
					+ newOrder.getNumber()
					+ ")";

			if (BookStoreDB.update(sql)) {
				result = 2; //
			}
	
		return result;
	}


	public Order getOrder(String username) {
		String sql = "select * from orders where username=('" + username
				+ "')";
		Order order = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;

		try {
			conn = BookStoreDB.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			int i = 0;
			while (rset.next()) {
				order = new Order(rset.getString("username"),
						rset.getString("bookid"),
						rset.getInt("number"));

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			BookStoreDB.clean(conn, stmt, rset);
		}
		return order;
	}
}
