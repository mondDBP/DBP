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
		Project proj = manager.findProject(updateId);	// 프로젝트 정보 검색
		request.setAttribute("Project", proj);	
		
		HttpSession session = request.getSession();
		//SessionUtils 클래스 필요하다 -> import controller.user.UserSessionUtils;??일단 유저세션
		if (UserSessionUtils.isLoginUser(request.getParameter("project_id"), session) ||
			UserSessionUtils.isLoginUser("admin", session)) {
			// 현재 로그인한 사용자가 수정 대상 사용자이거나 관리자인 경우 -> 수정 가능
			
			return "/project/updateForm.jsp";   // 검색한 사용자 정보를 update form으로 전송 
					//★ 경로
		}
			// else (수정 불가능한 경우) 사용자 보기 화면으로 오류 메세지를 전달
			request.setAttribute("updateFailed", true);
			request.setAttribute("exception", 
				new IllegalStateException("타인의 프로젝트는 수정할 수 없습니다."));            
			return "/project/view.jsp";	// 프로젝트 보기 화면으로 이동 (forwarding)
	}
}
		
	

