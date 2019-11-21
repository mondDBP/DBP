package model;

import java.sql.Date;

public class Shipping {
	private String shipping_id;		//SHIPPING_ID  -CHAR(18 BYTE)
	private String user_id;			//USER_ID
	private int project_id;			//PROJECT_ID
	private Date shipping_date;		//SHIPPING_DATE -DATE

//	»ý¼ºÀÚ
	public Shipping() {}
	public Shipping(String shipping_id, String user_id, int project_id, Date shipping_date) {
		super();
		this.shipping_id = shipping_id;
		this.user_id = user_id;
		this.project_id = project_id;
		this.shipping_date = shipping_date;
	}
//	toString
	@Override
	public String toString() {
		return "Shipping [shipping_id=" + shipping_id + ", user_id=" + user_id + ", project_id=" + project_id
				+ ", shipping_date=" + shipping_date + "]";
	}
//	getter, setter
	public String getShipping_id() {
		return shipping_id;
	}
	public void setShipping_id(String shipping_id) {
		this.shipping_id = shipping_id;
	}
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
	public Date getShipping_date() {
		return shipping_date;
	}
	public void setShipping_date(Date shipping_date) {
		this.shipping_date = shipping_date;
	}
	
}
