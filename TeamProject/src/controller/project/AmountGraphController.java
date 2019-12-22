package controller.project;

import controller.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import java.util.*;

import controller.user.UserSessionUtils;
import model.Back_Order;
import model.Project;
import model.User;
import model.dao.Back_OrderDAO;
import model.service.BackOrderManager;
import model.service.ProjectManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AmountGraphController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(AmountGraphController.class);
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
    	BackOrderManager backmanager = BackOrderManager.getInstance();

		SimpleDateFormat format1 = new SimpleDateFormat("yy/MM/dd");
				
		Date time = new Date();
				
		String time1 = format1.format(time);	
		log.debug(time1);
//		SimpleDateFormat transFormat = new SimpleDateFormat("yy/MM/dd");

//		Date to = transFormat.parse(time1);

		//List타입으로manager.findbackorder
		//개수 구해서 request에 넣기
		
		List<Back_Order> backList = backmanager.findBackList(time1);
		// 프로젝트 리스트 화면으로 이동(forwarding)
		int result = 0;
		int i =0;
		int amount = 0;
		/*
		 * 
		 * if (projectList != null) {	
	  Iterator<Project> projectIter = projectList.iterator();
	
	  //사용자 리스트를 클라이언트에게 보여주기 위하여 출력.
	  while ( projectIter.hasNext() ) {
		Project pro = (Project)projectIter.next();
		 */
		if(backList != null) {
			  Iterator<Back_Order> backIter = backList.iterator();
			  while ( backIter.hasNext() ) {
				  Back_Order b = (Back_Order)backIter.next();
				  amount += b.getAmount_pledged();
				  result++;
			  }
			log.debug(Integer.toString(amount));
			
			log.debug(Integer.toString(result));
				//request.setAttribute("backList", backList);

			request.setAttribute("result", result);
			request.setAttribute("amount", amount);
		}
		else
			//request.setAttribute("backList", null);
			request.setAttribute("result", result);
			request.setAttribute("amount", amount);
		
		return "/Admin/Graph.jsp";
	}

}
