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
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
    main { font-family: 'Noto Sans KR', sans-serif; }
    
    table { 
    	text-align: center;
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
    .imgCell {width: 200px;}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<%
	ArrayList<SearchDTO> productList = (ArrayList<SearchDTO>)session.getAttribute("productList");
	SearchDTO product;
%>
<main>
	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a class="nav-link disabled">상품관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" aria-current="page" href="<%= dresserViewDir%>/product_upload.jsp" >상품 등록</a>
		</li>
		<li class="nav-item">
			<a class="nav-link active" href="./productRead.be">상품 조회</a>
		</li>
	</ul>

	<section>
	
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
		        <th scope="col">게시물 수정</th>
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
			        <td class="col-md-3" class="imgCell">
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
			        	<button onclick="location='./getProductDetail.be?record_number=<%=i %>&from=u'" 
			        			class="btn btn-outline-success">
							게시물 수정
						</button>
					</td>
					<td>
						<button onclick="location='./productDelete.be?product_number=<%=productList.get(i).getProduct_number()%>'"
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