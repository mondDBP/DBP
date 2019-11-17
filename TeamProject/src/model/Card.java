package model;

import java.sql.Date;

public class Card {
	private String user_id;
	private String card_company;
	private int card_number;
	private Date expiration;
//	»ı¼ºÀÚ
	public Card() {}
	public Card(String user_id, String card_company, int card_number, Date expiration) {
		super();
		this.user_id = user_id;
		this.card_company = card_company;
		this.card_number = card_number;
		this.expiration = expiration;
	}
//	toString
	@Override
	public String toString() {
		return "Card [user_id=" + user_id + ", card_company=" + card_company + ", card_number=" + card_number
				+ ", expiration=" + expiration + "]";
	}
//	getter, setter
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCard_company() {
		return card_company;
	}
	public void setCard_company(String card_company) {
		this.card_company = card_company;
	}
	public int getCard_number() {
		return card_number;
	}
	public void setCard_number(int card_number) {
		this.card_number = card_number;
	}
	public Date getExpiration() {
		return expiration;
	}
	public void setExpiration(Date expiration) {
		this.expiration = expiration;
	}
	

}
