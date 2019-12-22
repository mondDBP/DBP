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

//	�⺻������ �����ϴ� query�� 2��
	String SelectAllQuery = "USER_ID, PROJECT_ID, AMOUNT_PLEDGED, REWARD_OPTION, BACK_DATE, "+
							"REST_DAY, IS_SUCCESS, IS_PAID " +
							"FROM Back_Order ";
	String allColumns = "USER_ID, PROJECT_ID, AMOUNT_PLEDGED, REWARD_OPTION, BACK_DATE, "+
						"REST_DAY, IS_SUCCESS, IS_PAID ";
//	������

	public Back_OrderDAO() {
		jdbcUtil = new JDBCUtil();
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
		
		String insertQuery = "INSERT INTO Back_Order (user_id, project_id, amount_pledged, reward_option, back_date, "+
							 "rest_day, is_success, is_paid) " + "VALUES (?, ?, ?, ?, TO_DATE(?), ?, ?, ?) ";
		
//		DAOFactory factory = new DAOFactory();
		
		// FK  - user_id_pk_seq�� �˾ƿ���
//		UserDAO UserDAO = factory.getUserDAO();	
//		User user = UserDAO.getUserById(bo.getUser_id());	
//		String user_id = user.getUserId();	
//		if (bo.getUser_id() == "") {
//			System.out.println("�ش� ����ڰ� �����ϴ�.(ID�� ã��������)" + bo.getUser_id());
//			return 0;
//		}
		// FK  - project_id�� �˾ƿ���
//		ProjectDAO ProjectDAO = factory.getProjectDAO();		
//		Project pj = ProjectDAO.getProjectById(bo.getProject_id());		
//		int project_id = pj.getProject_id();			
//		if (project_id == 0) {						
//			System.out.println("�ش� ������Ʈ�� �����ϴ�.(ID�� ã��������)");
//			return 0;
//		}
		// amount_pledged - ������ �ɼ��� price���� ������
//		Reward_optionDAO Reward_optionDAO = factory.getReward_optionDAO();
//		Reward_option ro = Reward_optionDAO.getReward_optionById(bo.getProject_id());
//		int price = ro.getPrice();
//		if (price == 0) {
//			System.out.println("�Ŀ��ݾ��� ã�� �� �����ϴ�");
//			return 0;
//		}
		// reward_option - ������ �ɼ��� option_id���� ������
//		int option_id = ro.getOption_id();
//		if(option_id == 0) {
//			System.out.println("������ �ɼ��� ã�� �� �����ϴ�");
//			return 0;
//		}

		// rest_day - ������Ʈ�� rest_day���� ������
//		int rest_day = pj.getRest_day();
//		if (rest_day == 0) {
//		PaymentDAO PaymentDAO = factory.getPaymentDAO();
//		Payment pm = PaymentDAO.getPaymentBy2ID(bo.getUser_id(), project_id);
//		String payment_id = pm.getPayment_id(); // payment_date�� �ϰ�;����� �ʱⰪ�� �������� id�� ��ü
//		if(payment_id == null) {
//			System.out.println("������ ����� �̷������ �ʾҽ��ϴ�");
//			bo.setIs_paid(0);
//			System.out.println("��ݱⰣ�� ����Ǿ����ϴ�");
//			return 0;
//		}
		// is_success - ������Ʈ�� is_success(=rest_day) 1�̸� ����, 0�̸� ����
//		int is_success = pj.getRest_day();
//		if(is_success == 0) {
//			System.out.println("������Ʈ �Ŀ������ �ƽ��� �����߽��ϴ�");
//			return 0;
//		}
		// is_paid - Payment���̺���  payment_id�� ���翩�η� �Ǵ� 1�̸� ����, 0�̸� 
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
			result = jdbcUtil.executeUpdate(); // insert �� ����
			System.out.println("�Ŀ��ڴ��� �о��� ������Ʈ�� �Ŀ������� ��ϵǾ����ϴ�.");
		} catch (SQLException ex) {
			ex.printStackTrace();
			System.out.println("�Է¿��� �߻�!!!");
			if (ex.getErrorCode() == 1)
				System.out.println("������  �Ŀ������� �̹� �����մϴ�.");
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();				
			jdbcUtil.close(); // ResultSet, PreparedStatement, Connection ��ȯ
		}
		return result; // insert �� ���� �ݿ��� ���ڵ� �� ��ȯ
	}

	public List<Back_Order> findBackList(String today) throws SQLException {
        String sql = "SELECT amount_pledged " 
        		   + "FROM BACK_ORDER "
        		   + "WHERE TO_CHAR(back_date, 'yy/mm/dd') = ?";

		Object[] param = new Object[] {today};
		
		jdbcUtil.setSqlAndParameters(sql, param);		// JDBCUtil�� query�� ����
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query ����			
			List<Back_Order> backList = new ArrayList<Back_Order>();	// User���� ����Ʈ ����
			while (rs.next()) {
				Back_Order back = new Back_Order(			// User ��ü�� �����Ͽ� ���� ���� ������ ����
					rs.getInt("amount_pledged"));
				backList.add(back);
					log.debug(Integer.toString(back.getAmount_pledged()));// List�� User ��ü ����
			}		
			return backList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource ��ȯ
		}
		return null;
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
