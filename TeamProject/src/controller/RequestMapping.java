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
    
 // �� ��û uri�� ���� controller ��ü�� ������ HashMap ����
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// �� uri�� �����Ǵ� controller ��ü�� ���� �� ����
    	mappings.put("/", new ForwardController("main.jsp"));
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
        
        mappings.put("/main/page", new MainController());
        mappings.put("/main/preview", new PreviewListProjectController());
        
     // ����� ���� ���� �� ��û�� ���� ��û ó�� ����
//      mappings.put("/user/update/form", new UpdateUserFormController());
        mappings.put("/user/update/form", new UpdateUserController());
        mappings.put("/user/update", new UpdateUserController());
        mappings.put("/user/delete", new DeleteUserController());
        mappings.put("/user/search", new SearchUserController());//
        
     // ������Ʈ ���� request URI �߰�
        mappings.put("/project/list/latest", new ListProjectFromLatestController());
        mappings.put("/project/list/fundrate", new ListProjectFromFundRateController());
        mappings.put("/project/list/likes", new ListProjectFromLikesController());
        mappings.put("/project/list/result", new SearchProjectController_user());
        mappings.put("/project/view/admin", new AdminViewProjectController());
        mappings.put("/project/view", new ViewProjectController());
        mappings.put("/project/register", new RegisterProjectController());
        mappings.put("/project/successregister", new ForwardController("/project/register/successRegister.jsp"));
        
        mappings.put("/project/delete", new DeleteProjectController());
        mappings.put("/project/list/admin", new AdminListProjectController());
        mappings.put("/project/list", new ListProjectController());
        mappings.put("/project/search/admin", new AdminSearchProjectController());
        
        mappings.put("/amount/graph", new AmountGraphController());
//        mappings.put("/project/create", new CreateCommunityController());
//        mappings.put("/project/update/form", new UpdateCommunityController());
//        mappings.put("/project/update", new UpdateCommunityController());
        
        mappings.put("/user/mainpage", new ForwardController("/main/main.jsp"));//���������� ȭ�� ����
        mappings.put("/user/terms", new ForwardController("/user/register/terms.jsp"));//���Ǿ��ȭ�� ����
        mappings.put("/user/successregister", new ForwardController("/user/register/successRegister.jsp"));//�������� ȸ�����Խ� �ߴ� ȭ�鿬��        
        
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// �־��� uri�� �����Ǵ� controller ��ü�� ã�� ��ȯ
        return mappings.get(uri);
    }
}