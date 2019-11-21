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
    
    // 각 요청 uri에 대한 controller 객체를 저장할 HashMap 생성
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// 각 uri에 대응되는 controller 객체를 생성 및 저장//
        mappings.put("/", new ForwardController("index.jsp"));
        mappings.put("/user/login/form", new ForwardController("/user/loginForm.jsp"));
        mappings.put("/user/login", new LoginController());
        mappings.put("/user/logout", new LogoutController());
        mappings.put("/user/list", new ListUserController());
        mappings.put("/user/view", new ViewUserController());
        mappings.put("/user/register/form", new ForwardController("/user/registerForm.jsp"));
        mappings.put("/user/register", new RegisterUserController());
        mappings.put("/user/mypage/info", new MyInfoController());
        mappings.put("/user/mypage/project", new MyCreateProjectListController());
        mappings.put("/user/mypage/back", new MyBackOrderListController());
        mappings.put("/user/mypage/likes", new MyLikesController());

        // 사용자 정보 수정 폼 요청과 수정 요청 처리 병합
//      mappings.put("/user/update/form", new UpdateUserFormController());
        mappings.put("/user/update/form", new UpdateUserController());
        mappings.put("/user/update", new UpdateUserController());
        mappings.put("/user/delete", new DeleteUserController());
        
        // 프로젝트 관련 request URI 추가
        mappings.put("/project/list/latest", new ListProjectFromLatestController());
        mappings.put("/project/list/fundrate", new ListProjectFromFundRateController());
        mappings.put("/project/list/likes", new ListProjectFromLikesController());
        mappings.put("/project/view", new ViewProjectController());
        mappings.put("/project/create/form", new ForwardController("/project/creationForm.jsp"));
        
//        mappings.put("/project/create", new CreateCommunityController());
//        mappings.put("/project/update/form", new UpdateCommunityController());
//        mappings.put("/project/update", new UpdateCommunityController());
        
        mappings.put("/user/mainpage", new ForwardController("/user/Mainpage.jsp"));//메인페이지 화면 연결
        mappings.put("/user/terms", new ForwardController("/user/terms.jsp"));//동의약관화면 연결
        mappings.put("/user/successregister", new ForwardController("/user/successRegister.jsp"));//성공적인 회원가입시 뜨는 화면연결
        
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// 주어진 uri에 대응되는 controller 객체를 찾아 반환
        return mappings.get(uri);
    }
}
