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
			// �𵨿� �α��� ó���� ����
			
			// ���ǿ� ����� ���̵� ����
			HttpSession session = request.getSession();
            String userId = (String) session.getAttribute(UserSessionUtils.USER_SESSION_KEY);
            
            request.setAttribute("curUserId", userId);
            
            return "/main/main.jsp";
		} catch (Exception e) {
			/* UserNotFoundException�̳� PasswordMismatchException �߻� ��
			 * �ٽ� login form�� ����ڿ��� �����ϰ� ���� �޼����� ���
			 */
            return "/main/main.jsp";	
		}	
    }
}
