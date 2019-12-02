package controller.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Project;
import model.service.ProjectManager;

public class MyCreateProjectListController implements Controller {
	 @Override
	    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
			
		 	HttpSession session = request.getSession();
	        String userId = (String) session.getAttribute(UserSessionUtils.USER_SESSION_KEY);
	        
	        request.setAttribute("curUserId", userId);
	        
			
	        ProjectManager manager = ProjectManager.getInstance();
			List<Project> ProjectList = manager.userCreateProjectList(userId);
			// List<User> userList = manager.findUserList(currentPage, countPerPage);
			

			request.setAttribute("projectList", ProjectList);				

			Project project = (Project)request.getAttribute("project");
					
			request.setAttribute("project", project);
			
			int numOfProj = manager.getNumberofProjects();
			
			request.setAttribute("numOfProj", numOfProj);

			return "/user/mypage/project_list.jsp";
	    }
}