package entity;

public class User {
	private String username;
	private String password;
	private String  realname;
	private String email;
	private int userType;
	private int sex;

	
	public User() {
		super();
	}

	public User(String username, String password, String realname, String email,int userType,
			int sex) {
		super();
		this.username = username;
		this.password = password;
		this.realname = realname;
		this.email=email;
		this.userType = userType;
		this.sex = sex;
		
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String usrname) {
		this.username = usrname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email=email;
	}
	
	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}
	
}
