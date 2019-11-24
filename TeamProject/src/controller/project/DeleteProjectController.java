package controller.project;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Project;
import model.service.ProjectManager;

public class DeleteProjectController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(DeleteProjectController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		String deleteId = request.getParameter("proTitle");
    	log.debug("Delete Project : {}", deleteId);

    	String[] name = request.getParameterValues("check");
    	ProjectManager manager = ProjectManager.getInstance();		
		
    	for(int i = 0; i < name.length ; i++) {
    		if(name[i] != null) {
    			manager.remove(Integer.parseInt(name[i]));
    		}
    	}
    	
    	if(deleteId != null)
    		manager.remove(Integer.parseInt(deleteId));				
			
			
		return "/project/list/admin";	
		
    }
}

/*import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
//import model.User;
import model.Project;
//import model.service.UserManager;
import model.service.ProjectManager;

//import controller.user.UserSessionUtils;
import controller.project.ProjectSessionUtils;

public class DeleteProjectController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(DeleteProjectController.class);

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//������ ������Ʈ ���̵� �޾� deleteId�� ����
		int deleteId = Integer.parseInt(request.getParameter("project_id"));
		log.debug("Delete Project : {}", deleteId);

		//model.service.ProjectManager ����
		ProjectManager projManager = ProjectManager.getInstance();		
		HttpSession session = request.getSession();	
	
		//controller.project UserSessionUtils ���� =>@@������ ���̵��� ���? --> �ϴ� 0000��������
		if ((ProjectSessionUtils.isLoginProject(0000, session) && 	// �α����� ����ڰ� �������̰� 	
			 !(deleteId == 0000)							// ���� ����� �Ϲ� ������� ���, 
			   || 												// �Ǵ� 
			(!ProjectSessionUtils.isLoginProject(0000, session) &&  // �α����� ����ڰ� �����ڰ� �ƴϰ� 
					ProjectSessionUtils.isLoginProject(0000, session)))) { // �α����� ����ڰ� ���� ����� ��� (�ڱ� �ڽ��� ����)
				
			projManager.remove(deleteId);				// ����� ���� ����
			if (ProjectSessionUtils.isLoginProject(0000, session))	// �α����� ����ڰ� ������ 	
				return "redirect:/project/list"; ///user/list";	���	��
//			else  - ������Ʈ ������ �α׾ƿ� �� �ʿ�����Ƿ� �ּ�ó��							
//				return "redirect:/user/logout";		// logout ó��
		}
		
		//������ �Ұ����� ��� 
		Project project = projManager.findProject(deleteId);//������Ʈ ���� �˻�
		request.setAttribute("project", project);						
		request.setAttribute("deleteFailed", true);
		String msg = (ProjectSessionUtils.isLoginProject(0000, session)) 
				   ? "�ý��� ������ ������ ������ �� �����ϴ�."		
				   : "Ÿ���� ������Ʈ ������ ������ �� �����ϴ�.";													
		request.setAttribute("exception", new IllegalStateException(msg));            
		return "/project/view.jsp";		// ������Ʈ ȭ������ �̵�
	}
}*/