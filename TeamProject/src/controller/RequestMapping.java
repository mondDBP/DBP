package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.project.*;
import controller.user.*;
import controller.mypage.*;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    // 占쏙옙 占쏙옙청 uri占쏙옙 占쏙옙占쏙옙 controller 占쏙옙체占쏙옙 占쏙옙占쏙옙占쏙옙 HashMap 占쏙옙占쏙옙
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// 占쏙옙 uri占쏙옙 占쏙옙占쏙옙占실댐옙 controller 占쏙옙체占쏙옙 占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙//
        mappings.put("/", new ForwardController("index.jsp"));
        mappings.put("/user/login/form", new ForwardController("/user/loginForm.jsp"));
        mappings.put("/user/login", new LoginController());
        mappings.put("/user/logout", new LogoutController());
        mappings.put("/user/list", new ListUserController());
        mappings.put("/user/view", new ViewUserController());
        mappings.put("/user/register/form", new ForwardController("/user/register/registerForm.jsp"));
        mappings.put("/user/register", new RegisterUserController());
        mappings.put("/user/mypage/info", new MyInfoController());
        mappings.put("/user/mypage/project", new MyCreateProjectListController());
        mappings.put("/user/mypage/back", new MyBackOrderListController());
        mappings.put("/user/mypage/likes", new MyLikesController());
        
        // 占쏙옙占쏙옙占� 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙 占쏙옙청占쏙옙 占쏙옙占쏙옙 占쏙옙청 처占쏙옙 占쏙옙占쏙옙
//      mappings.put("/user/update/form", new UpdateUserFormController());
        mappings.put("/user/update/form", new UpdateUserController());
        mappings.put("/user/update", new UpdateUserController());
        mappings.put("/user/delete", new DeleteUserController());
        mappings.put("/user/search", new SearchUserController());//
        // 占쏙옙占쏙옙占쏙옙트 占쏙옙占쏙옙 request URI 占쌩곤옙
        mappings.put("/project/list/latest", new ListProjectFromLatestController());
        mappings.put("/project/list/fundrate", new ListProjectFromFundRateController());
        mappings.put("/project/list/likes", new ListProjectFromLikesController());
        mappings.put("/project/view/admin", new AdminViewProjectController());
        mappings.put("/project/view", new ViewProjectController());
        mappings.put("/project/register", new RegisterProjectController());
        mappings.put("/project/successregister", new ForwardController("/project/register/successRegister.jsp"));
        
        mappings.put("/project/delete", new DeleteProjectController());
        mappings.put("/project/list/admin", new AdminListProjectController());
        mappings.put("/project/list", new ListProjectController());
        mappings.put("/project/search", new SearchProjectController());
        
        
        mappings.put("/amount/graph", new AmountGraphController());
//        mappings.put("/project/create", new CreateCommunityController());
//        mappings.put("/project/update/form", new UpdateCommunityController());
//        mappings.put("/project/update", new UpdateCommunityController());
        
        mappings.put("/user/mainpage", new ForwardController("/main/main.jsp"));//占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 화占쏙옙 占쏙옙占쏙옙
        mappings.put("/user/terms", new ForwardController("/user/register/terms.jsp"));//占쏙옙占실억옙占싫�占쏙옙 占쏙옙占쏙옙
        mappings.put("/user/successregister", new ForwardController("/user/register/successRegister.jsp"));//占쏙옙占쏙옙占쏙옙占쏙옙 회占쏙옙占쏙옙占쌉쏙옙 占쌩댐옙 화占썽연占쏙옙
        
        
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// 占쌍억옙占쏙옙 uri占쏙옙 占쏙옙占쏙옙占실댐옙 controller 占쏙옙체占쏙옙 찾占쏙옙 占쏙옙환
        return mappings.get(uri);
    }
}
