package controller.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Card;
import model.Project;
import model.Reward_option;
import model.User;
import model.dao.CardDAO;
import model.dao.Reward_optionDAO;
import model.service.ProjectManager;
import model.service.UserManager;

public class BackProjectController implements Controller {
	
	private static final Logger log = LoggerFactory.getLogger(BackProjectController.class);
	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// ����� ���� 
		HttpSession session = request.getSession();
        String userId = (String) session.getAttribute(UserSessionUtils.USER_SESSION_KEY);
        
        UserManager userMan = UserManager.getInstance();
        User user = userMan.findUser(userId);
        
        log.debug(userId);
        //log.debug(String.valueOf(user.getUser_id_pk_seq()));
        
		
        // ������Ʈ ���� 
        ProjectManager projMan = ProjectManager.getInstance();
        String proj_title = request.getParameter("title");
        
        Project proj = projMan.findProject(proj_title);
        
        log.debug(String.valueOf(proj.getProject_id()));
        
        // ������ �ɼ� 
        Reward_optionDAO rewardOpt = new Reward_optionDAO();
        List<Reward_option> rewardOptList = rewardOpt.findReward_optionListbyProject(proj.getProject_id());
        
        log.debug(rewardOptList.get(0).getDescription());
        
        // ī�� ����
//        CardDAO cardDao = new CardDAO();
//        List<Card> card = cardDao.findCardListById(userId);
//        
//        log.debug(card.get(0).getCard_company());
        
        // ���� �� 
        request.setAttribute("curUserId", userId);
        request.setAttribute("project", proj);
        request.setAttribute("rewardOptList", rewardOptList);
        request.setAttribute("user", user);
//        request.setAttribute("card", card);
        
        return "/project/back/backingForm.jsp";
	}

}