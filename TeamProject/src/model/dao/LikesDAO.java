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

//	생성자
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


	
	public List<Likes> findLikesList(int user_id) throws SQLException {
		String sql = "SELECT * " 
	     		   + "FROM LIKES "
	     		   + "WHERE user_id = ?";
			jdbcUtil.setSqlAndParameters(sql, new Object[] {user_id});		// JDBCUtil에 query문 설정
						
			try {
				ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
				List<Likes> likesList = new ArrayList<Likes>();	// User들의 리스트 생성
				while (rs.next()) {
					Likes lk = new Likes(			// User 객체를 생성하여 현재 행의 정보를 저장
							rs.getInt("user_id"),
							rs.getInt("project_id"));
					likesList.add(lk);				// List에 User 객체 저장
				}		
				return likesList;					
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				jdbcUtil.close();		// resource 반환
			}
			return null;
	}

	public boolean existingLikes(Likes likes) throws SQLException {//likes 객체가 존재하는지 안하는지 찾아야함
		String sql = "SELECT count(*) FROM LIKES WHERE user_id=? AND project_id=?";
		
		Object[] param = new Object[] 
				{
				likes.getUser_id_pk_seq(),
				likes.getProject_id_seq()
				};
		
		jdbcUtil.setSqlAndParameters(sql, param); // JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery(); // query 실행
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close(); // resource 반환
		}
		return false;
	}
}
