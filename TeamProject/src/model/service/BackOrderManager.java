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
 * ����� ���� API�� ����ϴ� �����ڵ��� ���� �����ϰ� �Ǵ� Ŭ����.
 * UserDAO�� �̿��Ͽ� �����ͺ��̽��� ������ ���� �۾��� �����ϵ��� �ϸ�,
 * �����ͺ��̽��� �����͵��� �̿��Ͽ� �����Ͻ� ������ �����ϴ� ������ �Ѵ�.
 * �����Ͻ� ������ ������ ��쿡�� �����Ͻ� �������� �����ϴ� Ŭ������ 
 * ������ �� �� �ִ�.
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
		log.debug("�Ŵ��������� today��" + today);
		return backorderdao.findBackList(today);
	}
}