package entity;
	import java.sql.Connection;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;
	import java.util.HashMap;


	import searchbookDB.BookStoreDB;
/*
 * 
 * Booktype
 * 0 文学
 * 1 信息技术
 * 2 哲学宗教
 * 3 语言
 * 4 艺术
 * 5 政治经济
 * 6 漫画*/
public class BookMgr {
		private HashMap<String, User> bookList;

		public BookMgr() {
			super();
		}

		/**
		 * 得到所有书本的列表
		 * 
		 * @return
		 */
		public HashMap getBookList() {
			HashMap bookList = new HashMap();
			Connection conn = null;
			Statement stmt = null;
			ResultSet rset = null;
			Book book= null;
			try {
				conn = BookStoreDB.getConnection();
				String sql = "select * from book";
				stmt = conn.createStatement();
				rset = stmt.executeQuery(sql);
				while (rset.next()) {
					book = new Book(rset.getString("id"), rset.getInt("booktype"),
							rset.getString("name"),rset.getString("author"), rset.getString("press"),
							rset.getDouble("price"),rset.getInt("amount"),rset.getString("pic"));

					bookList.put(rset.getString("name"), book);
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
			return bookList;
		}

		public int addBook(Book newBook) {
			int result = 0; //
			if (findBook(newBook)) {
				result = 1; //
			} else {
				String sql = "insert into book(id,booktype,name,author,press,price,amount,pic)values('"
						+ newBook.getId()
						+ "','"
						+ newBook.getBooktype()
						+ "','"
						+ newBook.getName()
						+ "','"
						+ newBook.getAuthor()
						+ "','"
						+ newBook.getPress()
						+ "','"
                        + newBook.getPrice()
                        + "','"
						+newBook.getAmount() 
						+ "','"
						+newBook.getPic()+ "')'";

				if (BookStoreDB.update(sql)) {
					result = 2; //
				}
			}
			return result;
		}

		public boolean findBook(Book book) {
			boolean result = false;
			String sql = "select * from book where name=('"
					+ book.getName() + "')";
			result = BookStoreDB.hasRecord(sql);
			return result;
		}

		public boolean deleteBook(String name) {
			boolean result = false;
			String sql = "delete from book where name=('" + name
					+ "')";
			result = BookStoreDB.delete(sql);
			System.out.println("delete book:" + sql);
			return result;
		}

		public Book getBook(String name) {
			String sql = "select * from book where name=('" + name
					+ "')";
			Book book = null;
			Connection conn = null;
			Statement stmt = null;
			ResultSet rset = null;

			try {
				conn = BookStoreDB.getConnection();
				stmt = conn.createStatement();
				rset = stmt.executeQuery(sql);
				int i = 0;
				while (rset.next()) {
					book = new Book(rset.getString("id"),
							rset.getInt("booktype"), rset.getString("name"),
							rset.getString("author"),rset.getString("press"),
							rset.getDouble("price"),
							rset.getInt("amount"), rset.getString("pic"));

				}

			} catch (SQLException e) {
				e.printStackTrace();

			} finally {
				BookStoreDB.clean(conn, stmt, rset);
			}
			return book;
		}
		public Book getBookbyID(String bookid) {
			String sql = "select * from book where id=('" + bookid
					+ "')";
			Book book = null;
			Connection conn = null;
			Statement stmt = null;
			ResultSet rset = null;

			try {
				conn = BookStoreDB.getConnection();
				stmt = conn.createStatement();
				rset = stmt.executeQuery(sql);
				int i = 0;
				while (rset.next()) {
					book = new Book(rset.getString("id"),
							rset.getInt("booktype"), rset.getString("name"),
							rset.getString("author"),rset.getString("press"),
							rset.getDouble("price"),
							rset.getInt("amount"), rset.getString("pic"));

				}

			} catch (SQLException e) {
				e.printStackTrace();

			} finally {
				BookStoreDB.clean(conn, stmt, rset);
			}
			return book;
		}
		
		/* = "insert into book(id,booktype,name,author,press,price,amount,pic)values('"
					+ newBook.getId()
					+ "','"
					+ newBook.getBooktype()
					+ "','"
					+ newBook.getName()
					+ "','"
					+ newBook.getAuthor()
					+ "','"
					+ newBook.getPress()
					+ "','"
                 + newBook.getPrice()
                 + "','"
					+newBook.getAmount() 
					+ "','"
					+newBook.getPic()*/

		public int editBook(Book book) {
			int result = 1;
			String sql = "update book set id ='" + book.getId()
					+ "',booktype='" + book.getBooktype() +"',name='"+book.getName()+
					"',author='"+ book.getAuthor() + "' " + "where press='"
					+ book.getPress() + "where price='"
					+ book.getPrice()+ "where amount='"
					+ book.getAmount()+ "where pic='"
					+ book.getPic()   + "')";
			//System.out.println("edit user:" + sql);
			if (BookStoreDB.update(sql)) {
				result = 2; 
			}

			return result;
		}

}
