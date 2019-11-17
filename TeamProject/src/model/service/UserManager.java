package model.service;

import java.sql.SQLException;
import java.util.List;

import model.User;
import model.Project;
import model.dao.ProjectDAO;
import model.dao.UserDAO_ej;

/**
 * ����� ���� API�� ����ϴ� �����ڵ��� ���� �����ϰ� �Ǵ� Ŭ����.
 * UserDAO�� �̿��Ͽ� �����ͺ��̽��� ������ ���� �۾��� �����ϵ��� �ϸ�,
 * �����ͺ��̽��� �����͵��� �̿��Ͽ� �����Ͻ� ������ �����ϴ� ������ �Ѵ�.
 * �����Ͻ� ������ ������ ��쿡�� �����Ͻ� �������� �����ϴ� Ŭ������ 
 * ������ �� �� �ִ�.
 */
public class UserManager {
	private static UserManager userMan = new UserManager();
	private UserDAO_ej userDAO;
	private ProjectDAO projDAO;
	private UserAnalysis userAanlysis;

	private UserManager() {
		try {
			userDAO = new UserDAO_ej();
			projDAO = new ProjectDAO();
			userAanlysis = new UserAnalysis(userDAO);
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static UserManager getInstance() {
		return userMan;
	}
	
	public int create(User user) throws SQLException, ExistingUserException {
		if (userDAO.existingUser(user.getUserId()) == true) {
			throw new ExistingUserException(user.getUserId() + "�� �����ϴ� ���̵��Դϴ�.");
		}
		return userDAO.create(user);
	}

	public int update(User user) throws SQLException, UserNotFoundException {
		return userDAO.update(user);
	}	

	public int remove(String userId) throws SQLException, UserNotFoundException {
		return userDAO.remove(userId);
	}

	public User findUser(String userId)
		throws SQLException, UserNotFoundException {
		User user = userDAO.findUser(userId);
		
		if (user == null) {
			throw new UserNotFoundException(userId + "�� �������� �ʴ� ���̵��Դϴ�.");
		}		
		return user;
	}

	public List<User> findUserList() throws SQLException {
			return userDAO.findUserList();
	}
	
	public List<User> findUserList(int currentPage, int countPerPage)
		throws SQLException {
		return userDAO.findUserList(currentPage, countPerPage);
	}

	public boolean login(String userId, String password)
		throws SQLException, UserNotFoundException, PasswordMismatchException {
		User user = findUser(userId);

		if (!user.matchPassword(password)) {
			throw new PasswordMismatchException("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		}
		return true;
	}
	
	public int createProject(Project proj) throws SQLException {
		return projDAO.create(proj);		
	}

	public int updateCommunity(Project proj) throws SQLException {
		return projDAO.update(proj);				
	}
	
	public Project findProject(int project_id) throws SQLException {
		return projDAO.findProject(project_id);
	}
	
	public List<Project> findProjectList(String condition) throws SQLException {
		return projDAO.projectListOrderByCondition(condition);
	}
	
	public List<User> findProjectBackers(int project_id) throws SQLException {
		return projDAO.findUsersOnProject(project_id);
	}

	public UserDAO_ej getUserDAO() {
		return this.userDAO;
	}
}
