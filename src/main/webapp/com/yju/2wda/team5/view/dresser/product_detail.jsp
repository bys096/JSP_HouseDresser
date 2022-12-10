<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bys21_house_dresser.model.SearchDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/61d64879c5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=cssDir %>/product_detail.css">
</head>
<body>
<%@ include file="/header.jsp" %>
<%
	ArrayList<SearchDTO> searchList = (ArrayList<SearchDTO>) session.getAttribute("searchList");
	int record_number = Integer.parseInt(request.getParameter("record_number"));
	SearchDTO item = searchList.get(record_number);
	session.setAttribute("viewItem", item);
	SearchDTO nowItem = (SearchDTO) session.getAttribute("viewItem");
%>
<h2>product 제품 상세 페이지입니다. 구매하기 및 장바구니 담기 버튼 구현</h2>

<section>
	<div class="article1">
		<div><img src="<%=thumbImgDir %>/<%=item.getI_thumbnail_name() %>"></div>
		<div>상품명: <%=item.getProduct_name() %></div>
		<div>상품가격: <%=item.getProduct_price() %></div>
		<div>브랜드: <%=item.getBrand_name() %></div>
		<div>재고수량: <%=item.getProduct_stock() %></div>
		<!-- 1. ajax로 서버와 통신 2.db에 추가한후 세션에 담기 -->
		<!-- <button onclick="location='./addCart.be'">장바구니 담기</button> -->
		
		<div>수량선택:
			<input type="number" id="quantity" value="0">
		</div>
		<span class="addContainer"
				onclick="addCart();">
				<!-- onclick="location='./addCart.be'" -->
			<i class="fa-solid fa-cart-plus addCart"></i> 장바구니 담기</span>
		<button>바로 결제</button>
		<!-- <button>찜</button> -->
		<div>상품 설명: <%=item.getProduct_desc() %></div>
	</div>
</section>
<script>
	function addCart() {
		let quantity = document.getElementById("quantity").value;
		if(quantity == 0)
			alert('상품 수량이 0개입니다');
		else
			location='./addCart.be?quantity=' + quantity;
		
	}
</script>

</body>
</html>