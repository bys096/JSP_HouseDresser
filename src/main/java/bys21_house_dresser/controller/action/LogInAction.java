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
		request.setCharacterEncoding("utf-8");
		DresserDAO dresserDAO = new DresserDAO();
		HttpSession session = request.getSession();
		
		String userEmail = request.getParameter("email");
		String userPWD = request.getParameter("pwd");
		String daoResult = dresserDAO.login(userEmail, userPWD);
		boolean result = false;
		
		if(daoResult.equals("user")) {
			session.setAttribute("loginState", "login");
			session.setAttribute("userEmail", userEmail);
			session.setAttribute("userPWD", userPWD);
			session.setAttribute("class", "user");
			result = true;
		}
		else if(daoResult.equals("seller")) {
			session.setAttribute("loginState", "login");
			session.setAttribute("userEmail", userEmail);
			session.setAttribute("userPWD", userPWD);
			session.setAttribute("class", "seller");
			result = true;
		}
		else if(daoResult.equals("admin")) {
			session.setAttribute("loginState", "login");
			session.setAttribute("userEmail", userEmail);
			session.setAttribute("userPWD", userPWD);
			session.setAttribute("class", "admin");
			result = true;
		}
		
//		카트 세션 생성
//		session.setAttribute("cart", null);
		
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
