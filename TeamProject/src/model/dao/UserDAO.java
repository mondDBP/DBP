package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 * ����� ������ ���� �����ͺ��̽� �۾��� �����ϴ� DAO Ŭ����
 * USERINFO ���̺� ����� ������ �߰�, ����, ����, �˻� ���� 
 */
public class UserDAO {
	private JDBCUtil jdbcUtil = null;
	
	public UserDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil ��ü ����
	}
		
	/**
	 * ����� ���� ���̺� ���ο� ����� ����.
	 */

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
	
	public int create(User user) throws SQLException {
		String sql = "INSERT INTO USERS2 (user_id, id, pwd, name, phone_number, address, email, resid_id) "
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";		
		int seq = getSequence();
		
		Object[] param = new Object[] {seq, user.getUserId(), user.getPassword(), 
		user.getName(), user.getPhone(), user.getAddress(), user.getTotalEmail(), user.getTotalResid_id()};				
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


	/**
	 * �־��� ����� ID�� �ش��ϴ� ����� ������ �����ͺ��̽����� ã�� User ������ Ŭ������ 
	 * �����Ͽ� ��ȯ.
	 */

	public User findUser(String userId) throws SQLException {
        String sql = "SELECT pwd, name, phone_number, address, email, resid_id "
        			+ "FROM USERS2 "
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
		String sql = "SELECT count(*) FROM USERS2 WHERE id=?";      
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
