package model;

//★ 모두 FK로 구성된 속성이라 필요없으면 삭제해도됩니다
public class Interest {
	private String user_id;
	private String category_name;

//	생성자
	public Interest() {}
	public Interest(String user_id, String category_name) {
		super();
		this.user_id = user_id;
		this.category_name = category_name;
	}
	
	@Override
	public String toString() {
		return "Interest [user_id=" + user_id + ", category_name=" + category_name + "]";
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	
	
	
}
