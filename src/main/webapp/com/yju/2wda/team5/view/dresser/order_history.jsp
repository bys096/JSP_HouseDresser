<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	page import="java.util.ArrayList" %>
<%@ page import="bys21_house_dresser.model.OrderDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/header.jsp" %>
<%
	ArrayList<OrderDTO> orderList = (ArrayList<OrderDTO>) session.getAttribute("orderList");
	OrderDTO order;
%>
<h1>주문내역 페이지입니다</h1>

<%
	for(int i = 0; i < orderList.size(); i++) {
		order = orderList.get(i);
%>
	<div>상품이름: <%=order.getProduct_name() %></div>
	<div>상품가격: <%=order.getProduct_price() %></div>
	<div>수량: <%=order.getQuantity() %></div>
<%
	}
%>
</body>
</html>