package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.Payment;
import model.Project;
import model.Reward_option;
import model.User;

public class PaymentDAO {
	private static final Logger log = LoggerFactory.getLogger(UserDAO.class);
	private JDBCUtil jdbcUtil = null;
//	생성자
	public PaymentDAO() {
		jdbcUtil = new JDBCUtil(); // JDBCUtil 객체 생성
	}
//	기본정보를 포함하는 query문 2개
	String SelectAllQuery = "SELECT USER_ID, AMOUNT, PAYMENT_ID, PROJECT_ID, PAYMENT_DATE, "
			+ "CARD_NUMBER "
			+ "FROM Payment ";
	String allColumns = "USER_ID, AMOUNT, PAYMENT_ID, PROJECT_ID, PAYMENT_DATE, CARD_NUMBER ";

//	생성
	public int create(Payment paym) {
		String createSql = "INSERT INTO Payment ( " + allColumns + ") "
						 + "VALUES (?, ?, ?, ?, ?, ?)"  ;
		
		DAOFactory factory = new DAOFactory();
		
		// FK  - user_id_pk_seq값 알아오기
		UserDAO UserDAO = factory.getUserDAO();	
		User user = UserDAO.getUserById(paym.getUser_id_pk_seq());	
		int user_id_pk_seq = user.getUser_id_pk_seq();	
		if (user_id_pk_seq == 0) {
			System.out.println("해당 사용자가 없습니다.(ID를 찾을수없음)" + paym.getUser_id_pk_seq());
			return 0;
		}
		// FK  - project_id값 알아오기
		ProjectDAO ProjectDAO = factory.getProjectDAO();		
		Project Project = ProjectDAO.getProjectById(paym.getProject_id());		
		int project_id = Project.getProject_id();			
		if (project_id == 0) {						
			System.out.println("해당 프로젝트가 없습니다.(ID를 찾을수없음)");
			return 0;
		}
		
		Object[] param = new Object[] {user_id_pk_seq, paym.getAmount(), paym.getPayment_id(), paym.getProject_id(), paym.getPayment_date(),
						paym.getCard_number() };
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
//	결제정보 임의로 수정 불가
//	삭제
	public int delete(String payment_id) {
		String removeSql ="DELETE FROM Payment WHERE PAYMENT_ID=? ";
		
		Object[] param = new Object[] {payment_id};
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
//	payment_id 중복여부 체크하기위해  리스트로 가져오기nono 그냥 existing_payment_id가 간단
//	existing_payment_id 증복확인
	public boolean existing_payment_id(String checkID) throws SQLException {
		String sql = "SELECT count(*) FROM Payment WHERE payment_id=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { checkID }); // JDBCUtil에 query문과 매개 변수 설정

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
		
	
	
//	FK(외래키)복합키 2개  검색하여 객체1개 가져감
	public Payment getPaymentBy2ID(String user_id, int project_id) {

		String searchQuery = SelectAllQuery + "WHERE USER_ID=? AND PROJECT_ID=? ";
		
		Object[] param = new Object[] {user_id, project_id};
		jdbcUtil.setSqlAndParameters(searchQuery, new Object[] {param});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			Payment dto = new Payment();
			while (rs.next()) {
				dto.setUser_id(rs.getString("USER_ID"));
				dto.setAmount(rs.getInt("AMOUNT"));
				dto.setPayment_id(rs.getString("PAYMENT_ID"));
				dto.setProject_id(rs.getInt("PROJECT_ID"));
				dto.setPayment_date(rs.getDate("PAYMENT_DATE"));
				dto.setCard_number(rs.getInt("BACKER_COUNT"));
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
