package bys21_house_dresser.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bys21_house_dresser.model.DresserDAO;
import bys21_house_dresser.model.UserDTO;

@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String userName = request.getParameter("userName");
		System.out.println(userName);
		response.getWriter().write(getJSON(userName));
		
	}
	


	public String getJSON(String userName) {
		if(userName == null) userName = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		DresserDAO dao = new DresserDAO();
		ArrayList<UserDTO> userList = dao.getAjaxList(userName);
		for(int i = 0; i < userList.size(); i++) {
			result.append("[{\"value\": \"" + userList.get(i).getUser_name() + "\"},");
			result.append("{\"value\": \"" + userList.get(i).getUser_email() + "\"},");
			result.append("{\"value\": \"" + userList.get(i).getUser_phone() + "\"},");
			result.append("{\"value\": \"" + userList.get(i).getEmail_check() + "\"}],");
		}
		result.append("]}");
		return result.toString();
		
		/*
		 * {
		 * "	result":[
		 * 			[	1번째 유저
 *			 			{"value": " userListName "},
 * 			 			{"value": " userListName "},
 * 
 * 					]
 * 
 * 					[	2번째 유저
 * 					]
 * 				]
 * 		   }
		 */
	}

}
