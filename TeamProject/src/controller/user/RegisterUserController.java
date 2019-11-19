package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.User;
import model.service.ExistingUserException;
import model.service.UserManager;

public class RegisterUserController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		User user = new User(
			request.getParameter("userId"),
			request.getParameter("password"),
			request.getParameter("name"),
			request.getParameter("phone"),
			request.getParameter("address"),
			request.getParameter("email"),
			request.getParameter("email2"),
			request.getParameter("resid_id"),
			request.getParameter("resid_id2"));

			String[] name = request.getParameterValues("interest");//interest 테이블에 들어갈 checkbox선택 내용
//

			log.debug("Create User : {}", user);

		try {
			UserManager manager = UserManager.getInstance();
			manager.create(user, name);
	        return "/user/successregister";		// 성공 시 사용자 리스트 화면으로 redirect 
	        
		} catch (ExistingUserException e) {		// 예외 발생 시 회원가입 form으로 forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("user", user);
			return "/user/registerForm.jsp";
		}
    }
}
