package bys21_house_dresser.controller.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;
import bys21_house_dresser.model.DresserDAO;
import bys21_house_dresser.model.UserDTO;

public class EmailRedundancyCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String userEmail = request.getParameter("userEmail");
		System.out.println(userEmail);
		response.getWriter().write(getJSON(userEmail));
		return null;
	}
	
	public String getJSON(String userEmail) {
		if(userEmail == null) userEmail = "";
		StringBuffer result = new StringBuffer("");
		DresserDAO dao = new DresserDAO();
		UserDTO emailList = dao.getEmailList(userEmail);
		result.append("{\"result\": \"" + emailList.getUser_email() + "\"}");
		
		return result.toString();
	}

}
