package model.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import model.User;
import model.Admin;
import model.Back_Order;
import model.Project;
import model.dao.Back_OrderDAO;
import model.dao.ProjectDAO;
import model.dao.UserDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * 사용자 관리 API를 사용하는 개발자들이 직접 접근하게 되는 클래스.
 * UserDAO를 이용하여 데이터베이스에 데이터 조작 작업이 가능하도록 하며,
 * 데이터베이스의 데이터들을 이용하여 비지니스 로직을 수행하는 역할을 한다.
 * 비지니스 로직이 복잡한 경우에는 비지니스 로직만을 전담하는 클래스를 
 * 별도로 둘 수 있다.
 */
public class BackOrderManager {

	private static final Logger log = LoggerFactory.getLogger(BackOrderManager.class);
	
	private static BackOrderManager backMan = new BackOrderManager();
	private static Back_OrderDAO backorderdao;
//	private UserAnalysis userAanlysis;

	private BackOrderManager() {
		try {
			backorderdao = new Back_OrderDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static BackOrderManager getInstance() {
		return backMan;
	}
	
	public List<Back_Order> findBackList(String today) throws SQLException {
		log.debug("매니저에서의 today값" + today);
		return backorderdao.findBackList(today);
	}
}