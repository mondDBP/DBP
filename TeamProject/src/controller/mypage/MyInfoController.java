package controller.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Project;
import model.service.UserManager;

public class MyInfoController implements Controller {
	 @Override
	    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
			

		 	//구현 전
			
			// commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
//			request.setAttribute("projList", projList);				
			return "/user/mypage/info.jsp";        
	    }
}