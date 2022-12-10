<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bys21_house_dresser.model.OrderDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/header.jsp" %>

<h1>관리자 주문내역 열람 페이지</h1>
</body>


<%
	ArrayList<OrderDTO> adminOrderList = (ArrayList<OrderDTO>) session.getAttribute("adminOrderList");
	OrderDTO order;
%>

<table border="1">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>결제아이디</th>
					<th>성명</th>
					<th>상품번호</th>
					<th>상품명</th>
					<th>상품가격</th>
					<th>수량</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
		<%
			for(int i = 0; i < adminOrderList.size(); i++) {	
				order = adminOrderList.get(i);
			
		%>
				<tr>
					<td><%=order.getOrder_number() %></td>
					<td><%=order.getUser_email() %></td>
					<td><%=order.getUser_name() %></td>
					<td><%=order.getProduct_number() %></td>
					<td><%=order.getProduct_name() %></td>
					<td><%=order.getProduct_price() %></td>
					<td><%=order.getQuantity() %></td>
					<td><%=order.getUser_zip() %></td>
					<td><%=order.getUser_address1() %></td>
					<td><%=order.getUser_address2() %></td>
					<td><a href="./deleteOrderByAdmin.be?order_number=<%=order.getOrder_number() %>">삭제</a>
				</tr>
		<%
			}
		%>
			
			</tbody>
		</table>
</html>