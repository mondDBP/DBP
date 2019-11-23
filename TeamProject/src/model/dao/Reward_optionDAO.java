package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.Reward_option;

public class Reward_optionDAO {

	private JDBCUtil jdbcUtil = null;
//	생성자
	public Reward_optionDAO(JDBCUtil jdbcUtil) {
		jdbcUtil = new JDBCUtil(); // JDBCUtil 객체 생성
	}
//	시퀸스 생성
	public int getSequence() throws SQLException{
		int result = 1;
		String sql = "SELECT option_id_seq.nextval FROM DUAL";//option_id_seq
		jdbcUtil.setSqlAndParameters(sql, null);
		try {				
			ResultSet rs = jdbcUtil.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
			//return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return result;
	}
	public int CreateReward_option(Reward_option ro) {
		String createSql = "INSERT INTO Reward_option (OPTION_ID, "   ;
				
		// FK  - user_id_pk_seq값 알아오기
				
		// FK  - project_id값 알아오기
		
		
		return 0;
	}
	
	


}
