package controller.project;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.Project;
import model.service.ProjectManager;

public class ListProjectFromLikesController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	ProjectManager manager = ProjectManager.getInstance();
    	
		List<Project> projList = manager.findProjectList("likes");
		request.setAttribute("projList", projList);
		
		int numOfProj = manager.getNumberofProjects();
		request.setAttribute("numOfProj", numOfProj);
		
		return "/project/view/listBylikes.jsp";
		
    }
}