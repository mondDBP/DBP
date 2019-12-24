package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.Back_Order;
import model.Project;
import model.Reward_option;
import model.User;

public class Reward_optionDAO {

	private JDBCUtil jdbcUtil = null;
//	생성자
	public Reward_optionDAO() {
		jdbcUtil = new JDBCUtil(); // JDBCUtil 객체 생성
	}
//	기본정보를 포함하는 query문 2개
	String SelectAllQuery = "SELECT OPTION_ID, PROJECT_ID, PRICE, SHIPPING_FEE, DESCRIPTION, "
			+ "BACKER_COUNT, AMOUNT_LIMIT, "
			+ "FROM REWARD_OPTION ";
	String allColumns = "OPTION_ID, PROJECT_ID, PRICE, SHIPPING_FEE, DESCRIPTION, BACKER_COUNT, AMOUNT_LIMIT ";
	
//	시퀸스 생성
	public int getSequence() throws SQLException{
		int result = 1;
		String sql = "SELECT OPTION_ID_seq.nextval FROM DUAL";//OPTION_ID_seq
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
//	생성
	public int create(Reward_option ro) throws SQLException {
		String createSql = "INSERT INTO Reward_option ( " + allColumns + ") "
						 + "VALUES (?, ?, ?, ?, ?, ?, ? )"  ;
		
		//option_id 시퀸스로 생성
		int seq = getSequence();
		
		DAOFactory factory = new DAOFactory();
		// FK  - project_id값 알아오기
		ProjectDAO ProjectDAO = factory.getProjectDAO();		
		Project Project = ProjectDAO.getProjectById(ro.getProject_id());		
		int project_id = Project.getProject_id();			
		if (project_id == 0) {						
			System.out.println("해당 프로젝트가 없습니다.(ID를 찾을수없음)");
			return 0;
		}
		
		Object[] param = new Object[] {seq, project_id, ro.getPrice(), ro.getShipping_fee(), ro.getDescription(),
						ro.getBacker_count(), ro.getAmount_limit() };
		jdbcUtil.setSqlAndParameters(createSql, param);
		
		try {
			int result = jdbcUtil.executeUpdate();
		}catch(Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		return 0;
	}
//	수정
	public int update(Reward_option ro) {
		String updateSql = "UPDATE Reward_option SET PRICE=?, SHIPPING_FEE=?, "
						  +"DESCRIPTION=?, BACKER_COUNT=?, AMOUNT_LIMIT=? ;" ;
		
		Object[] param = new Object[] {ro.getPrice(), ro.getShipping_fee(), ro.getDescription(), 
									   ro.getBacker_count(), ro.getAmount_limit() };
	
		jdbcUtil.setSqlAndParameters(updateSql, param);							
		
		try {				
			int result = jdbcUtil.executeUpdate();	// update 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}
//	삭제
	public int delete(int option_id) {
		String removeSql ="DELETE FROM Reward_option WHERE OPTION_ID=? ";
		
		Object[] param = new Object[] {option_id};
		jdbcUtil.setSqlAndParameters(removeSql, param);

		try {				
			int result = jdbcUtil.executeUpdate();	// delete 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}
//	리워드옵션 존재확인
	public boolean existingReward_option(int option_id) throws SQLException {
		String sql = "SELECT count(*) FROM Reward_option WHERE option_id=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { option_id }); // JDBCUtil에 query문과 매개 변수 설정

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
//	프로젝트에 해당하는 리워드옵션 모두출력
	public List<Reward_option> findReward_optionListbyProject(int project_id){
		//String sql = SelectAllQuery + "WHERE PROJECT_ID=? " + "ORDER BY option_id";
		
		String sql = "SELECT OPTION_ID, PROJECT_ID, PRICE, SHIPPING_FEE, DESCRIPTION, BACKER_COUNT, AMOUNT_LIMIT " + 
				"FROM REWARD_OPTION " + 
				"WHERE PROJECT_ID=? " + 
				"ORDER BY option_id ";
		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {project_id});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행
			
			List<Reward_option> Reward_optionList = new ArrayList<Reward_option>();
			
			while (rs.next()) {
				Reward_option ro = new Reward_option(			
					rs.getInt("OPTION_ID"),
					rs.getInt("PROJECT_ID"),
					rs.getInt("PRICE"),
					rs.getInt("SHIPPING_FEE"),
					rs.getString("DESCRIPTION"),
					rs.getInt("BACKER_COUNT"),
					rs.getInt("AMOUNT_LIMIT"));
				Reward_optionList.add(ro);				
			}
			
			return Reward_optionList;
		}catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		return null;
	}
//	외래키로 검색해서 객체반환
	public Reward_option getReward_optionById(int PK_ID) {
		String searchQuery = SelectAllQuery + "WHERE project_id=? ";
		
		Object[] param = new Object[] {PK_ID};
		jdbcUtil.setSqlAndParameters(searchQuery, new Object[] {param});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			Reward_option dto = new Reward_option();
			while (rs.next()) {
				dto.setOption_id(rs.getInt("OPTION_ID"));
				dto.setProject_id(rs.getInt("PROJECT_ID"));
				dto.setPrice(rs.getInt("PRICE"));
				dto.setShipping_fee(rs.getInt("SHIPPING_FEE"));
				dto.setDescription(rs.getString("DESCRIPTION"));
				dto.setBacker_count(rs.getInt("BACKER_COUNT"));
				dto.setAmount_limit(rs.getInt("AMOUNT_LIMIT"));
			}
			return dto;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();
		}
		return null;
	}
	
	public int updateReWardOption(int optId) {
		String sql = "UPDATE REWARD_OPTION SET amount_limit = amount_limit - 1 AND backer_count = backer_count + 1 WHERE option_id = ?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {optId});
		
		int rs = 0;
		try {
			rs = jdbcUtil.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		
		return rs;
	}

}
