package model;

import java.sql.Date;

public class Project {//º¯¼ö12°³
	private int project_id;			//PROJECT_ID
	private int user_id_pk_seq;		//USER_ID		- NUMBER(10,0)
	private String title;			//TITLE
	private Date start_date; 		//START_DATE	- Date from imiport java.sql.Date
	private String image;			//IMAGE			- Anytype	
	private String description; 	//DESCRIPTION   - Clob
	private int goal;				//GOAL
	private int fund_rate;			//FUND_RATE
	private int rest_day;			//REST_DAY
	private int funding_period;		//FUNDING_PERIOD
	private int total_money;		//TOTAL_MONEY
	private String category_name;	//CATEGORY_NAME
	
	
	public Project() {};
	public Project(int project_id, int user_id_pk_seq, String title, Date start_date, String image, String description,
			int goal, int fund_rate, int rest_day, int funding_period, int total_money, String category_name) {
		this.project_id = project_id;
		this.user_id_pk_seq = user_id_pk_seq;
		this.title = title;
		this.start_date = start_date;
		this.image = image;
		this.description = description;
		this.goal = goal;
		this.fund_rate = fund_rate;
		this.rest_day = rest_day;
		this.funding_period = funding_period;
		this.total_money = total_money;
		this.category_name = category_name;
	}
	
	public Project(int project_id, String title, Date start_date, String image,
			int goal, int fund_rate, int rest_day, int total_money, String category_name) {
		this.project_id = project_id;
		this.title = title;
		this.start_date = start_date;
		this.image = image;
		this.goal = goal;
		this.fund_rate = fund_rate;
		this.rest_day = rest_day;
		this.total_money = total_money;
		this.category_name = category_name;
	}
	
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getGoal() {
		return goal;
	}
	public void setGoal(int goal) {
		this.goal = goal;
	}
	public int getFund_rate() {
		return fund_rate;
	}
	public void setFund_rate(int fund_rate) {
		this.fund_rate = fund_rate;
	}
	public int getRest_day() {
		return rest_day;
	}
	public void setRest_day(int rest_day) {
		this.rest_day = rest_day;
	}
	public int getFunding_period() {
		return funding_period;
	}
	public void setFunding_period(int funding_period) {
		this.funding_period = funding_period;
	}
	public int getTotal_money() {
		return total_money;
	}
	public void setTotal_money(int total_money) {
		this.total_money = total_money;
	}
	
}
