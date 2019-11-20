package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Back_Order;
import model.Project;
import model.User;

public class Back_OrderDAO {
	
	private JDBCUtil jdbcUtil = null;
	private static String query = "SELECT user_id, project_id, amount_pleded, reward_option, back_date, " +
								"       rest_day, is_success, is_paid " +
										"FROM BackOrder ";

	public Back_OrderDAO() {
		this.jdbcUtil = jdbcUtil;
	}
	/* public int insertBackOrder(BackOrder bo) 
	 * 후원정보를 보는곳이므로 수정(Update)는 이루어지지않는다
	 * public int deleteBackOrder(BackOrder bo) 
	 * public List<BackOrder> getBackOrderListByuserID() 회원1명이 후원한 모든 프로젝트 보여주기
	 * 
	 */
	
	public int insertBackOrder(Back_Order bo) {
		int result = 0;
		String insertQuery = "INSERT INTO BackOrder (user_id, project_id, amount_pleded, reward_option, back_date, "+
							 "rest_day, is_success, is_paid) " +
							 "VALUES (?, ?, ?, ?, ?, ?, ?, ?); "; //예제에서 ; 없는데 들어가는지확인해보기
		
		DAOFactory factory = new DAOFactory();
		
		// FK  - user_id_pk_seq값 알아오기
		UserDAO UserDAO = factory.getUserDAO();	
		User user = UserDAO.getUserById(bo.getUser_id());	
		int user_id_pk_seq = user.getUser_id_pk_seq();	
		if (user_id_pk_seq == 0) {
			System.out.println("해당 사용자가 없습니다.(ID를 찾을수없음)" + bo.getUser_id());
			return 0;
		}
		// FK  - project_id값 알아오기
		ProjectDAO ProjectDAO = factory.getProjectDAO();		
		Project Project = ProjectDAO.getProjectById(bo.getProject_id());		
		int project_id = Project.getProject_id();			
		if (project_id == 0) {						
			System.out.println("해당 프로젝트가 없습니다.(ID를 찾을수없음)");
			return 0;
		}
		// amount_pleded - 리워드 옵션의 price에서 가져옴
		Reward_optionDAO Reward_optionDAO = factory.getReward_optionDAO();
		Reward_option Reward_option = Reward_optionDAO.getReward_optionById(bo.getProject_id());
		int project_id = Project.getProject_id();
		if (project_id == 0) {
			System.out.println("해당 프로젝트가 없습니다.(ID를 찾을수없음)");
			return 0;
		}
		// reward_option - 리워드 옵션의 option_id에서 가져옴

		// back_date

		// rest_day - 프로젝트의 rest_day에서 가져옴
		ProjectDAO = factory.getProjectDAO();
		Project = ProjectDAO.getProjectById(bo.getProject_id());
		int rest_day = Project.getRest_day();
		if (rest_day == 0) {
			System.out.println("모금기간이 만료되었습니다");
			return 0;
			// is_success

			// is_paid

			Object[] param = new Object[] { user_id_pk_seq, project_id, bo.getAmount_pleded(), bo.getReward_option(),
					bo.getBack_date(), rest_day, bo.getIs_success(), bo.getIs_paid() };
			jdbcUtil.setSqlAndParameters(insertQuery, param);

			try {
				result = jdbcUtil.executeUpdate(); // insert 문 실행
				System.out.println("후원자님이 밀어준 프로젝트가 후원정보에 등록되었습니다.");
			} catch (SQLException ex) {
				System.out.println("입력오류 발생!!!");
				if (ex.getErrorCode() == 1)
					System.out.println("동일한  후원정보가 이미 존재합니다.");
			} catch (Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			} finally {
				jdbcUtil.commit();
				jdbcUtil.close(); // ResultSet, PreparedStatement, Connection 반환
			}
			return result; // insert 에 의해 반영된 레코드 수 반환
		}
	}

	public int deleteBackOrder(Back_Order bo) {
		String deleteQuery = "DELETE FROM BackOrder WHERE user_id = ? AND project_id=? AND";

		Object[] param = new Object[] { stuNo };
		jdbcUtil.setSqlAndParameters(deleteQuery, param);

		try {
			int result = jdbcUtil.executeUpdate(); // delete 문 실행
			return result; // delete 에 의해 반영된 레코드 수 반환
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); // ResultSet, PreparedStatement, Connection 반환
		}
		return 0;
	}
}
