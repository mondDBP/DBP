package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Back_Order;
import model.Payment;
import model.Project;
import model.Reward_option;
import model.User;

public class Back_OrderDAO {
	private JDBCUtil jdbcUtil = null;
	
//	�⺻������ �����ϴ� query�� 2��
	String SelectAllQuery = "USER_ID, PROJECT_ID, AMOUNT_PLEDGED, REWARD_OPTION, BACK_DATE, "+
							"REST_DAY, IS_SUCCESS, IS_PAID " +
							"FROM Back_Order ";
	String allColumns = "USER_ID, PROJECT_ID, AMOUNT_PLEDGED, REWARD_OPTION, BACK_DATE, "+
						"REST_DAY, IS_SUCCESS, IS_PAID ";
//	������
	public Back_OrderDAO() {
		this.jdbcUtil = jdbcUtil;
	}
	/* public int insertBack_Order(Back_Order bo) 
	 * �Ŀ������� ���°��̹Ƿ� ����(Update)�� �̷�������ʴ´�
	 * public int deleteBack_Order(Back_Order bo) 
	 * public List<Back_Order> getBack_OrderListByuserID() ȸ��1���� �Ŀ��� ��� ������Ʈ �����ֱ�
	 * 
	 */
//	�Ŀ����� ����
	public int insertBack_Order(Back_Order bo) {//�ֹ������� �����ֹǷ� �ڷ��Էº��� �ٸ����̺� �ִ��ڷḦ �о ����
		int result = 0;
		String insertQuery = "INSERT INTO ( " + allColumns + ") " +
							 "VALUES (?, ?, ?, ?, ?, ?, ?, ?); "; //�������� ; ���µ� ������Ȯ���غ���
		
		DAOFactory factory = new DAOFactory();
		
		// FK  - user_id_pk_seq�� �˾ƿ���
		UserDAO UserDAO = factory.getUserDAO();	
		User user = UserDAO.getUserById(bo.getUser_id_pk_seq());	
		int user_id_pk_seq = user.getUser_id_pk_seq();	
		if (user_id_pk_seq == 0) {
			System.out.println("�ش� ����ڰ� �����ϴ�.(ID�� ã��������)" + bo.getUser_id_pk_seq());
			return 0;
		}
		// FK  - project_id�� �˾ƿ���
		ProjectDAO ProjectDAO = factory.getProjectDAO();		
		Project pj = ProjectDAO.getProjectById(bo.getProject_id());		
		int project_id = pj.getProject_id();			
		if (project_id == 0) {						
			System.out.println("�ش� ������Ʈ�� �����ϴ�.(ID�� ã��������)");
			return 0;
		}
		// amount_pleded - ������ �ɼ��� price���� ������
		Reward_optionDAO Reward_optionDAO = factory.getReward_optionDAO();
		Reward_option ro = Reward_optionDAO.getReward_optionById(bo.getProject_id());
		int price = ro.getPrice();
		if (price == 0) {
			System.out.println("�Ŀ��ݾ��� ã�� �� �����ϴ�");
			return 0;
		}
		// reward_option - ������ �ɼ��� option_id���� ������
		int option_id = ro.getOption_id();
		if(option_id == 0) {
			System.out.println("������ �ɼ��� ã�� �� �����ϴ�");
			return 0;
		}

		// rest_day - ������Ʈ�� rest_day���� ������
		int rest_day = pj.getRest_day();
		if (rest_day == 0) {
			System.out.println("��ݱⰣ�� ����Ǿ����ϴ�");
			return 0;
		}
		// is_success - ������Ʈ�� is_success(=rest_day) 1�̸� ����, 0�̸� ����
		int is_success = pj.getRest_day();
		if(is_success == 0) {
			System.out.println("������Ʈ �Ŀ������ �ƽ��� �����߽��ϴ�");
			return 0;
		}
		// is_paid - Payment���̺���  payment_id�� ���翩�η� �Ǵ� 1�̸� ����, 0�̸� ����
		PaymentDAO PaymentDAO = factory.getPaymentDAO();
		Payment pm = PaymentDAO.getPaymentBy2ID(user_id_pk_seq, project_id);
		String payment_id = pm.getPayment_id(); // payment_date�� �ϰ�;����� �ʱⰪ�� �������� id�� ��ü
		if(payment_id == null) {
			System.out.println("������ ����� �̷������ �ʾҽ��ϴ�");
			bo.setIs_paid(0);
			return 0;
		}else bo.setIs_paid(1);
		
		Object[] param = new Object[] { 
				user_id_pk_seq,
				project_id, 
				price, 
				option_id,
				bo.getBack_date(), 
				rest_day, 
				bo.getIs_success(), 
				bo.getIs_paid() };
		jdbcUtil.setSqlAndParameters(insertQuery, param);

		try {
			result = jdbcUtil.executeUpdate(); // insert �� ����
			System.out.println("�Ŀ��ڴ��� �о��� ������Ʈ�� �Ŀ������� ��ϵǾ����ϴ�.");
		} catch (SQLException ex) {
			System.out.println("�Է¿��� �߻�!!!");
			if (ex.getErrorCode() == 1)
				System.out.println("������  �Ŀ������� �̹� �����մϴ�.");
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();				jdbcUtil.close(); // ResultSet, PreparedStatement, Connection ��ȯ
		}
		return result; // insert �� ���� �ݿ��� ���ڵ� �� ��ȯ
		
	}

	public int deleteBack_Order(int user_id_pk_seq, int project_id, int reward_option) {
		String deleteQuery = "DELETE FROM BackOrder WHERE USER_ID = ? AND PROJECT_ID=? AND REWARD_OPTION=? ";

		Object[] param = new Object[] { user_id_pk_seq,  project_id, reward_option};
		jdbcUtil.setSqlAndParameters(deleteQuery, param);

		try {
			int result = jdbcUtil.executeUpdate(); // delete �� ����
			return result; // delete �� ���� �ݿ��� ���ڵ� �� ��ȯ
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); // ResultSet, PreparedStatement, Connection ��ȯ
		}
		return 0;
	}
}
