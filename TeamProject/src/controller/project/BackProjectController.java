package controller.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Back_Order;
import model.Card;
import model.Project;
import model.Reward_option;
import model.User;
import model.dao.Back_OrderDAO;
import model.dao.CardDAO;
import model.dao.Reward_optionDAO;
import model.service.ExistingUserException;
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

		// ������Ʈ ���� 
		ProjectManager projMan = ProjectManager.getInstance();
		String proj_title = request.getParameter("title");

		Project proj = projMan.findProject(proj_title);
		int projectId = proj.getProject_id();

		// ������ �ɼ� 
		Reward_optionDAO rewardOpt = new Reward_optionDAO();
		List<Reward_option> rewardOptList = rewardOpt.findReward_optionListbyProject(projectId);

		// ī�� ����
		CardDAO cardDao = new CardDAO();
		List<Card> card = cardDao.findCardListById(userId);

		// ���� �� 
		request.setAttribute("curUserId", userId);
		request.setAttribute("project", proj);
		request.setAttribute("rewardOptList", rewardOptList);
		request.setAttribute("user", user);
		request.setAttribute("card", card);

		return "/project/back/backingForm.jsp";
	}

}