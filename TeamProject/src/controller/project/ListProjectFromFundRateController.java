package controller.project;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.Project;
import model.service.ProjectManager;

public class ListProjectFromFundRateController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	ProjectManager manager = ProjectManager.getInstance();
		List<Project> projList = manager.findProjectList("fund_rate");
		
		request.setAttribute("projList", projList);				
		return "/project/view/listByFundrate.jsp";
    
    }
    
}
