package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Project;
import model.User;

public class ProjectDAO {
	private JDBCUtil jdbcUtil = null;

//	생성자
	public ProjectDAO() {
		jdbcUtil = new JDBCUtil(); // JDBCUtil 객체 생성
	}

//	시퀸스 생성
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

//	새로운 프로젝트 생성
	public int create(Project p) throws SQLException {
		String sql = "INSERT INTO Project (title, start_date, image, description , goal,"
				+ " fund_rate, rest_day, funding_period, total_money, is_success, ) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] param = new Object[] { p.getTitle(), p.getStart_date(), p.getImage(), p.getDescription(), p.getGoal(),
				+p.getFund_rate(), p.getRest_day(), p.getFunding_period(), p.getTotal_money(), p.getIs_success(),
				p.getCategory_name() };
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

//	프로젝트 수정
	public int update(Project p) throws SQLException {
		String sql = "UPDATE Project " + "SET title=?, start_date=?, image=?, description=?, goal=?,"
				+ "fund_rate=?, rest_day=?, funding_period=?, total_money=?, is_success=?, category_name=? "
				+ "WHERE project_id=?";
		Object[] param = new Object[] { p.getTitle(), p.getStart_date(), p.getImage(), p.getDescription(), p.getGoal(),
				+p.getFund_rate(), p.getRest_day(), p.getFunding_period(), p.getTotal_money(), p.getIs_success(),
				p.getCategory_name() + p.getProject_id() };
		jdbcUtil.setSqlAndParameters(sql, param); // JDBCUtil에 update문과 매개 변수 설정

		try {
			int result = jdbcUtil.executeUpdate(); // update 문 실행
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

//	프로젝트 삭제
	public int remove(int project_id) throws SQLException {
		String sql = "DELETE FROM Project WHERE project_id=?";
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

// 프로젝트ID에 해당하는 프로젝트가 존재하는지 검사
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
	
//	findUsersOnProject 미정
	public List<User> findUsersOnProject(int project_id) {
		String sql = "SELECT userid"
				+ "FROM PROJECT "
				+ "WHERE project_id=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {project_id});
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						
//				Project proj = s.getString("user_id"),
//				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
//	검색 
	public Project findProject(int project_id) throws SQLException {
        String sql = "SELECT * "
        			+ "FROM PROJECT "
        			+ "WHERE project_id=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {project_id});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						
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
//	정렬조건
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
//	펀딩률기준 정렬
	public List<Project> projectListOrderByFundRate() throws SQLException {
      String sql = "SELECT * FROM Project "
   				+ "ORDER BY fund_rate desc";                         
		
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
//	최신순 정렬
	public List<Project> projectListOrderByLatest() throws SQLException {
      String sql = "SELECT * FROM Project "
   				+ "ORDER BY start_date";                         
		
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
}
