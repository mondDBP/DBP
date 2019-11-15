package controller.project;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;

import controller.user.UserSessionUtils;
import model.Project;
import model.service.ProjectManager;

public class ListProjectController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// �α��� ���� Ȯ��
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";		// login form ��û���� redirect
        }
    	/*
    	String currentPageStr = request.getParameter("currentPage");	
		int currentPage = 1;
		if (currentPageStr != null && !currentPageStr.equals("")) {
			currentPage = Integer.parseInt(currentPageStr);
		}		
    	*/
    	
    	ProjectManager manager = ProjectManager.getInstance();
		List<Project> ProjectList = manager.findProjectList();
		// List<User> userList = manager.findUserList(currentPage, countPerPage);
		
		// userList ��ü�� ���� �α����� ����� ID�� request�� �����Ͽ� ����
				request.setAttribute("ProjectList", ProjectList);				
				request.setAttribute("curUserId",  //�������Ǻκ��̹Ƿ� �״��
						UserSessionUtils.getLoginUserId(request.getSession()));		

		// ������Ʈ ����Ʈ ȭ������ �̵�(forwarding)
		return "/project/list.jsp";     //�ڰ��
	}

}
