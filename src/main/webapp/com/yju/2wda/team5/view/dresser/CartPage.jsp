<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bys21_house_dresser.model.SearchDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css
    ">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js
    "></script>
    <style>
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
	ArrayList<SearchDTO> cart = (ArrayList<SearchDTO>) session.getAttribute("cart");
%>
<table class="table align-middle table-hover">
	<thead class="table-dark">
      <tr>
        <th scope="col">#</th>
        <th scope="col"></th>
        <th scope="col">상품명</th>
        <th scope="col">상품가격</th>
        <th scope="col">브랜드</th>
        <th scope="col">수량</th>
      </tr>
    </thead>
    <tbody>


<%
	if(cart != null) {
		for(int i = 0; i < cart.size(); i++) {
%>		
		<tr>
	        <th scope="row"><%=i+1 %></th>
	        <td class="col-md-3">
	        	<div class="img-wrap">
	        		<img src="<%=thumbImgDir%>/<%=cart.get(i).getI_thumbnail_name() %>" class="rounded mx-auto d-block">
        		</div>
        	</td>
	        <td><%=cart.get(i).getProduct_name() %></td>
	        <td><%=cart.get(i).getProduct_price() %></td>
	        <td><%=cart.get(i).getBrand_name() %></td>
	        <td><%=cart.get(i).getQuantity() %></td>
      	</tr>
<%
		}
	}
%>
</tbody>
</table>
	
	<button type="button" class="btn btn-danger" onclick="pay();">바로 결제</button>
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