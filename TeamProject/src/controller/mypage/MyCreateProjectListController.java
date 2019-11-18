package controller.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Project;
import model.service.ProjectManager;

public class MyCreateProjectListController implements Controller {
	 @Override
	    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
			
		 	ProjectManager manager = ProjectManager.getInstance();
			List<Project> projList = manager.userCreateProjectList(Integer.parseInt(request.getParameter("user_id")));
			
			// commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
			request.setAttribute("projList", projList);				
			return "/user/mypage/project.jsp";       
	    }
}