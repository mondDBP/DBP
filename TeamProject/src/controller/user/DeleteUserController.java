package controller.user;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.User;
import model.service.UserManager;

public class DeleteUserController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(DeleteUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		String deleteId = request.getParameter("userId");
    	log.debug("Delete User : {}", deleteId);

    	UserManager manager = UserManager.getInstance();		
		HttpSession session = request.getSession();	
				
			manager.remove(deleteId);				// 사용자 정보 삭제
			return "/user/list";		// 사용자 리스트로 이동
		
    }
}
