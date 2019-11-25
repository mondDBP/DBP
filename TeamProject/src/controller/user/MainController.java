package controller.user;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.dao.UserDAO;
import model.service.UserManager;

public class MainController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(UserDAO.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		try {
			// 모델에 로그인 처리를 위임
			
			// 세션에 사용자 아이디 저장
			HttpSession session = request.getSession();
            String userId = (String) session.getAttribute(UserSessionUtils.USER_SESSION_KEY);
            
            request.setAttribute("curUserId", userId);
            
            return "/main/main.jsp";
		} catch (Exception e) {
			/* UserNotFoundException이나 PasswordMismatchException 발생 시
			 * 다시 login form을 사용자에게 전송하고 오류 메세지도 출력
			 */
            return "/main/main.jsp";	
		}	
    }
}
