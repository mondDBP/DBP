package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.BackOrder;
import model.Project;
import model.User;

public class BackOrderDAO {
	
	private JDBCUtil jdbcUtil = null;
	private static String query = "SELECT user_id, project_id, amount_pleded, reward_option, back_date, " +
								"       rest_day, is_success, is_paid " +
										"FROM BackOrder ";

	public BackOrderDAO() {
		this.jdbcUtil = jdbcUtil;
	}
	public int insertBackOrder(BackOrder bo) {
		int result = 0;
		String insertQuery = query + ", " + ""; //�̺κе� �̿Ϸ�
		
		DAOFactory factory = new DAOFactory();		
		UserDAO UserDAO = factory.getUserDAO();	
		User user = UserDAO.getUserById(bo.getUser_id());	//Param.�޼ҵ�� �ܷ�Ű����??!!!
		int user_id_pk_seq = user.getUser_id_pk_seq();	//��ü�ް� ���� ������
		if (user_id_pk_seq == 0) {
			System.out.println("�ش� ����ڰ� �����ϴ�.(ID�� ã��������)" + bo.getUser_id());
			return 0;
		}
//	--->11/19 21:34 ������� �۾�	
		// FK  - project_id�� �˾ƿ���
		ProjectDAO ProjectDAO = factory.getProjectDAO();		// ���忡�� DAO��üȹ��
		Project Project = ProjectDAO.getProjectById(bo.getProject_id());		// �а� DAO �� �а����� ����Ͽ� �а��ڵ带 ������ �޼ҵ� ���
		String dCode = Project.getProject_id();			// ���忡�� DAO������(�ܺ�ǥ) -> �ܺ�ǥ.get__by�ܷ�Ű?(myǥ.�޼ҵ�)); 
		if (dCode == null) {						// -> �ܺΰ�ü(dto)��ȯ -> ����1������
			System.out.println("�ش� �а��� �����ϴ�.");
			return 0;
		}
		// query ���� ����� �Ű����� ���� ���� �Ű����� �迭 ����
		Object[] param = new Object[] {stu.getStuNo(), stu.getStuName(), 
							stu.getPwd(), stu.getStuPhoneNo(), stu.getYear(), pCode, dCode};		
		jdbcUtil.setSql(insertQuery);			// JDBCUtil �� insert �� ����
		jdbcUtil.setParameters(param);			// JDBCUtil �� �Ű����� ����
				
		try {				
			result = jdbcUtil.executeUpdate();		// insert �� ����
			System.out.println(stu.getStuNo() + " �й��� �л������� ���ԵǾ����ϴ�.");
		} catch (SQLException ex) {
			System.out.println("�Է¿��� �߻�!!!");
			if (ex.getErrorCode() == 1)
				System.out.println("������ �л������� �̹� �����մϴ�."); 
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();		// ResultSet, PreparedStatement, Connection ��ȯ
		}		
		return result;		// insert �� ���� �ݿ��� ���ڵ� �� ��ȯ	
	}

}
