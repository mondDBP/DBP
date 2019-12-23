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
//	������
	public PaymentDAO() {
		jdbcUtil = new JDBCUtil(); // JDBCUtil ��ü ����
	}
//	�⺻������ �����ϴ� query�� 2��
	String SelectAllQuery = "SELECT USER_ID, AMOUNT, PAYMENT_ID, PROJECT_ID, PAYMENT_DATE, "
			+ "CARD_NUMBER "
			+ "FROM Payment ";
	String allColumns = "USER_ID, AMOUNT, PAYMENT_ID, PROJECT_ID, PAYMENT_DATE, CARD_NUMBER ";

//	����
	public int create(Payment paym) {
		String createSql = "INSERT INTO Payment ( " + allColumns + ") "
						 + "VALUES (?, ?, ?, ?, ?, ?)"  ;
		
		DAOFactory factory = new DAOFactory();
		
		// FK  - user_id_pk_seq�� �˾ƿ���
		UserDAO UserDAO = factory.getUserDAO();	
		User user = UserDAO.getUserById(paym.getUser_id_pk_seq());	
		int user_id_pk_seq = user.getUser_id_pk_seq();	
		if (user_id_pk_seq == 0) {
			System.out.println("�ش� ����ڰ� �����ϴ�.(ID�� ã��������)" + paym.getUser_id_pk_seq());
			return 0;
		}
		// FK  - project_id�� �˾ƿ���
		ProjectDAO ProjectDAO = factory.getProjectDAO();		
		Project Project = ProjectDAO.getProjectById(paym.getProject_id());		
		int project_id = Project.getProject_id();			
		if (project_id == 0) {						
			System.out.println("�ش� ������Ʈ�� �����ϴ�.(ID�� ã��������)");
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
//	�������� ���Ƿ� ���� �Ұ�
//	����
	public int delete(String payment_id) {
		String removeSql ="DELETE FROM Payment WHERE PAYMENT_ID=? ";
		
		Object[] param = new Object[] {payment_id};
		jdbcUtil.setSqlAndParameters(removeSql, param);

		try {				
			int result = jdbcUtil.executeUpdate();	// delete �� ����
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource ��ȯ
		}		
		return 0;
	}
//	payment_id �ߺ����� üũ�ϱ�����  ����Ʈ�� ��������nono �׳� existing_payment_id�� ����
//	existing_payment_id ����Ȯ��
	public boolean existing_payment_id(String checkID) throws SQLException {
		String sql = "SELECT count(*) FROM Payment WHERE payment_id=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] { checkID }); // JDBCUtil�� query���� �Ű� ���� ����

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
		
	
	
//	FK(�ܷ�Ű)����Ű 2��  �˻��Ͽ� ��ü1�� ������
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
