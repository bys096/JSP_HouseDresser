<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bys21_house_dresser.model.SearchDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cssDir%>/product_read.css?after">
</head>
<body>
<%@include file="/header.jsp" %>
<h2>상품 조회 페이지입니다.</h2>
<%
	ArrayList<SearchDTO> productList = (ArrayList<SearchDTO>)session.getAttribute("productList");
%>
<main>
	<div class="product_manage_nav">
	      <span>상품 관리</span>
	      <div><a href="<%= dresserViewDir%>/product_upload.jsp">상품 등록</a></div>
	      <div><a href="./productRead.be">상품 조회</a></div>
	      <div><a href="#">상품 노출 관리</a></div>
	      <div><a href="#">상품 카테고리 등록 관리</a></div>
	</div>

	<section>
<%
	for(int i = 0; i < productList.size(); i++) {
		
%>
		<div>
			<div>이미지이름: <%= productList.get(i).getI_thumbnail_name()%></div>
			<img src="<%=prdImgDir%>/<%=productList.get(i).getI_file_name()%>">
			<div><%=productList.get(i).getBrand_name() %></div>
			<div><%=productList.get(i).getProduct_name()%></div>
			<div><%=productList.get(i).getProduct_price() %></div>
			<div><%=productList.get(i).getProduct_hits() %></div>
			<button onclick="location='./productDelete.be?product_number=<%=productList.get(i).getProduct_number() %>'"><span>게시물 삭제</span></button>
			<button onclick="location='./getProductDetail.be?record_number=<%=i %>&from=u'">
				<span>게시물 수정</span>
			</button>
			
		</div>
	
<%
		/* 수정 버튼을 누름() -> 현재 프로덕트의 정보를 읽어옴
		-> 확인버튼 -> category, img, product에 반영 */
	}
%>		
	
	
	</section>
</main>
	
</body>
</html>