package controller.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Project;
import model.service.ProjectManager;
//import model.service.ProjectNotFoundException;

public class ViewProjectController_hs implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// �α��� ���� Ȯ��
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";		// login form ��û���� redirect
        }
    	ProjectManager manager = ProjectManager.getInstance();
		int projID =Integer.parseInt(request.getParameter("project_id"));
		
		Project project = null;
		try
		{
			project = manager.findProject(projID);
		}catch(Exception e) { //ProjectNotFoundException������µ� �� �������� �׳� Exception
			return "redirect:/project/list"; //�ڰ��
		}
		
		request.setAttribute("project", project);
		return "/project/view.jsp"; //�ڰ��
	}

}
