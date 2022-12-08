package bys21_house_dresser.controller.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;
import bys21_house_dresser.model.SearchDTO;

public class GetProductDetailForUpdate implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int record_number = Integer.valueOf(request.getParameter("record_number"));
		ArrayList<SearchDTO> productList = (ArrayList<SearchDTO>)session.getAttribute("productList");
		SearchDTO item = productList.get(record_number);
		session.setAttribute("item", item);
		
//		세션에서 받아오기때문에 dao필요없음
		
		boolean result = true;
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(result == true) {
			
			forward.setPath("/com/yju/2wda/team5/view/dresser/product_update.jsp");	
			
				
		} else {
			forward.setPath("/com/yju/2wda/team5/view/etc/error.jsp");
		}
		return forward;
	}

}
