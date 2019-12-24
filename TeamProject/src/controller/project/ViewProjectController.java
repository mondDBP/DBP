package controller.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.ProjectManager;
import model.Project;

public class ViewProjectController implements Controller {
	
	private static final Logger log = LoggerFactory.getLogger(ViewProjectController.class);
	
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	
    	 HttpSession session = request.getSession();
	     String userId = (String) session.getAttribute(UserSessionUtils.USER_SESSION_KEY);

    	Project proj = null;
		ProjectManager manager = ProjectManager.getInstance();
//		int proj_id = Integer.parseInt(request.getParameter("project_id"));
		
		String proj_title = request.getParameter("title");
		log.debug("프로젝트 제목: " + proj_title);
		
		proj = manager.findProject(proj_title);		// 프로젝트 정보 검색

		 request.setAttribute("curUserId", userId);
		request.setAttribute("kk", "hi");
		request.setAttribute("project", proj);	// 프로젝트 정보 저장				
		return "/project/view/project.jsp";				// 프로젝트 보기 화면으로 이동
		
    }
}
