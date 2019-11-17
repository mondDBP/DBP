package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Project;
import model.User;

public class ProjectDAO {
	private JDBCUtil jdbcUtil = null;

//	������
	public ProjectDAO() {
		jdbcUtil = new JDBCUtil(); // JDBCUtil ��ü ����
	}

//	������ ����
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
			jdbcUtil.close();	// resource ��ȯ
		}		
		return result;
		
	}

//	���ο� ������Ʈ ����
	public int create(Project p) throws SQLException {
		String sql = "INSERT INTO Project (title, start_date, image, description , goal,"
				+ " fund_rate, rest_day, funding_period, total_money, is_success, ) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] param = new Object[] { p.getTitle(), p.getStart_date(), p.getImage(), p.getDescription(), p.getGoal(),
				+p.getFund_rate(), p.getRest_day(), p.getFunding_period(), p.getTotal_money(), p.getIs_success(),
				p.getCategory_name() };
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

//	������Ʈ ����
	public int update(Project p) throws SQLException {
		String sql = "UPDATE Project " + "SET title=?, start_date=?, image=?, description=?, goal=?,"
				+ "fund_rate=?, rest_day=?, funding_period=?, total_money=?, is_success=?, category_name=? "
				+ "WHERE project_id=?";
		Object[] param = new Object[] { p.getTitle(), p.getStart_date(), p.getImage(), p.getDescription(), p.getGoal(),
				+p.getFund_rate(), p.getRest_day(), p.getFunding_period(), p.getTotal_money(), p.getIs_success(),
				p.getCategory_name() + p.getProject_id() };
		jdbcUtil.setSqlAndParameters(sql, param); // JDBCUtil�� update���� �Ű� ���� ����

		try {
			int result = jdbcUtil.executeUpdate(); // update �� ����
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

//	������Ʈ ����
	public int remove(int project_id) throws SQLException {
		String sql = "DELETE FROM Project WHERE project_id=?";
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

// ������ƮID�� �ش��ϴ� ������Ʈ�� �����ϴ��� �˻�
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
	
//	findUsersOnProject ����
	public List<User> findUsersOnProject(int project_id) {
		String sql = "SELECT userid"
				+ "FROM PROJECT "
				+ "WHERE project_id=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {project_id});
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query ����
			if (rs.next()) {						
//				Project proj = s.getString("user_id"),
//				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
//	�˻� 
	public Project findProject(int project_id) throws SQLException {
        String sql = "SELECT * "
        			+ "FROM PROJECT "
        			+ "WHERE project_id=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {project_id});	// JDBCUtil�� query���� �Ű� ���� ����

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query ����
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
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
//	��������
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
			ResultSet rs = jdbcUtil.executeQuery();		// query ����
			List<Project> projList = new ArrayList<Project>();	// project���� ����Ʈ ����
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
				projList.add(proj);			// List�� project ��ü ����
			}		
			return projList;					
				
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
//	�ݵ������� ����
	public List<Project> projectListOrderByFundRate() throws SQLException {
      String sql = "SELECT * FROM Project "
   				+ "ORDER BY fund_rate desc";                         
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query ����
			List<Project> projList = new ArrayList<Project>();	// project���� ����Ʈ ����
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
				projList.add(proj);			// List�� project ��ü ����
			}		
			return projList;					
				
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
//	�ֽż� ����
	public List<Project> projectListOrderByLatest() throws SQLException {
      String sql = "SELECT * FROM Project "
   				+ "ORDER BY start_date";                         
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query ����
			List<Project> projList = new ArrayList<Project>();	// project���� ����Ʈ ����
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
				projList.add(proj);			// List�� project ��ü ����
			}		
			return projList;					
				
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
	}
}
