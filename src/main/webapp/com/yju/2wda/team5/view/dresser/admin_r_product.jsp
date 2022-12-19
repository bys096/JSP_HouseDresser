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

<%-- <link rel="stylesheet" href="<%=cssDir%>/admin.css?after"> --%>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
    .nav-tabs, table { font-family: 'Noto Sans KR', sans-serif; }
    table {
      margin-top: 55px;
    }
	.img-wrap {
      width: 150px;
      height: 150px;
    }
  
    .img-wrap img {
      width: 100%;
      box-sizing: border-box;
    }
    
    table { text-align: center; }
    
    .imgCell { width: 250px; }
</style>
</head>
<body>

<%
	ArrayList<SearchDTO> productList = (ArrayList<SearchDTO>)session.getAttribute("adminProductList");
	SearchDTO product;
%>
<%@ include file="/header.jsp" %>
<main>

	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a class="nav-link disabled">관리자</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" aria-current="page" href="./getUserListByAdmin.be" >회원정보 열람</a>
		</li>
		<li class="nav-item">
			<a class="nav-link active" href="./getProductListByAdmin.be">상품정보 열람</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="./OrderHistoryByAdmin.be">주문내역 열람</a>
		</li>
	</ul>
	<section>
<%-- 	<%
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
	
	 --%>
	 
	 		<table class="table align-middle table-hover">
			<thead class="table-dark">
		      <tr>
		        <th scope="col">#</th>
		        <th scope="col" class="imgCell"></th>
		        <th scope="col">상품번호</th>
		        <th scope="col">상품명</th>
		        <th scope="col">상품가격</th>
		        <th scope="col">재고량</th>
		        <th scope="col">상품 게시일</th>
		        <th scope="col">게시물 삭제</th>
		      </tr>
	    	</thead>
    		<tbody>
<%
			if(productList != null) {
				for(int i = 0; i < productList.size(); i++) {
					product = productList.get(i);
%>
				<tr>
			        <th scope="row"><%=i+1 %></th>
			        <td class="col-md-3 imgCell">
			        	<div class="img-wrap">
			        		<img src="<%=thumbImgDir%>/<%=product.getI_thumbnail_name() %>" class="rounded mx-auto d-block">
		        		</div>
		        	</td>
			        <td><%=product.getProduct_number() %></td>
			        <td><%=product.getProduct_name() %></td>
			        <td><%=product.getProduct_price() %>원</td>
			        <td><%=product.getProduct_stock() %></td>
			        <td><%=product.getProduct_regdate() %></td>
					<td>
						<button onclick="location='./productDeleteByAdmin.be?product_number=<%=productList.get(i).getProduct_number()%>'"
								class="btn btn-outline-danger">
								게시물 삭제
						</button>
		      		</td>
		      	</tr>
<%
				}
			}
%>
</tbody>
</table>
	
	</section>
</main>
</body>
</html>