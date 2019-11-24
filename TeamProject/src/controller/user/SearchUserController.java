package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.User;
import model.service.UserManager;

public class SearchUserController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(DeleteUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		String searchId = request.getParameter("userId");
    	log.debug("Search User : {}", searchId);
		try {
    	UserManager manager = UserManager.getInstance();		
		HttpSession session = request.getSession();	
		
			User user = manager.findUser(searchId);				// 사용자 정보 삭제
			request.setAttribute("user", user);
			return "/user/list";		// 사용자 리스트로 이동
		}catch(Exception e) {
		    request.setAttribute("SearchFailed", true);
			request.setAttribute("exception", e);
			return "/user/list";
		}
    }
}