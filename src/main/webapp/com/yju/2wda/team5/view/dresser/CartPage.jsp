<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bys21_house_dresser.model.SearchDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/header.jsp" %>
<h1>카트 페이지입니다.</h1>
<%
	ArrayList<SearchDTO> cart = (ArrayList<SearchDTO>) session.getAttribute("cart");
%>
<%-- <h2>현재 카트 개수: <%=cart.size() %></h2> --%>
<%
	if(cart != null) {
		for(int i = 0; i < cart.size(); i++) {
%>		
		
		<div><img src="<%=thumbImgDir%>/<%=cart.get(i).getI_thumbnail_name() %>"></div>
		<div>상품이름: <%=cart.get(i).getProduct_name() %></div>
		<div>상품가격: <%=cart.get(i).getProduct_price() %></div>
		<div>브랜드: <%=cart.get(i).getBrand_name() %></div>
		<div>수량:	   <%=cart.get(i).getQuantity() %></div>
<%
		}
	}
%>

	<!-- <button onclick="location='./payPage.jsp'">결제</button> -->
	<button onclick="pay();">결제</button>
<script>
	function pay() {
		if(<%=cart == null %>)
			alert('장바구니가 비어있습니다');
		else
			location='./payPage.jsp';
	}
</script>

</body>
</html>