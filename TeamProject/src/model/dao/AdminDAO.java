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
		jdbcUtil = new JDBCUtil();	// JDBCUtil ��ü ����
	}
	
	public Admin findAdmin(String userId) throws SQLException {
        String sql = "SELECT admin_pw "
        			+ "FROM admin "
        			+ "WHERE admin_id=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	// JDBCUtil�� query���� �Ű� ���� ����

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query ����
			if (rs.next()) {						// �л� ���� �߰�
				Admin a = new Admin(		// User ��ü�� �����Ͽ� �л� ������ ����
					userId,
					rs.getString("admin_pw"));
				return a;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}

}
