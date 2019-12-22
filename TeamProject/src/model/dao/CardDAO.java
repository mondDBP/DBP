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
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil 에 insert문과 매개 변수 설정
						
		try {				
			int result = jdbcUtil.executeUpdate();	// insert 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
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
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil에 update문과 매개 변수 설정
			
		try {				
			int result = jdbcUtil.executeUpdate();	// update 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}
//	기본키2개 로 카드삭제
	public int remove(String user_id, int card_number) throws SQLException {
		String sql = "DELETE FROM Card WHERE userid=?, card_number=?";	// ★AND연산일때 이게아닌거같은데
		jdbcUtil.setSqlAndParameters(sql, new Object[] {user_id, card_number});	// JDBCUtil에 delete문과 매개 변수 설정

		try {				
			int result = jdbcUtil.executeUpdate();	// delete 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}
//	전체 카드정보를 List로 반환
	public List<Card> getCardList(){
		
	}
	
//	회원의 카드목록 보여주기
	public List<Card> findCardList() throws SQLException {
        String sql = "SELECT user_id, card_company, card_number, expiration " 
        		   + "FROM Card "
        		   + "ORDER BY card_number";//만료일자로 하고싶은데 Date라 막막해서 카드번호순으로..
		jdbcUtil.setSqlAndParameters(sql, null);		
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
			List<Card> cardList = new ArrayList<Card>();	// User들의 리스트 생성
			while (rs.next()) {
				Card card = new Card(			// User 객체를 생성하여 현재 행의 정보를 저장
					rs.getString("user_id"),
					rs.getString("card_company"),
					rs.getString("card_number"),
					rs.getDate("expiration")
					);
				cardList.add(card);				// List에 User 객체 저장
			}		
			return cardList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
	public List<Card> findCardListById(String userId) throws SQLException {
        String sql = "SELECT user_id, card_company, card_number, expiration " + 
        			"FROM card " + 
        			"WHERE user_id=? ";
        
		jdbcUtil.setSqlAndParameters(sql, new Object[] { userId });	// JDBCUtil에 delete문과 매개 변수 설정	
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행
			List<Card> cardList = new ArrayList<Card>();	// User들의 리스트 생성
			while (rs.next()) {
				Card card = new Card(			// User 객체를 생성하여 현재 행의 정보를 저장
					rs.getString("user_id"),
					rs.getString("card_company"),
					rs.getString("card_number"),
					rs.getDate("expiration"));
				cardList.add(card);				// List에 User 객체 저장
			}		
			return cardList;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
}
