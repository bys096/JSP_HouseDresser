package bys21_house_dresser.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;
import bys21_house_dresser.model.*;

public class JoinUserAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		DresserDAO dresserDAO = new DresserDAO();
		UserDTO user = new UserDTO();
		UserAddressDTO userAddress = new UserAddressDTO();
		
		user.setUser_email(request.getParameter("email"));
		user.setUser_pwd(request.getParameter("pwd"));
		user.setUser_name(request.getParameter("name"));
		user.setUser_phone(request.getParameter("phone"));
		user.setUser_class(request.getParameter("class"));
		if(request.getParameter("email_check") != null)
			user.setEmail_check(request.getParameter("email_check"));
		
		user.setBrand_name(request.getParameter("brand_name"));
		userAddress.setUser_email(user.getUser_email());
		userAddress.setUser_zip(request.getParameter("zip"));
		userAddress.setUser_address1(request.getParameter("address1"));
		userAddress.setUser_address2(request.getParameter("address2"));
		
		boolean result = dresserDAO.joinUser(user, userAddress);
		
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
