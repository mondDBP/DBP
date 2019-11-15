package controller.project;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;

import controller.user.UserSessionUtils;
import model.Project;
import model.service.ProjectManager;

public class ListProjectController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 로그인 여부 확인
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
    	/*
    	String currentPageStr = request.getParameter("currentPage");	
		int currentPage = 1;
		if (currentPageStr != null && !currentPageStr.equals("")) {
			currentPage = Integer.parseInt(currentPageStr);
		}		
    	*/
    	
    	ProjectManager manager = ProjectManager.getInstance();
		List<Project> ProjectList = manager.findProjectList();
		// List<User> userList = manager.findUserList(currentPage, countPerPage);
		
		// userList 객체와 현재 로그인한 사용자 ID를 request에 저장하여 전달
				request.setAttribute("ProjectList", ProjectList);				
				request.setAttribute("curUserId",  //유저세션부분이므로 그대로
						UserSessionUtils.getLoginUserId(request.getSession()));		

		// 프로젝트 리스트 화면으로 이동(forwarding)
		return "/project/list.jsp";     //★경로
	}

}
