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
		// 로그인 여부 확인
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
    	ProjectManager manager = ProjectManager.getInstance();
		int projID =Integer.parseInt(request.getParameter("project_id"));
		
		Project project = null;
		try
		{
			project = manager.findProject(projID);
		}catch(Exception e) { //ProjectNotFoundException만들었는데 또 에러나서 그냥 Exception
			return "redirect:/project/list"; //★경로
		}
		
		request.setAttribute("project", project);
		return "/project/view.jsp"; //★경로
	}

}
