package model;

import java.sql.Date;

public class Card {
	private int user_id_pk_seq;		//USER_ID
	private String card_company;	//CARD_COMPANY
	private int card_number;		//CARD_NUMBER
	private Date expiration;		//EXPIRATION	-Date
//	»ý¼ºÀÚ
	public Card() {}
	public Card(String string, String card_company, int card_number, Date expiration) {
		super();
		this.user_id_pk_seq = user_id_pk_seq;
		this.card_company = card_company;
		this.card_number = card_number;
		this.expiration = expiration;
	}
//	toString
	@Override
	public String toString() {
		return "Card [user_id=" + user_id_pk_seq + ", card_company=" + card_company + ", card_number=" + card_number
				+ ", expiration=" + expiration + "]";
	}
//	getter, setter
	public int getUser_id_pk_seq() {
		return user_id_pk_seq;
	}
	public void setUser_id_pk_seq(int user_id_pk_seq) {
		this.user_id_pk_seq = user_id_pk_seq;
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
