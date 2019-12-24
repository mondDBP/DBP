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
		user = manager.findUser(userId);	// 사용자 정보 검색
		
		
    	request.setAttribute("user", user);		// 사용자 정보 저장				
		return "/Admin/controlUser2.jsp";				// 사용자 보기 화면으로 이동
    }
}
