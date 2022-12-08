package bys21_house_dresser.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;

public class LogOutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		session.invalidate();
		boolean result = true;
		System.out.println("로그아웃되엇습니다.");
		
		
		
//		boolean result = dresserDAO.joinUser(user, userAddress);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		if(result == true) {
			forward.setPath("/index.jsp");
		} else {
			forward.setPath("/com/yju/2wda/team5/view/etc/error.jsp");
		}
		
		return forward;
		
	}

}
