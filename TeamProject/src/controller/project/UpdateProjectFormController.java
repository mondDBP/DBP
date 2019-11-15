package controller.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Project;
import model.service.ProjectManager;

public class UpdateProjectFormController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(UpdateProjectController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int updateId = Integer.parseInt(request.getParameter("project_id"));//String -> int

		log.debug("UpdateForm Request : {}", updateId);

		ProjectManager manager = ProjectManager.getInstance();
		Project proj = manager.findProject(updateId);	// ������Ʈ ���� �˻�
		request.setAttribute("Project", proj);	
		
		HttpSession session = request.getSession();
		//SessionUtils Ŭ���� �ʿ��ϴ� -> import controller.user.UserSessionUtils;??�ϴ� ��������
		if (UserSessionUtils.isLoginUser(request.getParameter("project_id"), session) ||
			UserSessionUtils.isLoginUser("admin", session)) {
			// ���� �α����� ����ڰ� ���� ��� ������̰ų� �������� ��� -> ���� ����
			
			return "/project/updateForm.jsp";   // �˻��� ����� ������ update form���� ���� 
					//�� ���
		}
			// else (���� �Ұ����� ���) ����� ���� ȭ������ ���� �޼����� ����
			request.setAttribute("updateFailed", true);
			request.setAttribute("exception", 
				new IllegalStateException("Ÿ���� ������Ʈ�� ������ �� �����ϴ�."));            
			return "/project/view.jsp";	// ������Ʈ ���� ȭ������ �̵� (forwarding)
	}
}
		
	

