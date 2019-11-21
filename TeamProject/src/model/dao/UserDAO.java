package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.user.RegisterUserController;
import model.User;

/**
 * ����� ������ ���� �����ͺ��̽� �۾��� �����ϴ� DAO Ŭ����
 * USERINFO ���̺� ����� ������ �߰�, ����, ����, �˻� ���� 
 */
public class UserDAO {
	private static final Logger log = LoggerFactory.getLogger(UserDAO.class);
	
	private JDBCUtil jdbcUtil = null;
	
	public UserDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil ��ü ����
	}
		
	/**
	 * ����� ���� ���̺� ���ο� ����� ����.
	 */
	public List<BackOrder> userBackOrderList(int userId) {
		String sql = "SELECT * " 
     		   + "FROM BACK_ORDER "
     		   + "WHERE user_id = ?"
     		   + "ORDER BY back_date desc";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});		// JDBCUtil�� query�� ����
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query ����			
			List<BackOrder> backOrderList = new ArrayList<BackOrder>();	// User���� ����Ʈ ����
			while (rs.next()) {
				BackOrder backOrder = new BackOrder(			// User ��ü�� �����Ͽ� ���� ���� ������ ����
					rs.getInt("user_id"),
					rs.getInt("project_id"),
					rs.getInt("amount_pledged"),
					rs.getInt("reward_option"),
					rs.getString("back_date"),
					rs.getInt("rest_day"),
					rs.getInt("is_success"),
					rs.getInt("is_paid"));
				backOrderList.add(backOrder);				// List�� User ��ü ����
			}		
			return backOrderList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
//	�ܷ�Ű from Backorder
	public User getUserById(int PK_ID) {
		String query = "SELECT user_id_pk_seq, userId, password, name, phone, " +
					"       address, email, email2, resid_id, resid_id2" +
					"FROM USER ";
		
		String searchQuery = query + "WHERE user_id_pk_seq = ?";
		Object[] param = new Object[] {PK_ID};
		
		jdbcUtil.setSqlAndParameters(searchQuery, new Object[] {param});
//		jdbcUtil.setSql(searchQuery);
//		jdbcUtil.setParameters(param);
	
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			User dto = new User();
			while (rs.next()) {
				dto.setUser_id_pk_seq(rs.getInt("user_id_pk_seq"));
				dto.setUserId(rs.getString("userId"));
				dto.setPassword(null); //��й�ȣ�� ����x
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setEmail(rs.getString("email"));
				dto.setEmail(rs.getString("email2"));
				dto.setResid_id(rs.getString("resid_id"));
				dto.setResid_id2(rs.getString("resid_id2"));	
			}
			return dto;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		return null;
	}

	public int getSequence() throws SQLException{
		int result = 1;
		String sql = "SELECT user_id_seq.nextval FROM DUAL";
		jdbcUtil.setSqlAndParameters(sql, null);
		try {				
			ResultSet rs = jdbcUtil.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
			//return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}		
		return result;
		
	}
	
	public int create(User user, String[] name) throws SQLException {
		for(int i = 0; i < name.length; i++) 
		{
			if(name[i] != null)
				log.debug(name[i] + "    ");
		
		}	
		String sql = "INSERT INTO USERS (user_id, id, pwd, name, phone_number, address, email, resid_id) "
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";		
		int seq = getSequence();
		
		Object[] param = new Object[] {seq, user.getUserId(), user.getPassword(), 
		user.getName(), user.getPhone(), user.getAddress(), user.getEmail() + "@" +user.getEmail2(), user.getResid_id() + user.getResid_id2()};				
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil �� insert���� �Ű� ���� ����
				
		try {				
			int result = jdbcUtil.executeUpdate();	// insert �� ����
			//return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}	
		
		String sql2 = "INSERT INTO INTEREST (category_name, user_id) "
				+ "VALUES (?, ?)";
		
		for(int i = 0; i < name.length; i++) {
			if(name[i] != null) {
				Object[] param2 = new Object[] {name[i], seq};
				jdbcUtil.setSqlAndParameters(sql2, param2);	// JDBCUtil �� insert���� �Ű� ���� ����
					
				try {				
					int result = jdbcUtil.executeUpdate();	// insert �� ����
				} catch (Exception ex) {
					jdbcUtil.rollback();
					ex.printStackTrace();
				} finally {		
					jdbcUtil.commit();
					jdbcUtil.close();	// resource ��ȯ
				}
			}
		}

		return 0;			
	} 

	/**
	 * �־��� ����� ID�� �ش��ϴ� ����� ������ �����ͺ��̽����� ã�� User ������ Ŭ������ 
	 * �����Ͽ� ��ȯ.
	 */

	public User findUser(String userId) throws SQLException {
        String sql = "SELECT pwd, name, phone_number, address, email, resid_id "
        			+ "FROM USERS "
        			+ "WHERE id=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	// JDBCUtil�� query���� �Ű� ���� ����

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query ����
			if (rs.next()) {						// �л� ���� �߰�
				User user = new User(		// User ��ü�� �����Ͽ� �л� ������ ����
					userId,
					rs.getString("pwd"),
					rs.getString("name"),
					rs.getString("phone_number"),
					rs.getString("address"),
					rs.getString("email"),
					rs.getString("resid_id"));
				return user;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}


	public boolean existingUser(String userId) throws SQLException {
		String sql = "SELECT count(*) FROM USERS WHERE id=?";      
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	// JDBCUtil�� query���� �Ű� ���� ����

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query ����
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return false;
	}
}
