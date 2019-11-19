package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;
import model.BackOrder;
//
/**
 * 사용자 관리를 위해 데이터베이스 작업을 전담하는 DAO 클래스
 * USERINFO 테이블에 사용자 정보를 추가, 수정, 삭제, 검색 수행 
 */
public class UserDAO_ej {
	private JDBCUtil jdbcUtil = null;
	
	public UserDAO_ej() {			
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
	 * 기존의 사용자 정보를 수정.
	 */
	public int update(User user) throws SQLException {
		String sql = "UPDATE USERINFO "
					+ "SET password=?, name=?, email=?, phone=?, address=? "
					+ "WHERE userid=?";
		Object[] param = new Object[] {user.getPassword(), user.getName(), 
					user.getEmail(), user.getPhone(), 
					user.getAddress(), user.getUserId()};				
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

	/**
	 * 사용자 ID에 해당하는 사용자를 삭제.
	 */
	public int remove(String userId) throws SQLException {
		String sql = "DELETE FROM USERINFO WHERE userid=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	// JDBCUtil에 delete문과 매개 변수 설정

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


	/**
	 * 전체 사용자 정보를 검색하여 List에 저장 및 반환(비밀번호와 주민등록번호는 개인정보상 null로 저장)
	 */
	public List<User> findUserList() throws SQLException {
        String sql = "SELECT userId, name, email, phone, address " 
        		   + "FROM USER "
        		   + "ORDER BY name";
		jdbcUtil.setSqlAndParameters(sql, null);		// JDBCUtil에 query문 설정
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
			List<User> userList = new ArrayList<User>();	// User들의 리스트 생성
			while (rs.next()) {
				User user = new User(			// User 객체를 생성하여 현재 행의 정보를 저장
					rs.getString("userId"),
					null,
					rs.getString("name"),
					rs.getString("email"),
					rs.getString("phone"),
					rs.getString("address"),
					null);
				userList.add(user);				// List에 User 객체 저장
			}		
			return userList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
	/**
	 * 전체 사용자 정보를 검색한 후 현재 페이지와 페이지당 출력할 사용자 수를 이용하여
	 * 해당하는 사용자 정보만을 List에 저장하여 반환.
	 */
	public List<User> findUserList(int currentPage, int countPerPage) throws SQLException {
		String sql = "SELECT userId, name, email, phone, address " 
					+ "FROM USER "
					+ "ORDER BY userId";
		jdbcUtil.setSqlAndParameters(sql, null,					// JDBCUtil에 query문 설정
				ResultSet.TYPE_SCROLL_INSENSITIVE,				// cursor scroll 가능
				ResultSet.CONCUR_READ_ONLY);						
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();				// query 실행			
			int start = ((currentPage-1) * countPerPage) + 1;	// 출력을 시작할 행 번호 계산
			if ((start >= 0) && rs.absolute(start)) {			// 커서를 시작 행으로 이동
				List<User> userList = new ArrayList<User>();	// User들의 리스트 생성
				do {
					User user = new User(			// User 객체를 생성하여 현재 행의 정보를 저장
							rs.getString("userId"),
							null,
							rs.getString("name"),
							rs.getString("email"),
							rs.getString("phone"),
							rs.getString("address"),
							null);
					userList.add(user);							// 리스트에 User 객체 저장
				} while ((rs.next()) && (--countPerPage > 0));		
				return userList;							
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
	
	/**
	 * 주어진 사용자 ID에 해당하는 사용자가 존재하는지 검사 
	 */
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
	
	//userId를 이용하여 해당회원이 후원한 프로젝트목록을 출력하는 메소드
	public List<BackOrder> userBackOrderList(int userId) {
		String sql = "SELECT * " 
     		   + "FROM BACK_ORDER "
     		   + "WHERE user_id = ?"
     		   + "ORDER BY back_date desc";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});		// JDBCUtil에 query문 설정
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
			List<BackOrder> backOrderList = new ArrayList<BackOrder>();	// User들의 리스트 생성
			while (rs.next()) {
				BackOrder backOrder = new BackOrder(			// User 객체를 생성하여 현재 행의 정보를 저장
					rs.getInt("user_id"),
					rs.getInt("project_id"),
					rs.getInt("amount_pledged"),
					rs.getInt("reward_option"),
					rs.getString("back_date"),
					rs.getInt("rest_day"),
					rs.getInt("is_success"),
					rs.getInt("is_paid"));
				backOrderList.add(backOrder);				// List에 User 객체 저장
			}		
			return backOrderList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
//	외래키 from Backorder
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
				dto.setPassword(null); //비밀번호는 전송x
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

}