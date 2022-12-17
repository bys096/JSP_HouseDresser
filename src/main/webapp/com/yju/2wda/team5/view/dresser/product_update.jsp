<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bys21_house_dresser.model.SearchDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css
">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js
"></script>
<link rel="stylesheet" href="<%=cssDir%>/product_upload2.css?after">
</head>
<body>
<%@include file="/header.jsp" %>
<%
	SearchDTO item = (SearchDTO)session.getAttribute("item");

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
				<form method="post" action="./productUpdate.be" enctype="multipart/form-data">
			<div class="image-wrapper">
  				<div class="box">
    				<div class="js--image-preview"></div>
    				<div class="upload-options">
      					<label>
        					<input type="file" name="i_thumb" class="image-upload" accept="image/*"
        							value="<%=prdImgDir%>/<%=item.getI_file_name() %>"/>
        							<%
        							
        							System.out.println("파일이름확인: " + item.getI_file_name());
        							%>
        							
      					</label>
    				</div>
  				</div>
			</div>
			
			<div class="input-group mb-3">
  				<span class="input-group-text" id="basic-addon2">상품명</span>
  				<input type="text" name="product_name" class="form-control" placeholder="상품명을 입력해주세요" 
  					    aria-label="Recipient's username" aria-describedby="basic-addon2"
  					    value="<%=item.getProduct_name() %>">
			</div>
					
			상품 카테고리<br>
			<select name="gender" class="form-select">
				<option disabled selected>Gender</option>
				<option value="Man">남</option>
				<option value="Woman">여</option>
				<option value="Pub">공통</option>
			</select>
			<!-- <select name="parts">
				<option disabled selected>Parts</option>
				<option value="Top">상의</option>
				<option value="Pants">하의</option>
				<option value="Socks">양말</option>
			</select> -->
			<select name="size" class="form-select">
				<option disabled selected>Size</option>
				<option value="100">100</option>
				<option value="110">110</option>
			</select>
			<select name="color" class="form-select">
				<option disabled selected>Color</option>
				<option value="yellow">yellow</option>
				<option value="red">red</option>
			</select>
			<br>
			
			
			
			<div class="input-group mb-3">
  				<span class="input-group-text">상품 가격</span>
  				<input type="text" name="product_price" class="form-control"
  						aria-label="Amount (to the nearest dollar)"
  						value="<%=item.getProduct_price()%>">
  				<span class="input-group-text">원(₩)</span>
			</div>

			<div class="input-group mb-3">
  				<span class="input-group-text" id="basic-addon2">재고 수량</span>
  				<input type="number" name="product_stock" class="form-control" placeholder="재고 수량을 입력해주세요"
  						aria-label="Recipient's username" aria-describedby="basic-addon2"
  						value="<%=item.getProduct_stock() %>">
			</div>
			<!-- 단일 배송 여부 -->
			<!-- 할인 -->
			
			<!-- 옵션 테이블 미생성 -->
			<!-- 옵션사용 여부:<br>
			<input type="radio" name="optionYN">예
			<input type="radio" name="optionYN">아니오<br>
			
			<label for="option_name">옵션명:</label>
			<input type="text" id="option_name" name="option_name"><br> -->
            <textarea name="product_desc" id="editor" placeholder="플레이스홀더">
          		<%=item.getProduct_desc() %>
            </textarea>
			<input type="hidden" name="product_number" value="<%=item.getProduct_number() %>">
		    <input type="submit" value="상품 수정" class="btn btn-dark join">
		</form>
				
		
		
	</section>
</main>
<script type="text/javascript" src="<%=jsDir %>/image_upload.js"></script>

<script src="https://cdn.ckeditor.com/ckeditor5/35.4.0/super-build/ckeditor.js"></script>
<script src="<%=jsDir %>/editor2.js"></script>
</body>
</html>