package model;

public class Back_Order {//변수8개
	private int user_id_pk_seq;	//PK	//USER_ID
	private int project_id;		//PK 	//PROJECT_ID
	private int amount_pleded;			//AMOUNT_PLEDGED
	private int reward_option;			//REWARD_OPTION
	private String back_date;//후원날짜	//BACK_DATE
	private int rest_day;				//REST_DAY
	private int is_success;				//IS_SUCCESS
	private int is_paid;				//IS_PAID
	
	public Back_Order() {}
	public Back_Order(int user_id_pk_seq, int project_id, int amount_pleded, int reward_option, String back_date,
			int rest_day, int is_success, int is_paid) {
		this.user_id_pk_seq = user_id_pk_seq;
		this.project_id = project_id;
		this.amount_pleded = amount_pleded;
		this.reward_option = reward_option;
		this.back_date = back_date;
		this.rest_day = rest_day;
		this.is_success = is_success;
		this.is_paid = is_paid;
	}
	@Override
	public String toString() {
		return "Back_Order [user_id_pk_seq=" + user_id_pk_seq + ", project_id=" + project_id + ", amount_pleded="
				+ amount_pleded + ", reward_option=" + reward_option + ", back_date=" + back_date + ", rest_day="
				+ rest_day + ", is_success=" + is_success + ", is_paid=" + is_paid + "]";
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
	public int getAmount_pleded() {
		return amount_pleded;
	}
	public void setAmount_pleded(int amount_pleded) {
		this.amount_pleded = amount_pleded;
	}
	public int getReward_option() {
		return reward_option;
	}
	public void setReward_option(int reward_option) {
		this.reward_option = reward_option;
	}
	public String getBack_date() {
		return back_date;
	}
	public void setBack_date(String back_date) {
		this.back_date = back_date;
	}
	public int getRest_day() {
		return rest_day;
	}
	public void setRest_day(int rest_day) {
		this.rest_day = rest_day;
	}
	public int getIs_success() {
		return is_success;
	}
	public void setIs_success(int is_success) {
		this.is_success = is_success;
	}
	public int getIs_paid() {
		return is_paid;
	}
	public void setIs_paid(int is_paid) {
		this.is_paid = is_paid;
	}
	
	
	
	
	
	
}