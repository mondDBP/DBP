package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Project;
import model.dao.ProjectDAO;

public class ProjectManager {//프로젝트 존재여부
	private static ProjectManager proMan = new ProjectManager();
	private ProjectDAO projDAO;
	private ProjectAnalysis projAnalysis; //여기에서 새로생성

	private ProjectManager() {//생성자
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
//		ProjectDAO에 extistingProject 메소드를 생성해야 한다
		if (projDAO.existingProject(proj.getProject_id()) == true) { 
			throw new ExistingUserException(proj.getProject_id() //ExistingProjectException(프로젝트 사용자 예외 생성)
			+ "는 이미 존재하는 프로젝트 입니다.");
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
			throw new UserNotFoundException(projID + "는 존재하지 않는 프로젝트입니다.");
		}		
		return proj;
	}
	//검색조건이 없는 경우 초기값? - "start_date"
	public List<Project> findProjectList() throws SQLException {
		return projDAO.projectListOrderByCondition("start_date");
}
	public List<Project> findProjectList(String condition) throws SQLException {
			System.out.println("검색조건을 입력하세요: ");
			return projDAO.projectListOrderByCondition(condition);
	}
	
	public List<Project> findProjectList(int currentPage, int countPerPage)
		throws SQLException {
		return proMan.findProjectList(currentPage, countPerPage);
	}
//	프로젝트에 로그인을 넣어야하나??? -> 삭제
//	public boolean login(int projID, String user_password)
//		throws SQLException, UserNotFoundException, PasswordMismatchException {
//		Project proj = findProject(projID);
//
//		if (!proj.matchPassword(user_password)) {
//			throw new PasswordMismatchException("비밀번호가 일치하지 않습니다.");
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
