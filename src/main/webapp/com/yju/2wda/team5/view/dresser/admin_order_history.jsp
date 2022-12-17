<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
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
	.img-wrap {
      width: 150px;
      height: 150px;
    }
  
    .img-wrap img {
      width: 100%;
      box-sizing: border-box;
    }
    
    table { text-align: center;}
    
    .imgCell {width: 250px;}
    
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<%
	ArrayList<OrderDTO> adminOrderList = (ArrayList<OrderDTO>) session.getAttribute("adminOrderList");
	OrderDTO order;
%>

	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a class="nav-link disabled">관리자</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" aria-current="page" href="./getUserListByAdmin.be" >회원정보 열람</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="./getProductListByAdmin.be">상품정보 열람</a>
		</li>
		<li class="nav-item">
			<a class="nav-link active" href="./OrderHistoryByAdmin.be">주문내역 열람</a>
		</li>
	</ul>




<table class="table align-middle table-hover">
			<thead class="table-dark" style="table-layout:fixed">
				<tr>
				    <th scope="col">#</th>
        			<th scope="col"  class="imgCell"></th>
					<th scope="col">주문번호</th>
					<th scope="col">결제아이디</th>
					<th scope="col">성명</th>
					
					<th scope="col">상품명</th>
					<th scope="col">상품가격</th>
					<th scope="col">수량</th>
					<th scope="col">배달현황</th>
        			<th scope="col">주문날짜</th>
					<th scope="col">수정</th>
				</tr>
			</thead>
			<tbody>
		<%
		if(adminOrderList != null) {
			for(int i = 0; i < adminOrderList.size(); i++) {
				order = adminOrderList.get(i);
				String deliStr = (order.getDelivery_status().equals("0")) ? "결제완료"
						: (order.getDelivery_status().equals("1")) ? "배송중" : "배송완료";
			
		%>
				<tr>
	        		<th scope="row"><%=i+1 %></th>
	       			<td class="col-md-3 imgCell">
	        			<div class="img-wrap">
		        			<img src="<%=thumbImgDir%>/<%=order.getI_thumbnail_name() %>" class="rounded mx-auto d-block">
	        			</div>
        			</td>
			        <td><%=order.getOrder_number() %></td>
			        <td><%=order.getUser_email() %></td>
			        <td><%=order.getUser_name() %></td>
			        
			        <td><%=order.getProduct_name() %></td>
			        <td><%=order.getProduct_price() %>원</td>
			        <td><%=order.getQuantity() %></td>
			        <td><%=deliStr %></td>
			        <td><%=order.getOrder_date() %></td>
			        <td>
			        	<button onclick="location='./deleteOrderByAdmin.be?order_number=<%=order.getOrder_number() %>'" 
			        			class="btn btn-outline-danger">
							주문내역 삭제
						</button>
					</td>
					<%-- <td><a href="./deleteOrderByAdmin.be?order_number=<%=order.getOrder_number() %>">삭제</a> --%>
				</tr>
		<%
			}
		}
		%>
			
			</tbody>
		</table>
	</body>
</html>