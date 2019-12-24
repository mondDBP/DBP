package controller.project;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Back_Order;
import model.Project;
import model.Reward_option;
import model.dao.Back_OrderDAO;
import model.dao.Reward_optionDAO;
import model.service.ProjectManager;

public class SuccessBackProjectController implements Controller {
	
	private static final Logger log = LoggerFactory.getLogger(SuccessBackProjectController.class);
	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 사용자 정보 
		HttpSession session = request.getSession();
        String userId = (String) session.getAttribute(UserSessionUtils.USER_SESSION_KEY);
        
        // 프로젝트 정보 
        ProjectManager projMan = ProjectManager.getInstance();
        String proj_title = request.getParameter("title");
        
        Project proj = projMan.findProject(proj_title);
        int projectId = proj.getProject_id();
        
        int money = Integer.parseInt(request.getParameter("amount_pledged"));
        
        // 총 모금액과 모금률 업데이트
        projMan.updateTotalMoney(projectId, money);
        projMan.updateFundRate(projectId);
        
        // 리워드 옵션 후원자 수, 남은 개수 업데이트 
        Reward_optionDAO rewardOpt = new Reward_optionDAO();
		int opt = Integer.parseInt(request.getParameter("option"));
		rewardOpt.updateReWardOption(opt);
        
        // 후원 정보 등록
        Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
        SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyy/MM/dd");
        
        Back_Order backOrder = new Back_Order(
        		userId, projectId, money, opt, fourteen_format.format(date_now),
        		proj.getRest_day(), proj.getFund_rate()>100?1:0, 0);
        
        Back_OrderDAO backOrderDao = new Back_OrderDAO();
        String result = backOrderDao.insertBack_Order(backOrder);
        
        request.setAttribute("result", result);
        
        return "/project/back/success.jsp";
	}

}