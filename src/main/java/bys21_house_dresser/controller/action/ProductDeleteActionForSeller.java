package bys21_house_dresser.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;
import bys21_house_dresser.model.CategoryDTO;
import bys21_house_dresser.model.DresserDAO;
import bys21_house_dresser.model.ImageDTO;
import bys21_house_dresser.model.ProductDTO;

public class ProductDeleteActionForSeller implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		DresserDAO dresserDAO = new DresserDAO();
		ImageDTO img = new ImageDTO();
		ProductDTO product = new ProductDTO();
		CategoryDTO category = new CategoryDTO();
		
//		매개변수로 상품 번호 받기
		HttpSession session = request.getSession();
		int product_number = Integer.valueOf(request.getParameter("product_number"));
		boolean result = dresserDAO.deleteProduct(product_number);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(result == true) {
			forward.setPath("./productRead.be");
		} else {
			forward.setPath("/com/yju/2wda/team5/view/etc/error.jsp");
		}
		
		return forward;
	}

}
