package bys21_house_dresser.controller.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;
import bys21_house_dresser.model.DresserDAO;
import bys21_house_dresser.model.ProductDTO;
import bys21_house_dresser.model.SearchDTO;
import bys21_house_dresser.model.UserDTO;

public class PaymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		DresserDAO dao = new DresserDAO();
		
		
		HttpSession session = request.getSession();
		String user_email = (String)session.getAttribute("userEmail");
		ArrayList<SearchDTO> cart = (ArrayList<SearchDTO>) session.getAttribute("cart");
		boolean result;
		boolean success = false;
		if(cart != null) {
			SearchDTO cartItem;
			for(int i = 0; i < cart.size(); i++) {
				cartItem = cart.get(i);
				System.out.println("현재카트 product_number: " + cartItem.getProduct_number());
				success = dao.subtractStock(cartItem);
				if(!success) 
					break;
				success = dao.insertOrderHistory(user_email, cartItem);
				if(!success) 
					break;
			}
		}
		
		result = (success == true) ? true : false;
		

		
//		stock 1개 감소 주문량 1증가
			
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(result == true) {
			session.setAttribute("cart", null);
			forward.setPath("./orderHistory.be");
		} else {
			forward.setPath("/com/yju/2wda/team5/view/etc/minus_stock.jsp");
		}
		
		return forward;
	}

}
