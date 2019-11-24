package controller.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.ProjectManager;
import model.service.ProjectNotFoundException;
import model.Project;

public class ViewProjectController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			

		ProjectManager manager = ProjectManager.getInstance();
		String projectTitle = request.getParameter("projectTitle");

    	Project project = null;
    	try {
			project = manager.findProject(projectTitle);	// ����� ���� �˻�
		} catch (ProjectNotFoundException e) {				
	        return "redirect:/project/list";
		}	
		
    	request.setAttribute("project", project);		// ����� ���� ����				
		return "/Admin/controlProject2.jsp";				// ����� ���� ȭ������ �̵�
    }
}
