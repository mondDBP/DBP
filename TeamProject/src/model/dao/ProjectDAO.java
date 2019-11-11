package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Project;
import model.User;

/**
 * 사용자 관리를 위해 데이터베이스 작업을 전담하는 DAO 클래스
 * Community 테이블에서 커뮤니티 정보를 추가, 수정, 삭제, 검색 수행 
 */
public class ProjectDAO {
	private JDBCUtil jdbcUtil = null;
	
	public ProjectDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil 객체 생성
	}
	
	public int getSequence() throws SQLException{
		int result = 1;
		String sql = "SELECT project_id_seq.nextval FROM DUAL";
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
	
	public Project findProject(int project_id) throws SQLException {
        String sql = "SELECT * "
        			+ "FROM PROJECT "
        			+ "WHERE project_id=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {project_id});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						// 학생 정보 발견
				Project proj = new Project(			
						rs.getInt("project_id"),
						rs.getString("category_name"),
						rs.getString("user_id"),
						rs.getString("title"),
						rs.getString("start_date"),
						rs.getString("image"),
						rs.getString("description"),
						rs.getInt("goal"),
						rs.getInt("fund_rate"),
						rs.getInt("rest_day"),
						rs.getInt("funding_period"),
						rs.getInt("total_money"),
						rs.getInt("is_success"));
					return proj;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
		
	public List<Project> projectListOrderByCondition(String condition) throws SQLException {
        String sql;
        
        if (condition.equals("start_date")) {
        	sql = "SELECT * FROM Project ORDER BY start_date";   
        } else if (condition.equals("fund_rate")) {
        	sql = "SELECT * FROM Project ORDER BY fund_rate desc";  
        } else if (condition.equals("likes")) {
        	sql = "SELECT project_id, count(user_id) as cnt_likes "
        			+ "FROM Project p JOIN Likes l On p.project_id = l.project.id "
        			+ "GROUP BY project_id ORDER BY cnt_likes desc";  
        }     				                      
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			List<Project> projList = new ArrayList<Project>();	// project들의 리스트 생성
			while (rs.next()) {
				Project proj = new Project(			
					rs.getInt("project_id"),
					rs.getString("category_name"),
					rs.getString("user_id"),
					rs.getString("title"),
					rs.getString("start_date"),
					rs.getString("image"),
					rs.getString("description"),
					rs.getInt("goal"),
					rs.getInt("fund_rate"),
					rs.getInt("rest_day"),
					rs.getInt("funding_period"),
					rs.getInt("total_money"),
					rs.getInt("is_success"));
				projList.add(proj);			// List에 project 객체 저장
			}		
			return projList;					
				
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
//	public List<Project> projectListOrderByFundRate() throws SQLException {
//        String sql = "SELECT * FROM Project "
//     				+ "ORDER BY fund_rate desc";                         
//		
//		try {
//			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
//			List<Project> projList = new ArrayList<Project>();	// project들의 리스트 생성
//			while (rs.next()) {
//				Project proj = new Project(			
//					rs.getInt("project_id"),
//					rs.getString("category_name"),
//					rs.getString("user_id"),
//					rs.getString("title"),
//					rs.getString("start_date"),
//					rs.getString("image"),
//					rs.getString("description"),
//					rs.getInt("goal"),
//					rs.getInt("fund_rate"),
//					rs.getInt("rest_day"),
//					rs.getInt("funding_period"),
//					rs.getInt("total_money"),
//					rs.getInt("is_success"));
//				projList.add(proj);			// List에 project 객체 저장
//			}		
//			return projList;					
//				
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		} finally {
//			jdbcUtil.close();		// resource 반환
//		}
//		return null;
//	}
//	
//	public List<Project> projectListOrderByLatest() throws SQLException {
//        String sql = "SELECT * FROM Project "
//     				+ "ORDER BY start_date";                         
//		
//		try {
//			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
//			List<Project> projList = new ArrayList<Project>();	// project들의 리스트 생성
//			while (rs.next()) {
//				Project proj = new Project(			
//					rs.getInt("project_id"),
//					rs.getString("category_name"),
//					rs.getString("user_id"),
//					rs.getString("title"),
//					rs.getString("start_date"),
//					rs.getString("image"),
//					rs.getString("description"),
//					rs.getInt("goal"),
//					rs.getInt("fund_rate"),
//					rs.getInt("rest_day"),
//					rs.getInt("funding_period"),
//					rs.getInt("total_money"),
//					rs.getInt("is_success"));
//				projList.add(proj);			// List에 project 객체 저장
//			}		
//			return projList;					
//				
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		} finally {
//			jdbcUtil.close();		// resource 반환
//		}
//		return null;
//	}

	public Project create(Project proj) {
		// TODO Auto-generated method stub
		return null;
	}

	public int update(Project proj) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<User> findUsersOnProject(int project_id) {
		// TODO Auto-generated method stub
		return null;
	}
}
