package model;

//�ڿܷ�Ű 2���θ� ������ ���̺��̶� DTO�� �ʿ��ұ��? �ʿ������ ���߿� ����

public class Likes {
	private int user_id_pk_seq; //USER_ID
	private int project_id;		//PROJECT_ID
	
	public Likes() {}
	public Likes(int user_id_pk_seq, int project_id) {
		this.user_id_pk_seq = user_id_pk_seq;
		this.project_id = project_id;
	}

	@Override
	public String toString() {
		return "Likes [user_id_pk_seq=" + user_id_pk_seq + ", project_id=" + project_id + "]";
	}

	public int getUser_id_pk_seq() {
		return user_id_pk_seq;
	}

	public void setUser_id_pk_seq(int user_id_pk_seq) {
		this.user_id_pk_seq = user_id_pk_seq;
	}

	public int getProject_id() {
		return project_id;
	}

	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	
	
	

	
	
	
	


}
