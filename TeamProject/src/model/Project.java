package model;


public class Project {
	private int project_id;
	private String category_name;
	private String user_id;
	private String title;
	private String start_date; // DateÇü½Ä?
	private String image;	//AnyType
	private String description; //CLOB
	private int goal;
	private int fund_rate;
	private int rest_day;
	private int funding_period;
	private int total_money;
	private int is_success;
	
	@Override
	public String toString() {
		return "Project [project_id=" + project_id + ", category_name=" + category_name + ", user_id=" + user_id
				+ ", title=" + title + ", start_date=" + start_date + ", image=" + image + ", description="
				+ description + ", goal=" + goal + ", fund_rate=" + fund_rate + ", rest_day=" + rest_day
				+ ", funding_period=" + funding_period + ", total_money=" + total_money + ", is_success=" + is_success
				+ "]";
	}
	public Project() {};
	public Project(int project_id, String category_name, String user_id, String title, String start_date, String image,
			String description, int goal, int fund_rate, int rest_day, int funding_period, int total_money,
			int is_success) {
		this.project_id = project_id;
		this.category_name = category_name;
		this.user_id = user_id;
		this.title = title;
		this.start_date = start_date;
		this.image = image;
		this.description = description;
		this.goal = goal;
		this.fund_rate = fund_rate;
		this.rest_day = rest_day;
		this.funding_period = funding_period;
		this.total_money = total_money;
		this.is_success = is_success;
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
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
	public int getIs_success() {
		return is_success;
	}
	public void setIs_success(int is_success) {
		this.is_success = is_success;
	}
	
	
}
