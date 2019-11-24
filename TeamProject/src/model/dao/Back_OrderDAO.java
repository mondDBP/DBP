package model.dao;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import model.Back_Order;
import model.Project;
import model.Reward_option;
import model.User;

public class Back_OrderDAO {
	private static final Logger log = LoggerFactory.getLogger(Back_OrderDAO.class);
	private JDBCUtil jdbcUtil = null;
	private static String query = "SELECT user_id, project_id, amount_pledged, reward_option, back_date, " +
								"       rest_day, is_success, is_paid " +
										"FROM Back_Order ";

	public Back_OrderDAO() {
		jdbcUtil = new JDBCUtil();
	}
	/* public int insertBack_Order(Back_Order bo) 
	 * �Ŀ������� ���°��̹Ƿ� ����(Update)�� �̷�������ʴ´�
	 * public int deleteBack_Order(Back_Order bo) 
	 * public List<Back_Order> getBack_OrderListByuserID() ȸ��1���� �Ŀ��� ��� ������Ʈ �����ֱ�
	 * 
	 */
	
	public int insertBack_Order(Back_Order bo) {
		int result = 0;
		String insertQuery = "INSERT INTO Back_Order (user_id, project_id, amount_pledged, reward_option, back_date, "+
							 "rest_day, is_success, is_paid) " +
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
		Project Project = ProjectDAO.getProjectById(bo.getProject_id());		
		int project_id = Project.getProject_id();			
		if (project_id == 0) {						
			System.out.println("�ش� ������Ʈ�� �����ϴ�.(ID�� ã��������)");
			return 0;
		}
		// amount_pledged - ������ �ɼ��� price���� ������
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
		// back_date

		// rest_day - ������Ʈ�� rest_day���� ������
		ProjectDAO = factory.getProjectDAO();
		Project = ProjectDAO.getProjectById(bo.getProject_id());
		int rest_day = Project.getRest_day();
		if (rest_day == 0) {
			System.out.println("��ݱⰣ�� ����Ǿ����ϴ�");
			return 0;
			// is_success

			// is_paid

			Object[] param = new Object[] { user_id_pk_seq, project_id, price, option_id,
					bo.getBack_date(), rest_day, bo.getIs_success(), bo.getIs_paid() };
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
				jdbcUtil.commit();
				jdbcUtil.close(); // ResultSet, PreparedStatement, Connection ��ȯ
			}
			return result; // insert �� ���� �ݿ��� ���ڵ� �� ��ȯ
		}
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
	
	public int deleteBack_Order(Back_Order bo) {
		String deleteQuery = "DELETE FROM BackOrder WHERE user_id = ? AND project_id=? AND";

		Object[] param = new Object[] { stuNo };
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
