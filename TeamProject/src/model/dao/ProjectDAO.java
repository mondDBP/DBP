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
import model.User;

public class ProjectDAO {
	
	private static final Logger log = LoggerFactory.getLogger(UserDAO.class);
	
	private JDBCUtil jdbcUtil = null;

	public ProjectDAO() {
		jdbcUtil = new JDBCUtil(); 
	}

	public int getSequence() throws SQLException{
		int result = 1;
		String sql = "SELECT project_id_seq.nextval FROM DUAL";
		jdbcUtil.setSqlAndParameters(sql, null);
		try {				
			ResultSet rs = jdbcUtil.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	
		}		
		return result;
	}

	public int create(Project p) throws SQLException {
		String sql = "INSERT INTO Project (PROJECT_ID, USER_ID, TITLE, START_DATE , IMAGE, "
				+ "DESCRIPTION, GOAL, FUND_RATE, REST_DAY, FUNDING_PERIOD, TOTAL_MONEY, CATEGORY_NAME) "
				+ "VALUES (PROJECT_ID_SEQ.nextval, ?, ?, TO_DATE(sysdate), ?, ?, ?, ?, ?, ?, ?, ?); ";
		Object[] param = new Object[] { 
					p.getUser_id_pk_seq(),
					p.getTitle(),
					p.getImage(),
					p.getDescription(),
					p.getGoal(),
					p.getFund_rate(),
					p.getRest_day(),
					p.getFunding_period(),
					p.getTotal_money(),
					p.getCategory_name()
		};
		jdbcUtil.setSqlAndParameters(sql, param);

		try {
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		return 0;
	}
//
	public int findProjectId(String title) throws SQLException{
		String sql = "SELECT project_id from project where title LIKE ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {"%" + title + "%"});	

		int rslt = 0;
		try {
			ResultSet rs = jdbcUtil.executeQuery();			
			if (rs.next()) {
				rslt = rs.getInt("project_id");
			}		
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return rslt;
	}

	public Project findProject(String title) throws SQLException{
		 String sql = "SELECT project_id, title, start_date, description, image, goal, fund_rate, rest_day, total_money, category_name "
     			+ "FROM PROJECT "
     			+ "WHERE title LIKE ?";              
		 
		jdbcUtil.setSqlAndParameters(sql, new Object[] {"%" + title + "%"});	

		try {
			ResultSet rs = jdbcUtil.executeQuery();	
			if (rs.next()) {						
				Project project = new Project(		
					rs.getInt("project_id"),
					rs.getString("title"),
					rs.getDate("start_date"),
					rs.getString("description"),
					rs.getString("image"),//?
					rs.getInt("goal"),
					rs.getInt("fund_rate"),
					rs.getInt("rest_day"),
					rs.getInt("total_money"),
					rs.getString("category_name"));
				return project;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}

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
		jdbcUtil.setSqlAndParameters(sql, param);

		try {
			int result = jdbcUtil.executeUpdate(); 
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		return 0;
	}


	public int remove(int project_id) throws SQLException {
		String sql = "DELETE FROM project WHERE project_id=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { project_id });

		try {
			int result = jdbcUtil.executeUpdate(); 
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); 
		}
		return 0;
	}


	public boolean existingProject(int project_id) throws SQLException {
		String sql = "SELECT count(*) FROM Project WHERE project_id=? ; ";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { project_id });

		try {
			ResultSet rs = jdbcUtil.executeQuery(); 
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close(); 
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
//			ResultSet rs = jdbcUtil.executeQuery();	
//			if (rs.next()) {						
////				Project proj = s.getString("user_id"),
////				
//			}
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		} finally {
//			jdbcUtil.close();	
//		}
//		return null;
//	}

	static String query = "SELECT PROJECT_ID, USER_ID, TITLE, START_DATE, IMAGE, " +
			"       DESCRIPTION, GOAL, FUND_RATE, REST_DAY, FUNDING_PERIOD, " +
			"       TOTAL_MONEY, CATEGORY_NAME " +
			"FROM Project ";

	public Project findProject_returnOne(String title) throws SQLException {

		String SearchQuery = query + "WHERE TITLE LIKE ? ";

		String Like_w_title = "%" + title + "%";
		jdbcUtil.setSqlAndParameters(SearchQuery, new Object[] {Like_w_title});

		try {
			ResultSet rs = jdbcUtil.executeQuery();	
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
			jdbcUtil.close();		
		}
		return null;
	}
	
	
	public List<Project> findProList() throws SQLException{
		   String sql = "SELECT PROJECT_ID, TITLE, START_DATE, DESCRIPTION, IMAGE, GOAL, FUND_RATE, REST_DAY, TOTAL_MONEY, CATEGORY_NAME " 
        		   + "FROM PROJECT "
        		   + "ORDER BY PROJECT_ID";
		jdbcUtil.setSqlAndParameters(sql, null);	
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			
			List<Project> proList = new ArrayList<Project>();	
			while (rs.next()) {
				Project project = new Project(
						rs.getInt("PROJECT_ID"),
						rs.getString("TITLE"),
						rs.getDate("START_DATE"),
						rs.getString("DESCRIPTION"),
						rs.getString("IMAGE"),
						rs.getInt("GOAL"),
						rs.getInt("FUND_RATE"),
						rs.getInt("REST_DAY"),
						rs.getInt("TOTAL_MONEY"),
						rs.getString("CATEGORY_NAME")	
				);
				proList.add(project);				
			}		
			return proList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}
	

	public List<Project> findProjectList_ByTitle(String title) throws SQLException {
        
		String findSql = "SELECT * " + "FROM PROJECT " + "WHERE TITLE LIKE ? ";
		
		String Like_w_title = "%" + title + "%";
		jdbcUtil.setSqlAndParameters(findSql, new Object[] {Like_w_title});	
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();		
			List<Project> projList = new ArrayList<Project>();	
			while (rs.next()) {
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
				projList.add(pj);		
			}		
			return projList;					
				
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}

	public List<Project> projectListOrderByCondition(String condition) throws SQLException {
		String sql = "";

		if (condition.equals("start_date")) {
			sql = "SELECT * FROM Project ORDER BY start_date";
		} else if (condition.equals("fund_rate")) {
			sql = "SELECT * FROM Project ORDER BY fund_rate desc";
		} else if (condition.equals("likes")) {
			sql = "SELECT project_id, count(user_id) as cnt_likes "
					+ "FROM Project p JOIN Likes l On p.project_id = l.project.id "
					+ "GROUP BY project_id ORDER BY cnt_likes desc";
		}

		jdbcUtil.setSqlAndParameters(sql, null);	
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();		
			List<Project> projList = new ArrayList<Project>();	
			while (rs.next()) {
				Project proj = new Project(			
						rs.getInt("PROJECT_ID"),
						rs.getInt("USER_ID"),
						rs.getString("TITLE"),
						rs.getDate("START_DATE"),
						rs.getString("IMAGE"),
						rs.getString("DESCRIPTION"),
						rs.getInt("GOAL"),
						rs.getInt("FUND_RATE"),
						rs.getInt("REST_DAY"),
						rs.getInt("FUNDING_PERIOD"),
						rs.getInt("TOTAL_MONEY"),
						rs.getString("CATEGORY_NAME"));
				projList.add(proj);			
			}		
			return projList;					
				
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}

	public List<Project> projectListOrderByFundRate() throws SQLException {
      String sql = "SELECT * FROM Project "
   				+ "ORDER BY fund_rate desc";                         
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();		
			List<Project> projList = new ArrayList<Project>();	
			while (rs.next()) {
				Project proj = new Project(			
						rs.getInt("PROJECT_ID"),
						rs.getInt("USER_ID"),
						rs.getString("TITLE"),
						rs.getDate("START_DATE"), 
						rs.getString("IMAGE"),
						rs.getString("DESCRIPTION"),
						rs.getInt("GOAL"),
						rs.getInt("FUND_RATE"),
						rs.getInt("REST_DAY"),
						rs.getInt("FUNDING_PERIOD"),
						rs.getInt("TOTAL_MONEY"),
						rs.getString("CATEGORY_NAME"));
				projList.add(proj);			
			}		
			return projList;					
				
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}

	public List<Project> projectListOrderByLatest() throws SQLException {
      String sql = "SELECT * FROM Project "
   				+ "ORDER BY start_date";                         
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();		
			List<Project> projList = new ArrayList<Project>();	
			while (rs.next()) {
				Project proj = new Project(			
						rs.getInt("PROJECT_ID"),
						rs.getInt("USER_ID"),
						rs.getString("TITLE"),
						rs.getDate("START_DATE"), 
						rs.getString("IMAGE"),
						rs.getString("DESCRIPTION"),
						rs.getInt("GOAL"),
						rs.getInt("FUND_RATE"),
						rs.getInt("REST_DAY"),
						rs.getInt("FUNDING_PERIOD"),
						rs.getInt("TOTAL_MONEY"),
						rs.getString("CATEGORY_NAME"));
				projList.add(proj);			
			}		
			return projList;					
				
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}
	
	public int countingProjects() throws SQLException {
		String sql = "SELECT count(project_id) as cnt from project";
		int rslt = 0;
		try {
			ResultSet rs = jdbcUtil.executeQuery();			
			if (rs.next()) {
				rslt = rs.getInt("cnt");
			}		
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return rslt;
	}
	
	
	public List<Project> userCreateProjectList(int user_id) {
		String sql = "SELECT * " 
     		   + "FROM PROJECT "
     		   + "WHERE user_id = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {user_id});	
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();				
			List<Project> projectList = new ArrayList<Project>();	
			while (rs.next()) {
				Project project = new Project(			
						rs.getInt("PROJECT_ID"),
						rs.getInt("USER_ID"),
						rs.getString("TITLE"),
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
				projectList.add(project);			
			}
			return projectList;					
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}
	
	public List<Project> userCreateProjectList(String userId) {
		String sql = "SELECT PROJECT_ID, TITLE, START_DATE, DESCRIPTION, IMAGE, GOAL, FUND_RATE, REST_DAY, TOTAL_MONEY, CATEGORY_NAME " 
     		   + "FROM PROJECT p JOIN USERS u IN p.user_id = u.user_id_pk_seq "
     		   + "WHERE u.userId = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();				
			List<Project> projectList = new ArrayList<Project>();	
			while (rs.next()) {
				Project project = new Project(			
						rs.getInt("PROJECT_ID"),
						rs.getInt("USER_ID"),
						rs.getString("TITLE"),
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
				projectList.add(project);			
			}
			return projectList;					
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}

	public Project getProjectById(int PK_ID) {
		String searchQuery = query + "WHERE project_id = ?";

		jdbcUtil.setSqlAndParameters(searchQuery, new Object[] { PK_ID });

		try {
			ResultSet rs = jdbcUtil.executeQuery();
			Project proj = null;
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

	public int getNumberofProjects() {
	String sql = "SELECT * FROM PROJECT ";
	jdbcUtil.setSqlAndParameters(sql, null);
	int count=0;
	try {
		ResultSet rs = jdbcUtil.executeQuery();	
		while (rs.next()) 
		{
			count++;
		}
	} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
		jdbcUtil.close();		
	}
	return count;
	}
}
