package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Project;
import model.dao.ProjectDAO;

public class ProjectManager {//������Ʈ ���翩��
	private static ProjectManager proMan = new ProjectManager();
	private ProjectDAO projDAO;
	private ProjectAnalysis projAnalysis; //���⿡�� ���λ���

	private ProjectManager() {//������
		try {
			projDAO = new ProjectDAO();
			projAnalysis = new ProjectAnalysis(projDAO);
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static ProjectManager getInstance() {
		return proMan;
	}
	
	public int create(Project proj) throws SQLException, ExistingUserException {
//		ProjectDAO�� extistingProject �޼ҵ带 �����ؾ� �Ѵ�
		if (projDAO.existingProject(proj.getProject_id()) == true) { 
			throw new ExistingUserException(proj.getProject_id() //ExistingProjectException(������Ʈ ����� ���� ����)
			+ "�� �̹� �����ϴ� ������Ʈ �Դϴ�.");
		}
		return projDAO.create(proj);
	}

	public int update(Project proj) throws SQLException {
		return projDAO.update(proj);
	}	

	public int remove(int projID) throws SQLException {
		return projDAO.remove(projID);
	}

	public Project findProject(int projID)
		throws SQLException, UserNotFoundException {
		Project proj = projDAO.findProject(projID);
		
		if (proj == null) {
			throw new UserNotFoundException(projID + "�� �������� �ʴ� ������Ʈ�Դϴ�.");
		}		
		return proj;
	}
	//�˻������� ���� ��� �ʱⰪ? - "start_date"
	public List<Project> findProjectList() throws SQLException {
		return projDAO.projectListOrderByCondition("start_date");
}
	public List<Project> findProjectList(String condition) throws SQLException {
			System.out.println("�˻������� �Է��ϼ���: ");
			return projDAO.projectListOrderByCondition(condition);
	}
	
	public List<Project> findProjectList(int currentPage, int countPerPage)
		throws SQLException {
		return proMan.findProjectList(currentPage, countPerPage);
	}
//	������Ʈ�� �α����� �־���ϳ�??? -> ����
//	public boolean login(int projID, String user_password)
//		throws SQLException, UserNotFoundException, PasswordMismatchException {
//		Project proj = findProject(projID);
//
//		if (!proj.matchPassword(user_password)) {
//			throw new PasswordMismatchException("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
//		}
//		return true;
//	}

	public List<Project> recommendProjects(String userId) throws Exception {
		return projAnalysis.recommendProjects(userId);
	}
	
	public ProjectDAO getProjectDAO() {
		return this.projDAO;
	}
}
