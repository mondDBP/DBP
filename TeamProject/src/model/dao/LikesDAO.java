package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Likes;
import model.Project;

public class LikesDAO {
	private JDBCUtil jdbcUtil = null;

//	������
	public LikesDAO(JDBCUtil jdbcUtil) {
		super();
		this.jdbcUtil = jdbcUtil;
	}

//	���ο� ����
	public int create(Likes likes) throws SQLException {
		String sql = "INSERT INTO LIKES (user_id, project_id) "
				+ "VALUES (?, ?)";
		Object[] param = new Object[] 
				{
				likes.getUser_id(),
				likes.getProject_id() 
				};
		jdbcUtil.setSqlAndParameters(sql, param); // JDBCUtil �� insert���� �Ű� ���� ����

		try {
			int result = jdbcUtil.executeUpdate(); // insert �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); // resource ��ȯ
		}
		return 0;
	}

//	���� - ������Ʈ���̵�� Ű���־ ����
	public int remove(int project_id) throws SQLException {
		String sql = "DELETE FROM LIKES WHERE project_id=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { project_id }); // JDBCUtil�� delete���� �Ű� ���� ����

		try {
			int result = jdbcUtil.executeUpdate(); // delete �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); // resource ��ȯ
		}
		return 0;
	}
	
}
