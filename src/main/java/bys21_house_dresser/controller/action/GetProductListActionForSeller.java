package bys21_house_dresser.controller.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;
import bys21_house_dresser.model.DresserDAO;
import bys21_house_dresser.model.ImageDTO;
import bys21_house_dresser.model.ProductDTO;
import bys21_house_dresser.model.SearchDTO;
import bys21_house_dresser.model.UserDTO;

public class GetProductListActionForSeller implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
//		서치 파라미터 받기
		String searchContent = request.getParameter("search");
//		추후에 앞 공백을 제거해주는 기능추가 필요
		
		DresserDAO dresserDAO = new DresserDAO();
		ProductDTO product = new ProductDTO();
		UserDTO user = new UserDTO();
		ImageDTO img = new ImageDTO();
		
		HttpSession session = request.getSession();
		user.setUser_email((String)session.getAttribute("userEmail"));
		
		ArrayList<SearchDTO> productList = dresserDAO.getDressListForSeller(user.getUser_email());
		session.setAttribute("productList", productList);
		
		productList.toString();
		
		boolean result = true;
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(result == true) {
			forward.setPath("/com/yju/2wda/team5/view/dresser/product_read.jsp");
		} else {
			forward.setPath("/com/yju/2wda/team5/view/etc/error.jsp");
		}
		return forward;
	}

}
