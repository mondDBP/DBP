package model;

public class Interest {
	private String category_name;
	private String user_id;
	
	public Interest(String category_name, String user_id) {
		this.category_name = category_name;
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Interest [category_name=" + category_name + ", user_id=" + user_id + "]";
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
	
}
