package controller.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Project;
import model.service.ProjectManager;

public class SearchProjectController_user implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		String searchPro = request.getParameter("keywd");
		try {
    	ProjectManager manager = ProjectManager.getInstance();		
		HttpSession session = request.getSession();	
		
			List<Project> projList = manager.findProjectList_ByTitle(searchPro);		
			request.setAttribute("projectList", projList);
			request.setAttribute("numOfProj", projList.size());
			return "/project/resultProject.jsp";	
		}catch(Exception e) {
		    request.setAttribute("SearchFailed", true);
			request.setAttribute("exception", e);
			return "/project/resultProject.jsp";
		}
    }
}
