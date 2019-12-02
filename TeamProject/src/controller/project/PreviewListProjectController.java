package controller.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Project;
import model.service.ProjectManager;

public class PreviewListProjectController implements Controller {
	
	 @Override
	    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
			
	    	ProjectManager manager = ProjectManager.getInstance();
			List<Project> projListByFundrate = manager.findProjectList("fund_rate");
			List<Project> projListByLatest = manager.findProjectList("start_date");
			List<Project> projListByLikes = manager.findProjectList("likes");
			
			request.setAttribute("projListByFundrate", projListByFundrate);
			request.setAttribute("projListByLatest", projListByLatest);	
			request.setAttribute("projListByLikes", projListByLikes);
			
			return "/main/preview.jsp";
	    
	    }

}