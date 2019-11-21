package model;

/**
 * 사용자 관리를 위해 필요한 도메인 클래스, dto
 */
public class User {
	private int user_id_pk_seq;//users테이블의 시퀀스 값 int형 USER_ID
	private String userId;//users테이블의 아이디 String형 ID
	private String password; //PWD
	private String name;	 //NAME
	private String phone;	 //PHONE_NUMBER
	private String address;	 //ADDRESS
	private String email;	 //EMAIL
	private String email2;
	private String resid_id; //RESID_ID
	private String resid_id2;
	
	public String getResid_id2() {
		return resid_id2;
	}

	public void setResid_id2(String resid_id2) {
		this.resid_id2 = resid_id2;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	
	public String getTotalEmail() {
		return email + "@" + email2;
	}
	
	public String getTotalResid_id() {
		return resid_id + "-" + resid_id2;
	}

	public User() { }		// 기본 생성자//
	
	public User(String userId, String password, String name, String phone, String address,
			String email, String email2, String resid_id) {
		
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.email2 = email2;
		this.resid_id = resid_id;
	}
	
	public User(String userId, String password, String name, String phone, String address,
			String email, String email2, String resid_id, String resid_id2) {
		
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.email2 = email2;
		this.resid_id = resid_id;
		this.resid_id2 = resid_id2;
	}
	
	public User(String userId, String password, String name, String phone, String address,
			String email, String resid_id) {
		
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.resid_id = resid_id;
	}

	public User(int user_id_pk_seq, String userId, String password, String name, String phone, String address,
			String email, String resid_id) {
		this.user_id_pk_seq = user_id_pk_seq;
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.resid_id = resid_id;
	}

	public int getUser_id_pk_seq() {
		return user_id_pk_seq;
	}

	public void setUser_id_pk_seq(int user_id_pk_seq) {
		this.user_id_pk_seq = user_id_pk_seq;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getResid_id() {
		return resid_id;
	}

	public void setResid_id(String resid_id) {
		this.resid_id = resid_id;
	}

	/*public void update(User updateUser) {
        this.password = updateUser.password;
        this.name = updateUser.name;
        this.email = updateUser.email;
        this.phone = updateUser.phone;
    }
	*/
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	/* 비밀번호 검사 */
	public boolean matchPassword(String password) {
		if (password == null) {
			return false;
		}
		return this.password.equals(password);
	}
	
	public boolean isSameUser(String userid) {
        return this.userId.equals(userid);
    }

	@Override
	public String toString() {
		return "User [user_id_pk_seq=" + user_id_pk_seq + ", userId=" + userId + ", password=" + password + ", name="
				+ name + ", phone=" + phone + ", address=" + address + ", email=" + email + ", resid_id=" + resid_id
				+ "]";
	}

//	@Override
//	public String toString() {
//		return "User [userId=" + userId + ", password=" + password + ", name=" + name + ", email=" + email + ", phone="
//				+ phone + "]";
//	}	
	
}