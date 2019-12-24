package controller.project;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Project;
import model.service.ProjectManager;

public class ListProjectFromFundRateController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
    	HttpSession session = request.getSession();
        String userId = (String) session.getAttribute(UserSessionUtils.USER_SESSION_KEY);
    	request.setAttribute("curUserId", userId);
    	
    	ProjectManager manager = ProjectManager.getInstance();
    	
		List<Project> projList = manager.findProjectList("fund_rate");
		request.setAttribute("projList", projList);
		
		int numOfProj = manager.getNumberofProjects();
		request.setAttribute("numOfProj", numOfProj);
		
		return "/project/view/listByFundrate.jsp";
    
    }
    
}
