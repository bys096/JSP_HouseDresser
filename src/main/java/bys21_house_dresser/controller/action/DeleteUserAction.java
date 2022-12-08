package bys21_house_dresser.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;
import bys21_house_dresser.model.DresserDAO;
import bys21_house_dresser.model.UserAddressDTO;

public class DeleteUserAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		DresserDAO dresserDAO = new DresserDAO();
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("userEmail");
		
		boolean result = dresserDAO.deleteUser(user_email);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(result == true) {
			session.invalidate();
			forward.setPath("/index.jsp");
		} else {
			forward.setPath("/com/yju/2wda/team5/view/etc/error.jsp");
		}
		return forward;
	}

}
