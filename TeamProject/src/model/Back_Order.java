package model;

public class BackOrder {
	//º¯¼ö8°³
	private int user_id;
	private int project_id;
	private int amount_pleded;
	private int reward_option;
	private String back_date;
	private int rest_day;
	private int is_success;
	private int is_paid;
	
	public BackOrder(int user_id, int project_id, int amount_pleded, int reward_option, String back_date, int rest_day,
			int is_success, int is_paid) {
		super();
		this.user_id = user_id;
		this.project_id = project_id;
		this.amount_pleded = amount_pleded;
		this.reward_option = reward_option;
		this.back_date = back_date;
		this.rest_day = rest_day;
		this.is_success = is_success;
		this.is_paid = is_paid;
	}
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
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
