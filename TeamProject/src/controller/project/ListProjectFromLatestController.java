package controller.project;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.Project;
import model.service.UserManager;

public class ListProjectFromLatestController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	UserManager manager = UserManager.getInstance();
		List<Project> projList = manager.findProjectList("start_date");
		
		// commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
		request.setAttribute("projList", projList);				
		return "/community/list/lastest.jsp";        
    }
}
