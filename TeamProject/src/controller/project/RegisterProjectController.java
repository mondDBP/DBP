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
		Project project = new Project( //int자료형은  Integer.parseInt()로 변환
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
		
		try {//ProjectManager Class 만들어야한다
			ProjectManager manager = ProjectManager.getInstance();
			manager.create(project); 
	        return "redirect:/user/list";	//★경로	// 성공 시 사용자 리스트 화면으로 redirect
	        
		}	// ExistingProjectException Class 만들어야 한다
		catch (Exception e) {//ExistingProjectException e) {// 예외 발생 시 플젝등록 form으로 forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("project", project); //객체참조변수
			return "/user/registerForm.jsp"; //★경로 
		}
				
}
}
