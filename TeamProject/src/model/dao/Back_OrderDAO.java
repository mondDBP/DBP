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
	 * �Ŀ������� ���°��̹Ƿ� ����(Update)�� �̷�������ʴ´�
	 * public int deleteBackOrder(BackOrder bo) 
	 * public List<BackOrder> getBackOrderListByuserID() ȸ��1���� �Ŀ��� ��� ������Ʈ �����ֱ�
	 * 
	 */
	
	public int insertBackOrder(Back_Order bo) {
		int result = 0;
		String insertQuery = "INSERT INTO BackOrder (user_id, project_id, amount_pleded, reward_option, back_date, "+
							 "rest_day, is_success, is_paid) " +
							 "VALUES (?, ?, ?, ?, ?, ?, ?, ?); "; //�������� ; ���µ� ������Ȯ���غ���
		
		DAOFactory factory = new DAOFactory();
		
		// FK  - user_id_pk_seq�� �˾ƿ���
		UserDAO UserDAO = factory.getUserDAO();	
		User user = UserDAO.getUserById(bo.getUser_id());	
		int user_id_pk_seq = user.getUser_id_pk_seq();	
		if (user_id_pk_seq == 0) {
			System.out.println("�ش� ����ڰ� �����ϴ�.(ID�� ã��������)" + bo.getUser_id());
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
		// amount_pleded - ������ �ɼ��� price���� ������
		Reward_optionDAO Reward_optionDAO = factory.getReward_optionDAO();
		Reward_option Reward_option = Reward_optionDAO.getReward_optionById(bo.getProject_id());
		int project_id = Project.getProject_id();
		if (project_id == 0) {
			System.out.println("�ش� ������Ʈ�� �����ϴ�.(ID�� ã��������)");
			return 0;
		}
		// reward_option - ������ �ɼ��� option_id���� ������

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

			Object[] param = new Object[] { user_id_pk_seq, project_id, bo.getAmount_pleded(), bo.getReward_option(),
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

	public int deleteBackOrder(Back_Order bo) {
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
