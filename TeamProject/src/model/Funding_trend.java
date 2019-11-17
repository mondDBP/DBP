package model;

import java.sql.Date;

public class Funding_trend {
	private int project_id;	 //FK
	private Date date_added;//PK -- 타입을 Date로 했다
	private int amount_pledged;	 
	private int backer_count;

//	생성자
	public Funding_trend() {}
	public Funding_trend(Date date_added, int project_id, int amount_pledged, int backer_count) {
		super();
		this.date_added = date_added;
		this.project_id = project_id;
		this.amount_pledged = amount_pledged;
		this.backer_count = backer_count;
	}
//	toString
	@Override
	public String toString() {
		return "Funding_trend [date_added=" + date_added + ", project_id=" + project_id + ", amount_pledged="
				+ amount_pledged + ", backer_count=" + backer_count + "]";
	}
//	getter, setter
	public Date getDate_added() {
		return date_added;
	}
	public void setDate_added(Date date_added) {
		this.date_added = date_added;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public int getAmount_pledged() {
		return amount_pledged;
	}
	public void setAmount_pledged(int amount_pledged) {
		this.amount_pledged = amount_pledged;
	}
	public int getBacker_count() {
		return backer_count;
	}
	public void setBacker_count(int backer_count) {
		this.backer_count = backer_count;
	}	
	
	
	
}
