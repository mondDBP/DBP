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
	
	private LikesManager() {//생성자
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
	
	public int create(Likes likes) throws SQLException, ExistingLikesException {//좋아요 누르면 실행되는 메소드

		if (likesDAO.existingLikes(likes) == true) { 
			throw new ExistingLikesException("이미 좋아요를 누른 프로젝트입니다.");
		}
		return likesDAO.create(likes);
	}


	public List<Likes> findLikesList(int user_id) throws SQLException {
		return likesDAO.findLikesList(user_id);//사용자 세션에 저장한 아이디로 seq값 얻어온 후 그걸로 좋아요 누른 리스트 가져오기.
	}

}
