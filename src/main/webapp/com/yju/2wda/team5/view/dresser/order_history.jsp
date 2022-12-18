<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	page import="java.util.ArrayList" %>
<%@ page import="bys21_house_dresser.model.OrderDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css
    ">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
    .nav-tabs, table { font-family: 'Noto Sans KR', sans-serif; }
    table {
      margin-top: 55px;
    }
	table { text-align: center;}
	.img-wrap {
      width: 150px;
      height: 150px;
    }
  
    .img-wrap img {
      width: 100%;
      box-sizing: border-box;
    }
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<%
	ArrayList<OrderDTO> orderList = (ArrayList<OrderDTO>) session.getAttribute("orderList");
	OrderDTO order;
	
%>
		<ul class="nav nav-tabs">
			<li class="nav-item">
   				<a class="nav-link active" aria-current="page" href="./orderHistory.be" >주문내역</a>
  			</li>
  			<li class="nav-item">
   				<a class="nav-link" aria-current="page" href="./getUserInfo.be" >회원정보 수정</a>
  			</li>
 			<li class="nav-item">
   				<a class="nav-link" href="<%= dresserViewDir%>/dress_d.jsp">회원 탈퇴</a>
  			</li>
		</ul>
<table class="table align-middle table-hover">
	<thead class="table-dark">
      <tr>
        <th scope="col">#</th>
        <th scope="col"></th>
        <th scope="col">주문번호</th>
        <th scope="col">상품명</th>
        <th scope="col">상품가격</th>
        <th scope="col">수량</th>
        <th scope="col">배달현황</th>
        <th scope="col">주문날짜</th>
      </tr>
    </thead>
    <tbody>
<%
	if(orderList != null) {
		for(int i = 0; i < orderList.size(); i++) {
			order = orderList.get(i);
			String deliStr = (order.getDelivery_status().equals("0")) ? "결제완료"
					: (order.getDelivery_status().equals("1")) ? "배송중" : "배송완료";
			
%>
		<tr>
	        <th scope="row"><%=i+1 %></th>
	        <td class="col-md-3">
	        	<div class="img-wrap">
		        	<img src="<%=thumbImgDir%>/<%=order.getI_thumbnail_name() %>" class="rounded mx-auto d-block">
	        	</div>
        	</td>
	        <td><%=order.getOrder_number() %></td>
	        <td><%=order.getProduct_name() %></td>
	        <td><%=order.getProduct_price() %>원</td>
	        <td><%=order.getQuantity() %></td>
	        <td><%=deliStr %></td>
	        <td><%=order.getOrder_date() %></td>
      	</tr>
<%
		}
	}
%>
</tbody>
</table>

</body>
</html>