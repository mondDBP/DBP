package controller.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Likes;
import model.Project;
import model.dao.LikesDAO;
import model.dao.UserDAO;
import model.service.ExistingLikesException;
import model.service.LikesManager;
import model.service.ProjectManager;
import model.service.UserManager;

public class LikesProjectController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(LikesDAO.class);
	
	 public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		    
		 try {
		 ProjectManager projManager = ProjectManager.getInstance();
		 UserManager userManager = UserManager.getInstance();
		 LikesManager likesManager = LikesManager.getInstance();
		 
		 HttpSession session = request.getSession();
	     String userId = (String) session.getAttribute(UserSessionUtils.USER_SESSION_KEY);
	     
	     Project proj = null;
		 String proj_title = request.getParameter("title");
		 proj = projManager.findProject(proj_title);		// ������Ʈ ���� �˻�
			
		 request.setAttribute("project", proj);	// 
		 int proj_id = 0;
		 int user_id = 0;
		
		 log.debug(String.valueOf(proj_id) + "�Դϴ�.");
		 log.debug(String.valueOf(user_id)+ "�Դϴ�.");
		 
	     //   request.setAttribute("curUserId", userId);   
		 proj_id = 	projManager.projectId(proj_title);//������Ʈ �������� ������Ʈ id�� ������
		 user_id = userManager.userId(userId);//���� ���ǿ� ����Ǿ��ִ� ���̵� �̿��ؼ� user_seq�� ������
		 
		 log.debug(String.valueOf(proj_id) + "�Դϴ�.");
		 log.debug(String.valueOf(user_id)+ "�Դϴ�.");
		 Likes likes = new Likes(user_id, proj_id);
							
		 likesManager.create(likes);
		
		 request.setAttribute("kk", "bye");
		 request.setAttribute("registerFailed", false);
		 return "/project/view/project.jsp";	 
		 }
		 catch(ExistingLikesException e) {
			  request.setAttribute("registerFailed", true);
				request.setAttribute("exception", e);
				 return "/project/view/project.jsp";	 
		 }
	 }
}

