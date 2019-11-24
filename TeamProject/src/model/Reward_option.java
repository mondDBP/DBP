package model;

public class Reward_option {//7개
	private int option_id;	//OPTION_ID ->Oracle CHAR에서 NUMBER(10)으로변경 ->완료
	private int project_id;	 	//PROJECT_ID
	private int price;			//PRICE
	private int shipping_fee;	//SHIPPING_FEE
	private String description; //DESCRIPTION  -CLOB
	private int backer_count;	//BACKER_COUNT
	private int amount_limit;	//AMOUNT_LIMIT
	
//	생성자
	public Reward_option() {}
	public Reward_option(int option_id, int project_id, int price, int shipping, String description,
			int backer_count, int amount_limit) {
		super();
		this.option_id = option_id;
		this.project_id = project_id;
		this.price = price;
		this.shipping_fee = shipping;
		this.description = description;
		this.backer_count = backer_count;
		this.amount_limit = amount_limit;
	}
//	toString
	@Override
	public String toString() {
		return "Reward_option [option_id=" + option_id + ", project_id=" + project_id + ", price=" + price
				+ ", shipping=" + shipping_fee + ", description=" + description + ", backer_count=" + backer_count
				+ ", amount_limit=" + amount_limit + "]";
	}
//	getter, setter
	public int getOption_id() {
		return option_id;
	}
	public void setOption_id(int option_id) {
		this.option_id = option_id;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getShipping_fee() {
		return shipping_fee;
	}
	public void setShipping_fee(int shipping) {
		this.shipping_fee = shipping;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getBacker_count() {
		return backer_count;
	}
	public void setBacker_count(int backer_count) {
		this.backer_count = backer_count;
	}
	public int getAmount_limit() {
		return amount_limit;
	}
	public void setAmount_limit(int amount_limit) {
		this.amount_limit = amount_limit;
	}
	
	
}
