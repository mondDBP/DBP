package controller.project;

import javax.servlet.http.HttpSession;

// 프로젝트 세션이 필요한경우가 많지않아보여서 클래스는 만들긴했지만 다른곳에 사용하지않았음
//ex.장바구니 -기능이 없어서 필요할지 모르겠음
public class ProjectSessionUtils {
	public static final String PROJECT_SESSION_KEY = "project_id";

    /* 현재 로그인한  프로젝트ID를 구함 */
    public static String getLoginProjectID(HttpSession session) {
        String projID = (String)session.getAttribute(PROJECT_SESSION_KEY);
        return projID;
    }

    /* 로그인한 상태인지를 검사 */
    public static boolean hasPRojectLogined(HttpSession session) {
        if (getLoginProjectID(session) != null) {//같은 클래스 내에 있는 메소드
            return true;
        }
        return false;
    }

    /* 현재 로그인한 사용자의 ID가 userId인지 검사 */
    public static boolean isLoginProject(int project_id, HttpSession session) {
        String loginProject = getLoginProjectID(session);
        if (loginProject == null) {
            return false;
        }
        return loginProject.equals(project_id);
    }

}
