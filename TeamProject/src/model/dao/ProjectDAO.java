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

import model.Back_Order;
import model.Project;
import model.User;

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
	public int update(Project p) throws SQLException {
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
	
//	findUsersOnProject 미정
	public List<User> findUsersOnProject(int project_id) {
		String sql = "SELECT userid"
				+ "FROM PROJECT "
				+ "WHERE project_id=? ; ";
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
//	이름(title)로 프로젝트 검색 --- 미완성
	public Project findProject(String title) throws SQLException {
		//pStmt를 위해 JDBC이용
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	// JDBC 드라이버 로딩 및 등록
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		Connection conn = null;
		PreparedStatement pStmt = null;
		try {
		conn = DriverManager.getConnection("202.20.119.117:1521:orcl", "dbp0108", "mond");
		}catch(SQLException ex) {ex.printStackTrace(); }
		
		stmt = conn.createStatement();	
		rs = stmt.executeQuery(query2);	
		
        String sql = "SELECT * "
        			+ "FROM PROJECT "
        			+ "WHERE TITLE LIKE ? ";    
        System.out.println(sql);
        pStmt = conn.prepareStatement(sql);
        pStmt.setString(1, title);
        
        String pattern = "' " + title + "' ";
        try {
			String query2 = "SELECT * "
        			+ "FROM PROJECT "
					  	+ "WHERE TITLE LIKE '" + pattern + "'";	// 문자열 값 앞뒤에 작은따옴표 필요
			System.out.println(query2);
			
			stmt = conn.createStatement();	
			rs = stmt.executeQuery(query2);				// Statement 객체를 통한 질의 실행
			System.out.println();
			while (rs.next()) {							// 커서를 통해 한 행씩 fetch
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				String dname = rs.getString("dname");
				System.out.println(ename + " " + job + " " + dname);
			}
			System.out.println();
			rs.close();
        
        String name = title;
        pstmt.setString(1, "%"+name+"%"); 
		jdbcUtil.setSqlAndParameters(sql, new Object[] {title});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						
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

	public Project getProjectById(int PK_ID) {
		String query = "SELECT project_id, category_name, user_id, title, start_date, " +
				"       image, description, goal, fund_rate, rest_day, " +
				"       funding_period, total_money " +
				"FROM Project ";
	
	String searchQuery = query + "WHERE project_id = ?";
	Object[] param = new Object[] {PK_ID};
	
	jdbcUtil.setSqlAndParameters(searchQuery, new Object[] {param});
	
	try {
		ResultSet rs = jdbcUtil.executeQuery();
		User dto = new User();
		while (rs.next()) {
			dto.setUser_id_pk_seq(rs.getInt("project_id"));
			dto.setUserId(rs.getString("category_name"));
			dto.setPassword(null); //비밀번호는 전송x
			dto.setName(rs.getString("name"));
			dto.setPhone(rs.getString("phone"));
			dto.setAddress(rs.getString("address"));
			dto.setEmail(rs.getString("email"));
			dto.setEmail(rs.getString("email2"));
			dto.setResid_id(rs.getString("resid_id"));
			dto.setResid_id2(rs.getString("resid_id2"));	
		}
		return dto;
	} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
		jdbcUtil.close();
	}
	return null;
	}
}
