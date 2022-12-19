package bys21_house_dresser.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;

public class DeleteCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		session.setAttribute("cart", null);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/com/yju/2wda/team5/view/dresser/CartPage.jsp");
		return forward;
	}

}
