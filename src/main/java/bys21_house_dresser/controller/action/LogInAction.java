package bys21_house_dresser.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;
import bys21_house_dresser.model.DresserDAO;

public class LogInAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		System.out.println("LoginAction 진입");
		
		request.setCharacterEncoding("utf-8");
		DresserDAO dresserDAO = new DresserDAO();
		System.out.println("DAO 인스턴스 생성");
		HttpSession session = request.getSession();
		
		String userEmail = request.getParameter("email");
		String userPWD = request.getParameter("pwd");
		
		
		int daoResult = dresserDAO.login(userEmail, userPWD);
		boolean result = false;
		
		if(daoResult == 1) {
			System.out.println("로그인 성공");
			session.setAttribute("loginState", "login");
			session.setAttribute("userEmail", userEmail);
			session.setAttribute("userPWD", userPWD);
			session.setAttribute("class", "user");
			result = true;
			System.out.println("로그인 in LoginAction");
		} 
		
		
		
		System.out.println("session 결");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(result == true) {
			forward.setPath("/index.jsp");
		} else {
			forward.setPath("/com/yju/2wda/team5/view/dresser/dresser_login.jsp");
		}
		
		
		return forward;
		
	}

}
