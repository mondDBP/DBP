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

	public LikesDAO() {
		// TODO Auto-generated constructor stub
		super();		
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
	
	public List<Project> likesList(int user_id) throws SQLException {
		String sql = "SELECT * " 
	     		   + "FROM LIKES "
	     		   + "WHERE user_id = ?";
			jdbcUtil.setSqlAndParameters(sql, new Object[] {user_id});		// JDBCUtil�� query�� ����
						
			try {
				ResultSet rs = jdbcUtil.executeQuery();			// query ����			
				List<Likes> likesList = new ArrayList<Likes>();	// User���� ����Ʈ ����
				while (rs.next()) {
					Likes Likes = new Likes(			// User ��ü�� �����Ͽ� ���� ���� ������ ����
							rs.getInt("user_id_pk_seq"),
							rs.getInt("project_id"));
					likesList.add(Likes);				// List�� User ��ü ����
				}		
				return likesList;					
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				jdbcUtil.close();		// resource ��ȯ
			}
			return null;
	}
	
	public boolean existingProject(int project_id) throws SQLException {
		String sql = "SELECT count(*) FROM Project WHERE project_id=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { project_id }); // JDBCUtil�� query���� �Ű� ���� ����

		try {
			ResultSet rs = jdbcUtil.executeQuery(); // query ����
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close(); // resource ��ȯ
		}
		return false;
	}
}
