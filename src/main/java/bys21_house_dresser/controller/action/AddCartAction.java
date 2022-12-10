package bys21_house_dresser.controller.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;
import bys21_house_dresser.model.SearchDTO;

public class AddCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		/*
		세션에 담겨져 있는 현재 보고있는 detail 상품인 viewItem을 꺼내와서
		list형식인 cart에 추가
		카트에 있는것을 꺼내와서 추가해야함
		*/
		
		
		HttpSession session = request.getSession();
		SearchDTO viewItem = (SearchDTO) session.getAttribute("viewItem");
		viewItem.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		
		
		
		ArrayList<SearchDTO> cart = (ArrayList<SearchDTO>) session.getAttribute("cart");	
		if(cart == null) cart = new ArrayList<SearchDTO>();		// cart에 담겨져있는게 없다면, 새로 생성
		cart.add(viewItem);
		session.setAttribute("cart", cart);
		System.out.println("추가cart: " + cart.get(cart.size()-1).getProduct_name());
		System.out.println("cart size: " + cart.size());
//		boolean result = false;
//		
//		if(cart == null)
//			result = false;
//		result = true;
		
		boolean result = true;
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(result == true) {
			forward.setPath("/com/yju/2wda/team5/view/dresser/CartPage.jsp");
		} else {
			forward.setPath("/com/yju/2wda/team5/view/etc/error.jsp");
		}
		
		return forward;
	}

}
