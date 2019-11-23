package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.Project;

public class ProjectDAO {
	
	private static final Logger log = LoggerFactory.getLogger(UserDAO.class);
	
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
		String sql = "INSERT INTO Project (PROJECT_ID, USER_ID, TITLE, START_DATE , IMAGE, "
				+ "DESCRIPTION, GOAL, FUND_RATE, REST_DAY, FUNDING_PERIOD, TOTAL_MONEY, CATEGORY_NAME) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); ";
		Object[] param = new Object[] { 
					p.getProject_id(),
					p.getUser_id_pk_seq(),
					p.getTitle(),
					p.getStart_date(),
					p.getImage(),
					p.getDescription(),
					p.getGoal(),
					p.getFund_rate(),
					p.getRest_day(),
					p.getFunding_period(),
					p.getTotal_money(),
					p.getCategory_name()
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

//	프로젝트 수정
	public int updateProject(Project p) throws SQLException {
		String sql = "UPDATE Project " + "SET PROJECT_ID=?, USER_ID=?, TITLE=?, START_DATE=?, IMAGE=?, "
				+ "DESCRIPTION=?, GOAL=?, FUND_RATE=?, REST_DAY=?, FUNDING_PERIOD=?, TOTAL_MONEY=?, CATEGORY_NAME=? "
				+ "WHERE project_id=? ; ";
		Object[] param = new Object[] {
				p.getProject_id(),
				p.getUser_id_pk_seq(),
				p.getTitle(),
				p.getStart_date(),
				p.getImage(),
				p.getDescription(),
				p.getGoal(),
				p.getFund_rate(),
				p.getRest_day(),
				p.getFunding_period(),
				p.getTotal_money(),
				p.getCategory_name()
		};
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
		String sql = "DELETE FROM Project WHERE project_id=? ; ";
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
		String sql = "SELECT count(*) FROM Project WHERE project_id=? ; ";
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
	
//	findUsersOnProject 
//	public List<User> findUsersOnProject(int project_id) {
//		String sql = "SELECT userid"
//				+ "FROM PROJECT "
//				+ "WHERE project_id=? ; ";
//		jdbcUtil.setSqlAndParameters(sql, new Object[] {project_id});
//		try {
//			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
//			if (rs.next()) {						
////				Project proj = s.getString("user_id"),
////				
//			}
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		} finally {
//			jdbcUtil.close();		// resource 반환
//		}
//		return null;
//	}
	
//	기본정보 포함하는 query문
	static String query = "SELECT PROJECT_ID, USER_ID, TITLE, START_DATE, IMAGE, " +
			"       DESCRIPTION, GOAL, FUND_RATE, REST_DAY, FUNDING_PERIOD, " +
			"       TOTAL_MONEY, CATEGORY_NAME " +
			"FROM Project ";
//	이름(title)으로 프로젝트 검색 (like연산자) 1개반환
	public Project findProject_returnOne(String title) throws SQLException {

		String SearchQuery = query + "WHERE TITLE LIKE ? ";

		String Like_w_title = "%" + title + "%";
		jdbcUtil.setSqlAndParameters(SearchQuery, new Object[] {Like_w_title});

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						
				Project pj = new Project(		
					rs.getInt("PROJECT_ID"),
					rs.getInt("USER_ID"),
					title,
					rs.getDate("START_DATE"),
					rs.getString("IMAGE"),
					rs.getString("DESCRIPTION"),
					rs.getInt("GOAL"),
					rs.getInt("FUND_RATE"),
					rs.getInt("REST_DAY"),
					rs.getInt("FUNDING_PERIOD"),
					rs.getInt("TOTAL_MONEY"),
					rs.getString("CATEGORY_NAME")
					);
				return pj;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
//	이름(title)으로 프로젝트 검색 (like연산자) 여러개 반환
	public List<Project> findProjectList_ByTitle(String title) throws SQLException {
        
		String findSql = "SELECT * " + "FROM PROJECT " + "WHERE TITLE LIKE ? ";
		
		String Like_w_title = "%" + title + "%";
		jdbcUtil.setSqlAndParameters(findSql, new Object[] {Like_w_title});	// JDBCUtil에 query문과 매개 변수 설정
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			List<Project> projList = new ArrayList<Project>();	//리스트 생성
			while (rs.next()) {
				Project pj = new Project(			// 객체를 생성하여 현재 행의 정보를 저장
						rs.getInt("PROJECT_ID"),
						rs.getInt("USER_ID"),
						title,
						rs.getDate("START_DATE"),
						rs.getString("IMAGE"),
						rs.getString("DESCRIPTION"),
						rs.getInt("GOAL"),
						rs.getInt("FUND_RATE"),
						rs.getInt("REST_DAY"),
						rs.getInt("FUNDING_PERIOD"),
						rs.getInt("TOTAL_MONEY"),
						rs.getString("CATEGORY_NAME")
						);
				projList.add(pj);			// List에 생성된 객체 저장
			}		
			return projList;					
				
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
						rs.getInt("PROJECT_ID"),
						rs.getInt("USER_ID"),
						rs.getString("TITLE"),
						rs.getDate("START_DATE"), //rs.getDate(columnLabel)로 선택
						rs.getString("IMAGE"),
						rs.getString("DESCRIPTION"),
						rs.getInt("GOAL"),
						rs.getInt("FUND_RATE"),
						rs.getInt("REST_DAY"),
						rs.getInt("FUNDING_PERIOD"),
						rs.getInt("TOTAL_MONEY"),
						rs.getString("CATEGORY_NAME"));
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
						rs.getInt("PROJECT_ID"),
						rs.getInt("USER_ID"),
						rs.getString("TITLE"),
						rs.getDate("START_DATE"), //rs.getDate(columnLabel)로 선택
						rs.getString("IMAGE"),
						rs.getString("DESCRIPTION"),
						rs.getInt("GOAL"),
						rs.getInt("FUND_RATE"),
						rs.getInt("REST_DAY"),
						rs.getInt("FUNDING_PERIOD"),
						rs.getInt("TOTAL_MONEY"),
						rs.getString("CATEGORY_NAME"));
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
						rs.getInt("PROJECT_ID"),
						rs.getInt("USER_ID"),
						rs.getString("TITLE"),
						rs.getDate("START_DATE"), //rs.getDate(columnLabel)로 선택
						rs.getString("IMAGE"),
						rs.getString("DESCRIPTION"),
						rs.getInt("GOAL"),
						rs.getInt("FUND_RATE"),
						rs.getInt("REST_DAY"),
						rs.getInt("FUNDING_PERIOD"),
						rs.getInt("TOTAL_MONEY"),
						rs.getString("CATEGORY_NAME"));
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
	
	//마이페이지에서 '내가 창작한 프로젝트' 들어가면 나오는 리스트를 위한 메소드
	public List<Project> userCreateProjectList(int userId) {
		String sql = "SELECT * " 
     		   + "FROM PROJECT "
     		   + "WHERE user_id = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});		// JDBCUtil에 query문 설정
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
			List<Project> projectList = new ArrayList<Project>();	// User들의 리스트 생성
			while (rs.next()) {
				Project project = new Project(			//객체를 생성하여 현재 행의 정보를 저장
						rs.getInt("PROJECT_ID"),
						rs.getInt("USER_ID"),
						rs.getString("TITLE"),
						rs.getDate("START_DATE"), //rs.getDate(columnLabel)로 선택
						rs.getString("IMAGE"),
						rs.getString("DESCRIPTION"),
						rs.getInt("GOAL"),
						rs.getInt("FUND_RATE"),
						rs.getInt("REST_DAY"),
						rs.getInt("FUNDING_PERIOD"),
						rs.getInt("TOTAL_MONEY"),
						rs.getString("CATEGORY_NAME")
						);
				projectList.add(project);				// List에 저장
			}
			return projectList;					
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
//	FK(외래키)로  검색하여 객체1개 가져감
	public Project getProjectById(int PK_ID) {
		String searchQuery = query + "WHERE project_id = ?";
		
//		Object[] param = new Object[] { PK_ID }; 매개변수 1개라서 괜찮다
		jdbcUtil.setSqlAndParameters(searchQuery, new Object[] { PK_ID });

		try {
			ResultSet rs = jdbcUtil.executeQuery();
			Project proj = null; //= new Project();
			while (rs.next()) 
			{
				proj = new Project();
				proj.setProject_id(PK_ID);
				proj.setUser_id_pk_seq(rs.getInt("USER_ID"));
				proj.setTitle(rs.getString("TITLE"));
				proj.setStart_date(rs.getDate("START_DATE"));
				proj.setImage(rs.getString("IMAGE"));
				proj.setDescription(rs.getString("DESCRIPTION"));
				proj.setGoal(rs.getInt("GOAL"));
				proj.setFund_rate(rs.getInt("FUND_RATE"));
				proj.setRest_day(rs.getInt("REST_DAY"));
				proj.setFunding_period(rs.getInt("FUNDING_PERIOD"));
				proj.setTotal_money(rs.getInt("TOTAL_MONEY"));
				proj.setCategory_name(rs.getString("CATEGORY_NAME"));
			}
			return proj;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		return null;
	}
}
