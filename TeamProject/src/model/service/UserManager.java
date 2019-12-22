package model.service;

import java.sql.SQLException;



import java.util.List;

import model.User;
import model.Admin;
import model.Project;
import model.dao.AdminDAO;
import model.dao.ProjectDAO;
import model.dao.UserDAO;

/**
 * 사용자 관리 API를 사용하는 개발자들이 직접 접근하게 되는 클래스.
 * UserDAO를 이용하여 데이터베이스에 데이터 조작 작업이 가능하도록 하며,
 * 데이터베이스의 데이터들을 이용하여 비지니스 로직을 수행하는 역할을 한다.
 * 비지니스 로직이 복잡한 경우에는 비지니스 로직만을 전담하는 클래스를 
 * 별도로 둘 수 있다.
 */
public class UserManager {
	private static UserManager userMan = new UserManager();
	private UserDAO userDAO;
	private ProjectDAO projDAO;
	private AdminDAO adminDAO;
//	private UserAnalysis userAanlysis;

	private UserManager() {
		try {
			userDAO = new UserDAO();
			projDAO = new ProjectDAO();
			adminDAO = new AdminDAO();
	//		userAanlysis = new UserAnalysis(userDAO);
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static UserManager getInstance() {
		return userMan;
	}
	
	public int create(User user, String[] name) throws SQLException, ExistingUserException {
		if (userDAO.existingUser(user.getUserId()) == true) {
			throw new ExistingUserException(user.getUserId() + "는 존재하는 아이디입니다.");
		}
		return userDAO.create(user, name);
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
			throw new UserNotFoundException(userId + "는 존재하지 않는 아이디입니다.");
		}		
		return user;
	}

	public int userId(String userId) throws SQLException, ExistingLikesException {
		
		return userDAO.findUserIdSeq(userId);
	}
	
	public Admin FindAdmin(String userId)
			throws SQLException, UserNotFoundException {
			Admin admin = adminDAO.findAdmin(userId);
			
			if (admin == null) {
				throw new UserNotFoundException(userId + "는 존재하지 않는 아이디입니다.");
			}		
			return admin;
		}
	
	public List<User> findUserList() throws SQLException {
			return userDAO.findUserList();
	}
	

	/*public List<User> findUserList(int currentPage, int countPerPage)
		throws SQLException {
		return userDAO.findUserList(currentPage, countPerPage);
	}*/

	public boolean login(String userId, String password)
		throws SQLException, UserNotFoundException, PasswordMismatchException {
		User user = findUser(userId);

		if (!user.matchPassword(password)) {
			throw new PasswordMismatchException("비밀번호가 일치하지 않습니다.");
		}
		return true;
	}
	

	public boolean Adminlogin(String userId, String password)
			throws SQLException, UserNotFoundException, PasswordMismatchException {
			Admin admin = FindAdmin(userId);

			if (!admin.matchPassword(password)) {
				throw new PasswordMismatchException("비밀번호가 일치하지 않습니다.");
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

}