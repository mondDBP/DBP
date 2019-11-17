package controller.project;

import javax.servlet.http.HttpSession;

// ������Ʈ ������ �ʿ��Ѱ�찡 �����ʾƺ����� Ŭ������ ����������� �ٸ����� ��������ʾ���
//ex.��ٱ��� -����� ��� �ʿ����� �𸣰���
public class ProjectSessionUtils {
	public static final String PROJECT_SESSION_KEY = "project_id";

    /* ���� �α�����  ������ƮID�� ���� */
    public static String getLoginProjectID(HttpSession session) {
        String projID = (String)session.getAttribute(PROJECT_SESSION_KEY);
        return projID;
    }

    /* �α����� ���������� �˻� */
    public static boolean hasPRojectLogined(HttpSession session) {
        if (getLoginProjectID(session) != null) {//���� Ŭ���� ���� �ִ� �޼ҵ�
            return true;
        }
        return false;
    }

    /* ���� �α����� ������� ID�� userId���� �˻� */
    public static boolean isLoginProject(int project_id, HttpSession session) {
        String loginProject = getLoginProjectID(session);
        if (loginProject == null) {
            return false;
        }
        return loginProject.equals(project_id);
    }

}
