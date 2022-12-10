<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bys21_house_dresser.model.SearchDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cssDir%>/admin.css?after">
</head>
<body>

<%
	ArrayList<SearchDTO> productList = (ArrayList<SearchDTO>)session.getAttribute("adminProductList");
%>
<%@ include file="/header.jsp" %>
<h1>관리자 상품 조회 페이지</h1>
<main>

	<div class="admin_nav">
	      <span>관리자 모드</span>
	      <div><a href="./getUserListByAdmin.be">회원정보열람</a></div>
	      <div><a href="./getProductListByAdmin.be">상품정보열람</a></div>
	      <div><a href="./OrderHistoryByAdmin.be">주문내역열람</a></div>
	</div>
	<section>
	<%
	for(int i = 0; i < productList.size(); i++) {
		
%>
		<div>
			<div>이미지이름: <%= productList.get(i).getI_thumbnail_name()%></div>
			<img src="<%=thumbImgDir%>/<%=productList.get(i).getI_thumbnail_name()%>">
			<div><%=productList.get(i).getBrand_name() %></div>
			<div><%=productList.get(i).getProduct_name()%></div>
			<div><%=productList.get(i).getProduct_price() %></div>
			<div><%=productList.get(i).getProduct_hits() %></div>
			
		</div>
			<button onclick="location='./test.be?product_number=<%=productList.get(i).getProduct_number()%>'">게시물 삭제</button>
<%
		/* 수정 버튼을 누름() -> 현재 프로덕트의 정보를 읽어옴
		-> 확인버튼 -> category, img, product에 반영 */
	}
%>		
	
	
	</section>
</main>
</body>
</html>