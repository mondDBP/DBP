package controller.project;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.Project;
import model.service.ProjectManager;

public class ListProjectFromLatestController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	ProjectManager manager = ProjectManager.getInstance();
    	
		List<Project> projList = manager.findProjectList("start_date");
		request.setAttribute("projList", projList);			
		
		int numOfProj = manager.getNumberofProjects();
		request.setAttribute("numOfProj", numOfProj);
		
		return "/project/view/listByLatest.jsp";        
		
    }
}
