package controller.user;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.dao.UserDAO;
import model.service.UserManager;

public class LoginController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(UserDAO.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		try {
			// �𵨿� �α��� ó���� ����
			UserManager manager = UserManager.getInstance();
			if(userId.equals("admin1234"))
				manager.Adminlogin(userId, password);
			else
				manager.login(userId, password);
			
			log.debug(userId);
			log.debug(password);
			
			// ���ǿ� ����� ���̵� ����
			HttpSession session = request.getSession();
            session.setAttribute(UserSessionUtils.USER_SESSION_KEY, userId);
            
            request.setAttribute("curUserId", userId);
            
            return "/user/mainpage";
		} catch (Exception e) {
			/* UserNotFoundException�̳� PasswordMismatchException �߻� ��
			 * �ٽ� login form�� ����ڿ��� �����ϰ� ���� �޼����� ���
			 */
			request.setAttribute("existId", 1);
			request.setAttribute("existPw", 1);
			
			if (userId == "" || userId == null)
				request.setAttribute("existId", 0);
			if (password == "" || password == null)
				request.setAttribute("existPw", 0);
			
            request.setAttribute("loginFailed", true);
			request.setAttribute("exception", e);
            return "/user/login/login.jsp";	
		}	
    }
}
