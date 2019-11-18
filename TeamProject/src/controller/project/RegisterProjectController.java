package controller.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
//import model.User;
import model.Project;
import model.service.ProjectManager;
//import model.service.ExistingUserException;

public class RegisterProjectController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(RegisterProjectController.class);

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Project project = new Project( //int�ڷ�����  Integer.parseInt()�� ��ȯ
				Integer.parseInt(request.getParameter("project_id")),
				request.getParameter("category_name"),
				request.getParameter("user_id"),
				request.getParameter("title"),
				request.getParameter("start_date"),
				request.getParameter("image"),
				request.getParameter("description"),
				Integer.parseInt(request.getParameter("goal")),
				Integer.parseInt(request.getParameter("fund_rate")),
				Integer.parseInt(request.getParameter("rest_day")),
				Integer.parseInt(request.getParameter("funding_period")),
				Integer.parseInt(request.getParameter("total_money"))
				);
		
		log.debug("Create Project : {}", project);
		
		try {//ProjectManager Class �������Ѵ�
			ProjectManager manager = ProjectManager.getInstance();
			manager.create(project); 
	        return "redirect:/user/list";	//�ڰ��	// ���� �� ����� ����Ʈ ȭ������ redirect
	        
		}	// ExistingProjectException Class ������ �Ѵ�
		catch (Exception e) {//ExistingProjectException e) {// ���� �߻� �� ������� form���� forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("project", project); //��ü��������
			return "/user/registerForm.jsp"; //�ڰ�� 
		}
				
}
}
