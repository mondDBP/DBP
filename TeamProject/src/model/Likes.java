package model;

//★외래키 2개로만 구성된 테이블이라 DTO가 필요할까요? 필요없으면 나중에 삭제

public class Likes {
	private String user_id;
	private int project_id;
	
//	생성자
	public Likes(String user_id, int project_id) {
		super();
		this.user_id = user_id;
		this.project_id = project_id;
	}
//	toString
	@Override
	public String toString() {
		return "Likes [user_id=" + user_id + ", project_id=" + project_id + "]";
	}
//	getter, setter
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}

}
