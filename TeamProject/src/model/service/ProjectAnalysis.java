package model.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import model.Project;
import model.User; //추천코드에서 사용자 아이디 넣는용도
import model.dao.ProjectDAO;


public class ProjectAnalysis {
	private ProjectDAO dao;
	
	//생성자
	public ProjectAnalysis() {}
	public ProjectAnalysis(ProjectDAO dao) {
		super();
		this.dao = dao;
	}
	
	//추천코드  - 사용자 아이디가 들들어가면 프로젝트를 추천
	public List<Project> recommendProjects(String userId) throws Exception {
		
		return null;
	}
	
/* 이건 userAnalysis에서함
 	public List<User> recommendFriends(String userId) throws Exception {
		User thisuser = dao.findUser(userId);
		if (thisuser == null) {
			throw new Exception("invalid user ID!");
		}
		int m1 = userId.indexOf('@');
		if (m1 == -1) return null;
		String mserver1 = thisuser.getEmail().substring(m1);
		
		List<User> friends = new ArrayList<User>();
		
		List<User> userList = dao.findUserList(1, 10000);
		Iterator<User> userIter = userList.iterator();		
		while (userIter.hasNext()) {
			User user = (User)userIter.next();
			
			if (user.getUserId().equals(userId)) continue;
			int m2 = user.getEmail().indexOf('@');
			if (m2 == -1) continue;
			String mserver2 = user.getEmail().substring(m2);

			if (mserver1.equals(mserver2)) 
				friends.add(user);		
		}
		return friends;
 */
}
