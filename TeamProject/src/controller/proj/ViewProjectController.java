package controller.proj;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.UserManager;
import model.Project;

public class ViewProjectController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	
    	Project proj = null;
		UserManager manager = UserManager.getInstance();
		int proj_id = Integer.parseInt(request.getParameter("project_id"));
		proj = manager.findProject(proj_id);		// 프로젝트 정보 검색			
		
		request.setAttribute("project", proj);	// 프로젝트 정보 저장				
		return "/project/view.jsp";				// 프로젝트 보기 화면으로 이동
    }
}
