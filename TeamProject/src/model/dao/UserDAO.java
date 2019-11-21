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
 * 사용자 관리를 위해 데이터베이스 작업을 전담하는 DAO 클래스
 * USERINFO 테이블에 사용자 정보를 추가, 수정, 삭제, 검색 수행 
 */
public class UserDAO {
	private static final Logger log = LoggerFactory.getLogger(UserDAO.class);
	
	private JDBCUtil jdbcUtil = null;
	
	public UserDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil 객체 생성
	}
		
	/**
	 * 사용자 관리 테이블에 새로운 사용자 생성.
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
			jdbcUtil.close();	// resource 반환
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
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil 에 insert문과 매개 변수 설정
				
		try {				
			int result = jdbcUtil.executeUpdate();	// insert 문 실행
			//return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}	
		
		String sql2 = "INSERT INTO INTEREST (category_name, user_id) "
				+ "VALUES (?, ?)";
		
		for(int i = 0; i < name.length; i++) {
			if(name[i] != null) {
				Object[] param2 = new Object[] {name[i], seq};
				jdbcUtil.setSqlAndParameters(sql2, param2);	// JDBCUtil 에 insert문과 매개 변수 설정
					
				try {				
					int result = jdbcUtil.executeUpdate();	// insert 문 실행
				} catch (Exception ex) {
					jdbcUtil.rollback();
					ex.printStackTrace();
				} finally {		
					jdbcUtil.commit();
					jdbcUtil.close();	// resource 반환
				}
			}
		}

		return 0;			
	} 

	/**
	 * 주어진 사용자 ID에 해당하는 사용자 정보를 데이터베이스에서 찾아 User 도메인 클래스에 
	 * 저장하여 반환.
	 */

	public User findUser(String userId) throws SQLException {
        String sql = "SELECT pwd, name, phone_number, address, email, resid_id "
        			+ "FROM USERS "
        			+ "WHERE id=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						// 학생 정보 발견
				User user = new User(		// User 객체를 생성하여 학생 정보를 저장
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
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}


	public boolean existingUser(String userId) throws SQLException {
		String sql = "SELECT count(*) FROM USERS WHERE id=?";      
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return false;
	}
}
