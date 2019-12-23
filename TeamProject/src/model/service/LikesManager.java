package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Likes;
import model.Project;
import model.dao.LikesDAO;
import model.dao.UserDAO;

public class LikesManager {
	private static LikesManager likesMan = new LikesManager();
	private LikesDAO likesDAO;
	private UserDAO userDAO;
	
	private LikesManager() {//������
		try {
			likesDAO = new LikesDAO();
			userDAO = new UserDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static LikesManager getInstance() {
		return likesMan;
	}
	
	public int create(Likes likes) throws SQLException, ExistingLikesException {//���ƿ� ������ ����Ǵ� �޼ҵ�

		if (likesDAO.existingLikes(likes) == true) { 
			throw new ExistingLikesException("�̹� ���ƿ並 ���� ������Ʈ�Դϴ�.");
		}
		return likesDAO.create(likes);
	}


	public List<Likes> findLikesList(int user_id) throws SQLException {
		return likesDAO.findLikesList(user_id);//����� ���ǿ� ������ ���̵�� seq�� ���� �� �װɷ� ���ƿ� ���� ����Ʈ ��������.
	}

}
