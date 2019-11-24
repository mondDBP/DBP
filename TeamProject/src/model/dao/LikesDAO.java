package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Likes;
import model.Project;

public class LikesDAO {
	private JDBCUtil jdbcUtil = null;

//	생성자
	public LikesDAO(JDBCUtil jdbcUtil) {
		super();
		this.jdbcUtil = jdbcUtil;
	}

	public LikesDAO() {
		// TODO Auto-generated constructor stub
		super();		
	}

	//	새로운 생성
	public int create(Likes likes) throws SQLException {
		String sql = "INSERT INTO LIKES (user_id, project_id) "
				+ "VALUES (?, ?)";
		Object[] param = new Object[] 
				{
				likes.getUser_id(),
				likes.getProject_id() 
				};
		jdbcUtil.setSqlAndParameters(sql, param); // JDBCUtil 에 insert문과 매개 변수 설정

		try {
			int result = jdbcUtil.executeUpdate(); // insert 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); // resource 반환
		}
		return 0;
	}

//	삭제 - 프로젝트아이디로 키를넣어서 삭제
	public int remove(int project_id) throws SQLException {
		String sql = "DELETE FROM LIKES WHERE project_id=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { project_id }); // JDBCUtil에 delete문과 매개 변수 설정

		try {
			int result = jdbcUtil.executeUpdate(); // delete 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); // resource 반환
		}
		return 0;
	}
	
	public List<Project> likesList(int user_id) throws SQLException {
		String sql = "SELECT * " 
	     		   + "FROM LIKES "
	     		   + "WHERE user_id = ?";
			jdbcUtil.setSqlAndParameters(sql, new Object[] {user_id});		// JDBCUtil에 query문 설정
						
			try {
				ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
				List<Likes> likesList = new ArrayList<Likes>();	// User들의 리스트 생성
				while (rs.next()) {
					Likes Likes = new Likes(			// User 객체를 생성하여 현재 행의 정보를 저장
							rs.getInt("user_id_pk_seq"),
							rs.getInt("project_id"));
					likesList.add(Likes);				// List에 User 객체 저장
				}		
				return likesList;					
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				jdbcUtil.close();		// resource 반환
			}
			return null;
	}
	
	public boolean existingProject(int project_id) throws SQLException {
		String sql = "SELECT count(*) FROM Project WHERE project_id=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { project_id }); // JDBCUtil에 query문과 매개 변수 설정

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
