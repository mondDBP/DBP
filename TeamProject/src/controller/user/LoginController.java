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
			// 모델에 로그인 처리를 위임
			UserManager manager = UserManager.getInstance();
			if(userId.equals("admin1234"))
				manager.Adminlogin(userId, password);
			else
				manager.login(userId, password);
			
			log.debug(userId);
			log.debug(password);
			
			// 세션에 사용자 아이디 저장
			HttpSession session = request.getSession();
            session.setAttribute(UserSessionUtils.USER_SESSION_KEY, userId);
            
            request.setAttribute("curUserId", userId);
            
            return "/user/mainpage";
		} catch (Exception e) {
			/* UserNotFoundException이나 PasswordMismatchException 발생 시
			 * 다시 login form을 사용자에게 전송하고 오류 메세지도 출력
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
