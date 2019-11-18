package controller.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import model.Project;
import model.service.ProjectManager;

public class UpdateProjectController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateProjectController.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Project updateProj = new Project(
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
		
		log.debug("Update Project : {}", updateProj);
		
		ProjectManager pm = ProjectManager.getInstance();
		pm.update(updateProj);
		return "redirect:/project/list"; //★프로젝트경로 
				
	}
}
