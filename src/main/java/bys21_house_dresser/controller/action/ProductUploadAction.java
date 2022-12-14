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
		
		
		
		if(multi.getFilesystemName("i_thumb") != null) {
			while(files.hasMoreElements()) {
				element = (String)files.nextElement();
				filesystemName		= multi.getFilesystemName(element);
	//			filesystemName = 	new String(filesystemName.getBytes("euc-kr"),"utf-8");
				originalFileName	= multi.getOriginalFileName(element);
				contentType			= multi.getContentType(element);
				length				= multi.getFile(element).length();
				
				
				if(element.equals("i_thumb")) {
					// ????????? ????????? ??????
					String oPath = "/Users/ban-yeongseo/eclipse_web/bys21_house_dresser/src/main/webapp/com/yju/2wda/team5/image/product_image/" + filesystemName; // ?????? ??????
					File oFile = new File(oPath);
	
					int index = oPath.lastIndexOf(".");
					String ext = oPath.substring(index + 1); // ?????? ?????????
	
					String tPath = oFile.getParent() + File.separator + "thumb" + File.separator + "sm_" + oFile.getName(); // ??????????????? ??????
					File tFile = new File(tPath);
	
					double ratio = 4; // ????????? ?????? ??????
	
					try {
						BufferedImage oImage = ImageIO.read(oFile); // ???????????????
						int tWidth = (int) (oImage.getWidth() / ratio); // ????????? ????????????????????? ??????
						int tHeight = (int) (oImage.getHeight() / ratio); // ????????? ????????????????????? ??????
						
						BufferedImage tImage = new BufferedImage(tWidth, tHeight, BufferedImage.TYPE_3BYTE_BGR); // ??????????????????
						Graphics2D graphic = tImage.createGraphics();
						Image image = oImage.getScaledInstance(tWidth, tHeight, Image.SCALE_SMOOTH);
						graphic.drawImage(image, 0, 0, tWidth, tHeight, null);
						graphic.dispose(); // ???????????? ?????? ??????
	
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
		}

//		System.out.println("????????? ???????????????: " + img.getI_thumbnail_name());
//		System.out.println("????????? ????????????: " + img.getI_file_name());
		
		
		
		
		
		HttpSession session = request.getSession();
		String userEmail = session.getAttribute("userEmail").toString();			// ???????????? ?????? ?????????????????? ??????
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
		
		
		
		result = true;
		
		
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
