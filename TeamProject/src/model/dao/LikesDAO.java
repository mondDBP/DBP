package model.dao;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.Likes;
import model.Project;
import model.User;

public class LikesDAO {
	private JDBCUtil jdbcUtil = null;

//	������
	public LikesDAO() {
		jdbcUtil = new JDBCUtil();
	}

	public int create(Likes likes) throws SQLException{
		String sql = "INSERT INTO LIKES (user_id, project_id) "
				+ "VALUES (?, ?)";
		
		Object[] param = new Object[] 
				{
				likes.getUser_id_pk_seq(),
				likes.getProject_id_seq()
				};
		
		jdbcUtil.setSqlAndParameters(sql, param);
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


	
	public List<Likes> findLikesList(int user_id) throws SQLException {
		String sql = "SELECT * " 
	     		   + "FROM LIKES "
	     		   + "WHERE user_id = ?";
			jdbcUtil.setSqlAndParameters(sql, new Object[] {user_id});		// JDBCUtil�� query�� ����
						
			try {
				ResultSet rs = jdbcUtil.executeQuery();			// query ����			
				List<Likes> likesList = new ArrayList<Likes>();	// User���� ����Ʈ ����
				while (rs.next()) {
					Likes lk = new Likes(			// User ��ü�� �����Ͽ� ���� ���� ������ ����
							rs.getInt("user_id"),
							rs.getInt("project_id"));
					likesList.add(lk);				// List�� User ��ü ����
				}		
				return likesList;					
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				jdbcUtil.close();		// resource ��ȯ
			}
			return null;
	}

	public boolean existingLikes(Likes likes) throws SQLException {//likes ��ü�� �����ϴ��� ���ϴ��� ã�ƾ���
		String sql = "SELECT count(*) FROM LIKES WHERE user_id=? AND project_id=?";
		
		Object[] param = new Object[] 
				{
				likes.getUser_id_pk_seq(),
				likes.getProject_id_seq()
				};
		
		jdbcUtil.setSqlAndParameters(sql, param); // JDBCUtil�� query���� �Ű� ���� ����

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
