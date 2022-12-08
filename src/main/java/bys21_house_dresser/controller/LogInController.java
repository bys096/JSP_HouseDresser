//package bys21_house_dresser.controller;
//
//import java.io.IOException;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import bys21_house_dresser.model.DresserDAO;
//
//public class LogInController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	
//	public LogInController() {
//		super();
//	}
//	
//	
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		
//		ActionForward forward = null;
//		Action action = null;
//		
//		
//		
//		response.setContentType("application/x-json; charset=UTF-8");
//		String userEmail = request.getParameter("email");
//		String userPWD = request.getParameter("pwd");
//		
//		System.out.println("doget: " + userEmail);
//		System.out.println("doget: " + userPWD);
//		
//		HttpSession session = request.getSession();
//		
//		
//		
//		DresserDAO dresserDAO = new DresserDAO();
//		int daoResult;
//		boolean result=false;
//		daoResult = dresserDAO.login(userEmail, userPWD);
//		if(daoResult == 1) {
//			System.out.println("로그인 성공");
//			session.setAttribute("loginState", "login");
//			session.setAttribute("userEmail", userEmail);
//			session.setAttribute("userPWD", userPWD);
//			result = true;
//		}
//		dresserDAO=null;
//		
//		
//		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/bys21_house_dresser/index.jsp");
//		dispatcher.forward(request, response);
//		
//	}
//	
//}
