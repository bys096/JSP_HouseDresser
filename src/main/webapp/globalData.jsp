<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	static final String rootDir = "/bys21_house_dresser";
	static final String workDir = rootDir + "/com/yju/2wda/team5";
	
	static final String modelDir = workDir + "/model";
	static final String viewDir = workDir + "/view";
	static final String dresserViewDir = viewDir + "/dresser";
	/* static final String contDir = workDir + "/controller";
	
	static final String beerModelDi = modelDir + "/beer";
	static final String beerContDir = contDir + "/beer";
	 */
	static final String etcViewDir = viewDir + "/etc";
	
	// 이미지 디렉터리 정보 추가
	static final String imgDir = workDir + "/image";
	static final String prdImgDir = imgDir + "/product_image";
	static final String thumbImgDir = prdImgDir + "/thumb";
	
	// JS 디렉터리
	static final String jsDir = workDir + "/js";
	
	// CSS 디렉터리
	static final String cssDir = workDir + "/css";
%>
</body>
</html>