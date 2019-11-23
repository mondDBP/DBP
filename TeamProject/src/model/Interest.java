package model;

public class Interest {
	private String category_name;	//CATEGORY_NAME		-CHAR(18 BYTE)
	private int user_id_pk_seq;		//USER_ID			-NUMBER(10,0)
	
	public Interest(String category_name, int user_id_pk_seq) {
		this.category_name = category_name;
		this.user_id_pk_seq = user_id_pk_seq;
	}

	@Override
	public String toString() {
		return "Interest [category_name=" + category_name + ", user_id_pk_seq=" + user_id_pk_seq + "]";
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public int getUser_id_pk_seq() {
		return user_id_pk_seq;
	}

	public void setUser_id_pk_seq(int user_id_pk_seq) {
		this.user_id_pk_seq = user_id_pk_seq;
	}
	
	
	
	
	
	
	
	
}
