package model.dao;

import java.sql.ResultSet;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import model.Back_Order;
import model.Payment;
import model.Project;
import model.Reward_option;
import model.User;

public class Back_OrderDAO {

	private static final Logger log = LoggerFactory.getLogger(Back_OrderDAO.class);

	private JDBCUtil jdbcUtil = null;

	private static String query = "SELECT user_id, project_id, amount_pledged, reward_option, back_date, " +
								"       rest_day, is_success, is_paid " +
										"FROM Back_Order ";

//	기본정보를 포함하는 query문 2개
	String SelectAllQuery = "USER_ID, PROJECT_ID, AMOUNT_PLEDGED, REWARD_OPTION, BACK_DATE, "+
							"REST_DAY, IS_SUCCESS, IS_PAID " +
							"FROM Back_Order ";
	String allColumns = "USER_ID, PROJECT_ID, AMOUNT_PLEDGED, REWARD_OPTION, BACK_DATE, "+
						"REST_DAY, IS_SUCCESS, IS_PAID ";
//	생성자

	public Back_OrderDAO() {
		jdbcUtil = new JDBCUtil();
	}
	/* public int insertBack_Order(Back_Order bo) 
	 * 후원정보를 보는곳이므로 수정(Update)는 이루어지지않는다
	 * public int deleteBack_Order(Back_Order bo) 
	 * public List<Back_Order> getBack_OrderListByuserID() 회원1명이 후원한 모든 프로젝트 보여주기
	 * 
	 */
//	후원정보 생성
	public int insertBack_Order(Back_Order bo) {//주문정보를 보여주므로 자료입력보다 다른테이블에 있는자료를 읽어서 생성
		int result = 0;
		
		String insertQuery = "INSERT INTO Back_Order (user_id, project_id, amount_pledged, reward_option, back_date, "+
							 "rest_day, is_success, is_paid) " + "VALUES (?, ?, ?, ?, TO_DATE(?), ?, ?, ?) ";
		
//		DAOFactory factory = new DAOFactory();
		
		// FK  - user_id_pk_seq값 알아오기
//		UserDAO UserDAO = factory.getUserDAO();	
//		User user = UserDAO.getUserById(bo.getUser_id());	
//		String user_id = user.getUserId();	
//		if (bo.getUser_id() == "") {
//			System.out.println("해당 사용자가 없습니다.(ID를 찾을수없음)" + bo.getUser_id());
//			return 0;
//		}
		// FK  - project_id값 알아오기
//		ProjectDAO ProjectDAO = factory.getProjectDAO();		
//		Project pj = ProjectDAO.getProjectById(bo.getProject_id());		
//		int project_id = pj.getProject_id();			
//		if (project_id == 0) {						
//			System.out.println("해당 프로젝트가 없습니다.(ID를 찾을수없음)");
//			return 0;
//		}
		// amount_pledged - 리워드 옵션의 price에서 가져옴
//		Reward_optionDAO Reward_optionDAO = factory.getReward_optionDAO();
//		Reward_option ro = Reward_optionDAO.getReward_optionById(bo.getProject_id());
//		int price = ro.getPrice();
//		if (price == 0) {
//			System.out.println("후원금액을 찾을 수 없습니다");
//			return 0;
//		}
		// reward_option - 리워드 옵션의 option_id에서 가져옴
//		int option_id = ro.getOption_id();
//		if(option_id == 0) {
//			System.out.println("리워드 옵션을 찾을 수 없습니다");
//			return 0;
//		}

		// rest_day - 프로젝트의 rest_day에서 가져옴
//		int rest_day = pj.getRest_day();
//		if (rest_day == 0) {
//		PaymentDAO PaymentDAO = factory.getPaymentDAO();
//		Payment pm = PaymentDAO.getPaymentBy2ID(bo.getUser_id(), project_id);
//		String payment_id = pm.getPayment_id(); // payment_date로 하고싶었지만 초기값을 알지못해 id로 대체
//		if(payment_id == null) {
//			System.out.println("결제가 제대로 이루어지지 않았습니다");
//			bo.setIs_paid(0);
//			System.out.println("모금기간이 만료되었습니다");
//			return 0;
//		}
		// is_success - 프로젝트의 is_success(=rest_day) 1이면 성공, 0이면 실패
//		int is_success = pj.getRest_day();
//		if(is_success == 0) {
//			System.out.println("프로젝트 후원모금이 아쉽게 실패했습니다");
//			return 0;
//		}
		// is_paid - Payment테이블의  payment_id의 존재여부로 판단 1이면 성공, 0이면 
//			return 0;
//		}else bo.setIs_paid(1);
//		
		
		Object[] param = new Object[] { 
				bo.getUser_id(),
				bo.getProject_id(), 
				bo.getAmount_pledged(), 
				bo.getReward_option(),
				bo.getBack_date(),
				bo.getRest_day(), 
				bo.getIs_success(), 
				bo.getIs_paid() };
		
		jdbcUtil.setSqlAndParameters(insertQuery, param);

		try {
			result = jdbcUtil.executeUpdate(); // insert 문 실행
			System.out.println("후원자님이 밀어준 프로젝트가 후원정보에 등록되었습니다.");
		} catch (SQLException ex) {
			ex.printStackTrace();
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

	public List<Back_Order> findBackList(String today) throws SQLException {
        String sql = "SELECT amount_pledged " 
        		   + "FROM BACK_ORDER "
        		   + "WHERE TO_CHAR(back_date, 'yy/mm/dd') = ?";

		Object[] param = new Object[] {today};
		
		jdbcUtil.setSqlAndParameters(sql, param);		// JDBCUtil에 query문 설정
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
			List<Back_Order> backList = new ArrayList<Back_Order>();	// User들의 리스트 생성
			while (rs.next()) {
				Back_Order back = new Back_Order(			// User 객체를 생성하여 현재 행의 정보를 저장
					rs.getInt("amount_pledged"));
				backList.add(back);
					log.debug(Integer.toString(back.getAmount_pledged()));// List에 User 객체 저장
			}		
			return backList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}

	public int deleteBack_Order(int user_id_pk_seq, int project_id, int reward_option) {
		String deleteQuery = "DELETE FROM BackOrder WHERE USER_ID = ? AND PROJECT_ID=? AND REWARD_OPTION=? ";

		Object[] param = new Object[] { user_id_pk_seq,  project_id, reward_option};
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
