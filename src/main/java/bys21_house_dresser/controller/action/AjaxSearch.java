package bys21_house_dresser.controller.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;
import bys21_house_dresser.model.DresserDAO;
import bys21_house_dresser.model.UserDTO;

public class AjaxSearch implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String userName = request.getParameter("userName");
		System.out.println(userName);
		response.getWriter().write(getJSON(userName));
		
		return null;
	}
	
	public String getJSON(String userName) {
		if(userName == null) userName = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		DresserDAO dao = new DresserDAO();
		ArrayList<UserDTO> userList = dao.getAjaxList(userName);
		for(int i = 0; i < userList.size(); i++) {
			result.append("[{\"value2\": \"" + userList.get(i).getUser_name() + "\"},");
			result.append("{\"value2\": \"" + userList.get(i).getUser_email() + "\"},");
			result.append("{\"value2\": \"" + userList.get(i).getUser_phone() + "\"},");
			result.append("{\"value2\": \"" + userList.get(i).getEmail_check() + "\"}],");
		}
		result.append("]}");
		return result.toString();
	}

	
	
}
