package bys21_house_dresser.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;
import bys21_house_dresser.model.DresserDAO;
import bys21_house_dresser.model.UserDTO;

public class GetUserInfoForUserU implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		DresserDAO dresserDAO = new DresserDAO();
		UserDTO user = new UserDTO();
		HttpSession session = request.getSession();
		user = dresserDAO.getUserInfo((String)session.getAttribute("userEmail"));
		session.setAttribute("userInfo", user);
		boolean result = true;
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(result == true) {
			forward.setPath("/com/yju/2wda/team5/view/dresser/dress_u.jsp");
		} else {
			forward.setPath("/com/yju/2wda/team5/view/etc/error.jsp");
		}
		return forward;
	}

}
