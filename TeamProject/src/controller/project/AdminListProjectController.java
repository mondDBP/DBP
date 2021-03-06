package controller.project;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;

import controller.user.UserSessionUtils;
import model.Project;
import model.User;
import model.service.ProjectManager;

public class AdminListProjectController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

    	/*
    	String currentPageStr = request.getParameter("currentPage");	
		int currentPage = 1;
		if (currentPageStr != null && !currentPageStr.equals("")) {
			currentPage = Integer.parseInt(currentPageStr);
		}		
    	*/
    	
    	ProjectManager manager = ProjectManager.getInstance();
		List<Project> ProjectList = manager.findProList();
		// List<User> userList = manager.findUserList(currentPage, countPerPage);
		

		request.setAttribute("projectList", ProjectList);				

		Project project = (Project)request.getAttribute("project");
				
		request.setAttribute("project", project);

		return "/Admin/controlProject.jsp"; // 프로젝트 리스트 화면으로 이동(forwarding)
	}

}

