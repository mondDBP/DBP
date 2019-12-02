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
		
		// commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
		request.setAttribute("projList", projList);				
		return "/project/view/listBylikes.jsp";
		
    }
}