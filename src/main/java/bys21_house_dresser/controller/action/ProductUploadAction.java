package bys21_house_dresser.controller.action;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bys21_house_dresser.controller.Action;
import bys21_house_dresser.controller.ActionForward;
import bys21_house_dresser.model.CategoryDTO;
import bys21_house_dresser.model.DresserDAO;
import bys21_house_dresser.model.ImageDTO;
import bys21_house_dresser.model.ProductDTO;

public class ProductUploadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		DresserDAO dresserDAO = new DresserDAO();
		ProductDTO product = new ProductDTO();
		ImageDTO img = new ImageDTO();
		
		boolean result;
		
		String imgDirPath = "/Users/ban-yeongseo/eclipse_web/bys21_house_dresser/src/main/webapp/com/yju/2wda/team5/image/product_image";
		int maxSize = 1024 * 1024 * 5;
		MultipartRequest multi = new MultipartRequest(request,
													imgDirPath,
													maxSize,
													"UTF-8",
													new DefaultFileRenamePolicy());
		
		
		Enumeration<?> files = multi.getFileNames();
		String element = "";
		String filesystemName = "";
		String originalFileName = "";
		String contentType = "";
		long length = 0;
		
		while(files.hasMoreElements()) {
			element = (String)files.nextElement();
			filesystemName		= multi.getFilesystemName(element);
//			filesystemName = 	new String(filesystemName.getBytes("euc-kr"),"utf-8");
			
			originalFileName	= multi.getOriginalFileName(element);
			contentType			= multi.getContentType(element);
			length				= multi.getFile(element).length();
			
			
			if(element.equals("i_thumb")) {
				// 썸네일 이미지 작성
				String oPath = "/Users/ban-yeongseo/eclipse_web/bys21_house_dresser/src/main/webapp/com/yju/2wda/team5/image/product_image/" + filesystemName; // 원본 경로
				File oFile = new File(oPath);

				int index = oPath.lastIndexOf(".");
				String ext = oPath.substring(index + 1); // 파일 확장자

				String tPath = oFile.getParent() + File.separator + "thumb" + File.separator + "sm_" + oFile.getName(); // 썸네일저장 경로
				File tFile = new File(tPath);

				double ratio = 4; // 이미지 축소 비율

				try {
					BufferedImage oImage = ImageIO.read(oFile); // 원본이미지
					int tWidth = (int) (oImage.getWidth() / ratio); // 생성할 썸네일이미지의 너비
					int tHeight = (int) (oImage.getHeight() / ratio); // 생성할 썸네일이미지의 높이
					
					BufferedImage tImage = new BufferedImage(tWidth, tHeight, BufferedImage.TYPE_3BYTE_BGR); // 썸네일이미지
					Graphics2D graphic = tImage.createGraphics();
					Image image = oImage.getScaledInstance(tWidth, tHeight, Image.SCALE_SMOOTH);
					graphic.drawImage(image, 0, 0, tWidth, tHeight, null);
					graphic.dispose(); // 리소스를 모두 해제

					ImageIO.write(tImage, ext, tFile);
				} catch (IOException e) {
					e.printStackTrace();
				} 
				
				img.setI_thumbnail_name("sm_" + filesystemName);
				img.setI_file_name(filesystemName);
				img.setI_original_name(originalFileName);
				img.setI_file_type(contentType);
				img.setI_file_size(length);
			}
			
			
				
		}

		HttpSession session = request.getSession();
		String userEmail = session.getAttribute("userEmail").toString();			// 세션으로 부터 판매자이메일 얻기
		product.setUser_email(userEmail);
		product.setProduct_name(multi.getParameter("product_name"));
		product.setProduct_price(Integer.parseInt(multi.getParameter("product_price")));
		product.setProduct_stock(Integer.parseInt(multi.getParameter("product_stock")));
		product.setProdocut_desc(multi.getParameter("product_desc"));
		product.setProduct_hits(0);
		product.setGender(multi.getParameter("gender"));
		result = dresserDAO.productUpload(product);
		
//		category.setCategory_name(multi.getParameter("gender"));
//		result = dresserDAO.categoryUpload(category);
		
		
//		img.setProduct_number(category.getProduct_number());
		result = dresserDAO.imageUpload(img);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(result == true) {
			forward.setPath("/index.jsp");
		} else {
			forward.setPath("/com/yju/2wda/team5/view/etc/error.jsp");
		}
		
		
		return forward;
	}

}
