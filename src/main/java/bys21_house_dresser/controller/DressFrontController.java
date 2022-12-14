package bys21_house_dresser.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bys21_house_dresser.controller.action.*;
import bys21_house_dresser.model.PageInfoVO;


public class DressFrontController extends HttpServlet implements Servlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html;charset=UTF-8");
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		command = command.substring(command.lastIndexOf("/"));
		
		PageInfoVO vo;
		HttpSession session = request.getSession();
		
		if(session.getAttribute("vo") == null) {
			vo = new PageInfoVO();
			session.setAttribute("vo", vo);
		}
		else {
			vo = (PageInfoVO) session.getAttribute("vo");
		}
		
		ActionForward forward = null;
		Action action = null;
		
		System.out.println("command = " + command);
		
		switch( command ) {
		
		case "/joinUser.be":
			action = new JoinUserAction();
			break;
		case "/login.be":
			action = new LogInAction();
			break;
		case "/logout.be":
			action = new LogOutAction();
			break;
		case "/productUpload.be":
			action = new ProductUploadAction();
			break;
		case "/search.be":
			action = new GetProductListAction();
			break;
		case "/updateUser.be":
			action = new UpdateUserAction();
			break;
		case "/getUserInfo.be":
			action = new GetUserInfoForUserU();
			break;
		case "/deleteUser.be":
			action = new DeleteUserAction();
			break;
		case "/productRead.be":
			action = new GetProductListActionForSeller();
			break;
		case "/productDelete.be":
			action = new DeleteProductBySeller();
			break;
		case "/productDeleteByAdmin.be":
			action = new DeleteProductByAdmin();
			break;
		case "/getProductDetail.be":
			action = new GetProductDetailForUpdate();
			break;
		case "/productUpdate.be":
			action = new ProductUpdateActionForSeller();
			break;
		case "/addCart.be":
			action = new AddCartAction();
			break;
		case "/pay.be":
			action = new PaymentAction();
			break;
		case "/orderHistory.be":
			action = new GetOrderHistoryAction();
			break;
		case "/getUserListByAdmin.be":
			action = new GetUserListForAdmin();
			break;
		case "/updateUserByAdmin.be":
			action = new UpdateUserByAdmin();
			break;
		case "/deleteUserByAdmin.be":
			action = new DeleteUserByAdmin();
			break;
		case "/getProductListByAdmin.be":
			action = new GetProductListByAdmin();
			break;
		case "/OrderHistoryByAdmin.be":
			action = new GetOrderHistoryActionByAdmin();
			break;
		case "/deleteOrderByAdmin.be":
			action = new DeleteOrderHistoryByAdmin();
			break;
		case "/ajaxsearch.be":
			action = new AjaxSearch();
			break;
		case "/redundancyCheck.be":
			action = new EmailRedundancyCheckAction();
			break;
		case "/editor.be":
			action = new Editor();
			break;
		case "/deleteCart.be":
			action = new DeleteCartAction();
			break;
		}
		
		try {
			forward = action.execute(request, response);
			action = null;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect("index.jsp");
				return;
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		else if(forward == null) {
			return;
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
		destroy();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
		destroy();
	}
}
