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
			

		 	//���� ��
			
			// commList ��ü�� request�� �����Ͽ� Ŀ�´�Ƽ ����Ʈ ȭ������ �̵�(forwarding)
//			request.setAttribute("projList", projList);				
			return "/user/mypage/info.jsp";        
	    }
}