package model;

//�ڿܷ�Ű 2���θ� ������ ���̺��̶� DTO�� �ʿ��ұ��? �ʿ������ ���߿� ����

public class Likes {
	private String user_id;
	private int project_id;
	
//	������
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
