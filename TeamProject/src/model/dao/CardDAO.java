package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Card;

public class CardDAO {
	private JDBCUtil jdbcUtil = null;

	public CardDAO() {
		jdbcUtil = new JDBCUtil(); 
	}
	
	public int create(Card card) throws SQLException {
		String sql = "INSERT INTO Card (user_id, , card_company, card_number, expiration)"
					+"VALUES (?, ?, ?, ?)";	
	
		Object[] param = new Object[] {
				user_id,
				card.getCard_number(),
				card.getCard_company(),
				card.getExpiration()
				};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil �� insert���� �Ű� ���� ����
						
		try {				
			int result = jdbcUtil.executeUpdate();	// insert �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}		
		return 0;			
	}
	public int update(Card card) throws SQLException {
		String sql = "UPDATE Card "
					+ "SET password=?, name=?, email=?, phone=?, address=? "
					+ "WHERE userid=?";
		Object[] param = new Object[] {
				card.getUser_id(),
				card.getCard_number(),
				card.getCard_company(),
				card.getExpiration()
				};							
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil�� update���� �Ű� ���� ����
			
		try {				
			int result = jdbcUtil.executeUpdate();	// update �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}		
		return 0;
	}
//	�⺻Ű2�� �� ī�����
	public int remove(String user_id, int card_number) throws SQLException {
		String sql = "DELETE FROM Card WHERE userid=?, card_number=?";	// ��AND�����϶� �̰ԾƴѰŰ�����
		jdbcUtil.setSqlAndParameters(sql, new Object[] {user_id, card_number});	// JDBCUtil�� delete���� �Ű� ���� ����

		try {				
			int result = jdbcUtil.executeUpdate();	// delete �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}		
		return 0;
	}
//	��ü ī�������� List�� ��ȯ
	public List<Card> getCardList(){
		
	}
	
//	ȸ���� ī���� �����ֱ�
	public List<Card> findCardList() throws SQLException {
        String sql = "SELECT user_id, card_company, card_number, expiration " 
        		   + "FROM Card "
        		   + "ORDER BY card_number";//�������ڷ� �ϰ������ Date�� �����ؼ� ī���ȣ������..
		jdbcUtil.setSqlAndParameters(sql, null);		
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query ����			
			List<Card> cardList = new ArrayList<Card>();	// User���� ����Ʈ ����
			while (rs.next()) {
				Card card = new Card(			// User ��ü�� �����Ͽ� ���� ���� ������ ����
					rs.getString("user_id"),
					rs.getString("card_company"),
					rs.getString("card_number"),
					rs.getDate("expiration")
					);
				cardList.add(card);				// List�� User ��ü ����
			}		
			return cardList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
	
	public List<Card> findCardListById(String userId) throws SQLException {
        String sql = "SELECT user_id, card_company, card_number, expiration " + 
        			"FROM card " + 
        			"WHERE user_id=? ";
        
		jdbcUtil.setSqlAndParameters(sql, new Object[] { userId });	// JDBCUtil�� delete���� �Ű� ���� ����	
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query ����
			List<Card> cardList = new ArrayList<Card>();	// User���� ����Ʈ ����
			while (rs.next()) {
				Card card = new Card(			// User ��ü�� �����Ͽ� ���� ���� ������ ����
					rs.getString("user_id"),
					rs.getString("card_company"),
					rs.getString("card_number"),
					rs.getDate("expiration"));
				cardList.add(card);				// List�� User ��ü ����
			}		
			return cardList;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
	
}
