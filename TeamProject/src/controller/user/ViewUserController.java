package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.UserManager;
import model.service.UserNotFoundException;
import model.User;

public class ViewUserController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			

		UserManager manager = UserManager.getInstance();
		String userId = request.getParameter("userId");

    	User user = null;
		user = manager.findUser(userId);	// ����� ���� �˻�
		
		
    	request.setAttribute("user", user);		// ����� ���� ����				
		return "/Admin/controlUser2.jsp";				// ����� ���� ȭ������ �̵�
    }
}
