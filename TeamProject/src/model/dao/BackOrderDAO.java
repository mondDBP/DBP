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
		String insertQuery = query + ", " + ""; //이부분도 미완료
		
		DAOFactory factory = new DAOFactory();		
		UserDAO UserDAO = factory.getUserDAO();	
		User user = UserDAO.getUserById(bo.getUser_id());	//Param.메소드로 외래키역할??!!!
		int user_id_pk_seq = user.getUser_id_pk_seq();	//객체받고 변수 꺼내기
		if (user_id_pk_seq == 0) {
			System.out.println("해당 사용자가 없습니다.(ID를 찾을수없음)" + bo.getUser_id());
			return 0;
		}
//	--->11/19 21:34 여기까지 작업	
		// FK  - project_id값 알아오기
		ProjectDAO ProjectDAO = factory.getProjectDAO();		// 공장에서 DAO객체획득
		Project Project = ProjectDAO.getProjectById(bo.getProject_id());		// 학과 DAO 의 학과명을 사용하여 학과코드를 얻어오는 메소드 사용
		String dCode = Project.getProject_id();			// 공장에서 DAO가져옴(외부표) -> 외부표.get__by외래키?(my표.메소드)); 
		if (dCode == null) {						// -> 외부객체(dto)반환 -> 변수1개추출
			System.out.println("해당 학과가 없습니다.");
			return 0;
		}
		// query 문에 사용할 매개변수 값을 갖는 매개변수 배열 생성
		Object[] param = new Object[] {stu.getStuNo(), stu.getStuName(), 
							stu.getPwd(), stu.getStuPhoneNo(), stu.getYear(), pCode, dCode};		
		jdbcUtil.setSql(insertQuery);			// JDBCUtil 에 insert 문 설정
		jdbcUtil.setParameters(param);			// JDBCUtil 에 매개변수 설정
				
		try {				
			result = jdbcUtil.executeUpdate();		// insert 문 실행
			System.out.println(stu.getStuNo() + " 학번의 학생정보가 삽입되었습니다.");
		} catch (SQLException ex) {
			System.out.println("입력오류 발생!!!");
			if (ex.getErrorCode() == 1)
				System.out.println("동일한 학생정보가 이미 존재합니다."); 
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();		// ResultSet, PreparedStatement, Connection 반환
		}		
		return result;		// insert 에 의해 반영된 레코드 수 반환	
	}

}
