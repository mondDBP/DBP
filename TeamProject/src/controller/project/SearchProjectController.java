package controller.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.Project;
import model.service.ProjectManager;

public class SearchProjectController implements controller {
	 private static final Logger log = LoggerFactory.getLogger(AdminSearchProjectController.class);

	    @Override
	    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
			String searchPro = request.getParameter("proTitle");
	    	log.debug("Search Project : {}", searchPro);
			try {
	    	ProjectManager manager = ProjectManager.getInstance();		
			HttpSession session = request.getSession();	
			
				Project project = manager.findProject(searchPro);				// 사용자 정보 삭제
				request.setAttribute("project", project);
				return "/project/list/admin";		// 사용자 리스트로 이동
			}catch(Exception e) {
			    request.setAttribute("SearchFailed", true);
				request.setAttribute("exception", e);
				return "/project/list/admin";
			}
	    }
	}
