package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.Admin;

public class AdminDAO {
	private static final Logger log = LoggerFactory.getLogger(AdminDAO.class);
	
	private JDBCUtil jdbcUtil = null;
	
	public AdminDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil 객체 생성
	}
	
	public Admin findAdmin(String userId) throws SQLException {
        String sql = "SELECT admin_pw "
        			+ "FROM admin "
        			+ "WHERE admin_id=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						// 학생 정보 발견
				Admin a = new Admin(		// User 객체를 생성하여 학생 정보를 저장
					userId,
					rs.getString("admin_pw"));
				return a;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}

}
