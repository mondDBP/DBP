package model;

import java.sql.Date;

public class Payment {
	private String user_id;
	private int amount;
	private String payment_id;//PK
	private int project_id;
	private Date payment_date;
	private int card_number;
	
//	������
	public Payment() {}
	public Payment(String user_id, int amount, String payment_id, int project_id, Date payment_date, int card_number) {
		super();
		this.user_id = user_id;
		this.amount = amount;
		this.payment_id = payment_id;
		this.project_id = project_id;
		this.payment_date = payment_date;
		this.card_number = card_number;
	}
//	toString
	@Override
	public String toString() {
		return "Payment [user_id=" + user_id + ", amount=" + amount + ", payment_id=" + payment_id + ", project_id="
				+ project_id + ", payment_date=" + payment_date + ", card_number=" + card_number + "]";
	}
//	getter, setter
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public int getCard_number() {
		return card_number;
	}
	public void setCard_number(int card_number) {
		this.card_number = card_number;
	}
	
	

}