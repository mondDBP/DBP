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
		proj = manager.findProject(proj_id);		// ������Ʈ ���� �˻�			
		
		request.setAttribute("project", proj);	// ������Ʈ ���� ����				
		return "/project/view.jsp";				// ������Ʈ ���� ȭ������ �̵�
    }
}
