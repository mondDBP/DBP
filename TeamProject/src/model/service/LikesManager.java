package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Likes;
import model.Project;
import model.dao.LikesDAO;

public class LikesManager {//������Ʈ ���翩��
	private static LikesManager likesMan = new LikesManager();
	private LikesDAO likesDAO;

	private LikesManager() {//������
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
//		ProjectDAO�� extistingProject �޼ҵ带 �����ؾ� �Ѵ�
		if (likesDAO.existingProject(likes.getProject_id()) == true) { 
			throw new ExistingUserException(likes.getProject_id() //ExistingProjectException(������Ʈ ����� ���� ����)
			+ "�� �̹� ���� ������Ʈ�Դϴ�.");
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
