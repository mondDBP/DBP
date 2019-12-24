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
		log.debug("������Ʈ ����: " + proj_title);
		
		proj = manager.findProject(proj_title);		// ������Ʈ ���� �˻�

		 request.setAttribute("curUserId", userId);
		request.setAttribute("kk", "hi");
		request.setAttribute("project", proj);	// ������Ʈ ���� ����				
		return "/project/view/project.jsp";				// ������Ʈ ���� ȭ������ �̵�
		
    }
}
