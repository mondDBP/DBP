package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Likes;
import model.Project;
import model.dao.LikesDAO;

public class LikesManager {//프로젝트 존재여부
	private static LikesManager likesMan = new LikesManager();
	private LikesDAO likesDAO;

	private LikesManager() {//생성자
		try {
			likesDAO = new LikesDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static LikesManager getInstance() {
		return likesMan;
	}
	
	public int create(Likes likes) throws SQLException, ExistingUserException {
//		ProjectDAO에 extistingProject 메소드를 생성해야 한다
		if (likesDAO.existingProject(likes.getProject_id()) == true) { 
			throw new ExistingUserException(likes.getProject_id() //ExistingProjectException(프로젝트 사용자 예외 생성)
			+ "는 이미 찜한 프로젝트입니다.");
		}
		return likesDAO.create(likes);
	}

	public int remove(int projID) throws SQLException {
		return likesDAO.remove(projID);
	}

	public List<Project> likesList(int user_id) throws SQLException {
		return likesDAO.likesList(user_id);
	}
	
	public LikesDAO getLikesDAO() {
		return this.likesDAO;
	}
}
