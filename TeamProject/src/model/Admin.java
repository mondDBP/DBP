package model;

public class Admin {
	private String admin_id;
	private String admin_pw;
	
	public String getAdmin_id() {
		return admin_id;
	}
	
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	
	public String getAdmin_pw() {
		return admin_pw;
	}
	
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	
	@Override
	public String toString() {
		return "Admin [admin_id=" + admin_id + ", admin_pw=" + admin_pw + "]";
	}
	
	public Admin(String admin_id, String admin_pw) {
		super();
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
	}
	
	public boolean matchPassword(String password) {
		if (password == null) {
			return false;
		}
		return this.admin_pw.equals(password);
	}
}
