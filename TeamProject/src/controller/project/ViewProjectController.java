package controller.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.ProjectManager;
import model.Project;

public class ViewProjectController implements Controller {
	
	private static final Logger log = LoggerFactory.getLogger(ViewProjectController.class);
	
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	
    	Project proj = null;
		ProjectManager manager = ProjectManager.getInstance();
//		int proj_id = Integer.parseInt(request.getParameter("project_id"));
		
		String proj_title = request.getParameter("title");
		log.debug("������Ʈ ����: " + proj_title);
		
		proj = manager.findProject(proj_title);		// ������Ʈ ���� �˻�
		
		request.setAttribute("project", proj);	// ������Ʈ ���� ����				
		return "/project/view/project.jsp";				// ������Ʈ ���� ȭ������ �̵�
		
    }
}
