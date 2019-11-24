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
		//삭제할 프로젝트 아이디를 받아 deleteId로 설정
		int deleteId = Integer.parseInt(request.getParameter("project_id"));
		log.debug("Delete Project : {}", deleteId);

		//model.service.ProjectManager 생성
		ProjectManager projManager = ProjectManager.getInstance();		
		HttpSession session = request.getSession();	
	
		//controller.project UserSessionUtils 생성 =>@@관리자 아이디설정 어떻게? --> 일단 0000으로했음
		if ((ProjectSessionUtils.isLoginProject(0000, session) && 	// 로그인한 사용자가 관리자이고 	
			 !(deleteId == 0000)							// 삭제 대상이 일반 사용자인 경우, 
			   || 												// 또는 
			(!ProjectSessionUtils.isLoginProject(0000, session) &&  // 로그인한 사용자가 관리자가 아니고 
					ProjectSessionUtils.isLoginProject(0000, session)))) { // 로그인한 사용자가 삭제 대상인 경우 (자기 자신을 삭제)
				
			projManager.remove(deleteId);				// 사용자 정보 삭제
			if (ProjectSessionUtils.isLoginProject(0000, session))	// 로그인한 사용자가 관리자 	
				return "redirect:/project/list"; ///user/list";	경로	★
//			else  - 프로젝트 삭제후 로그아웃 할 필요없으므로 주석처리							
//				return "redirect:/user/logout";		// logout 처리
		}
		
		//삭제가 불가능한 경우 
		Project project = projManager.findProject(deleteId);//프로젝트 정보 검색
		request.setAttribute("project", project);						
		request.setAttribute("deleteFailed", true);
		String msg = (ProjectSessionUtils.isLoginProject(0000, session)) 
				   ? "시스템 관리자 정보는 삭제할 수 없습니다."		
				   : "타인의 프로젝트 정보는 삭제할 수 없습니다.";													
		request.setAttribute("exception", new IllegalStateException(msg));            
		return "/project/view.jsp";		// 프로젝트 화면으로 이동
	}
}*/