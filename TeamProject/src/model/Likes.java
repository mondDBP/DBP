package model;

//�ڿܷ�Ű 2���θ� ������ ���̺��̶� DTO�� �ʿ��ұ��? �ʿ������ ���߿� ����

public class Likes {
	private int user_id_pk_seq; //USER_ID
	private int project_id_seq;		//project_id_seq
	
	public Likes() {}
	public Likes(int user_id_pk_seq, int project_id_seq) {
		this.user_id_pk_seq = user_id_pk_seq;
		this.project_id_seq = project_id_seq;
	}

	public int getUser_id_pk_seq() {
		return user_id_pk_seq;
	}

	public void setUser_id_pk_seq(int user_id_pk_seq) {
		this.user_id_pk_seq = user_id_pk_seq;
	}

	public int getProject_id_seq() {
		return project_id_seq;
	}

	public void setProject_id_seq(int project_id_seq) {
		this.project_id_seq = project_id_seq;
	}
	
	
	

	
	
	
	


}
