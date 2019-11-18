package controller.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Project;
import model.service.LikesManager;

public class MyLikesController implements Controller {
	 @Override
	    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
			
	    	LikesManager manager = LikesManager.getInstance();
			List<Project> projList = manager.likesList(Integer.parseInt(request.getParameter("user_id")));
			
			// commList ��ü�� request�� �����Ͽ� Ŀ�´�Ƽ ����Ʈ ȭ������ �̵�(forwarding)
			request.setAttribute("projList", projList);				
			return "/user/mypage/likes.jsp";       
			
	    }
}