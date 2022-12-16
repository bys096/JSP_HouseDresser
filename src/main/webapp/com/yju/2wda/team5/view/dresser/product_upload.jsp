<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%@ include file="/header.jsp" %>

<main>
	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a class="nav-link disabled">상품관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="<%= dresserViewDir%>/product_upload.jsp" >상품 등록</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="./productRead.be">상품 조회</a>
		</li>
	</ul>

	<section>
		<form method="post" action="./productUpload.be" enctype="multipart/form-data">
			<!-- 상품 대표 이미지:
			<br><input type="file" name="i_thumb"> -->
			
			
			<div class="image-wrapper">
  				<div class="box">
    				<div class="js--image-preview"></div>
    				<div class="upload-options">
      					<label>
        					<input type="file" name="i_thumb" class="image-upload" accept="image/*" />
      					</label>
    				</div>
  				</div>
			</div>
			
			
			<div class="input-group mb-3">
  				<span class="input-group-text" id="basic-addon2">상품명</span>
  				<input type="text" name="product_name" class="form-control" placeholder="상품명을 입력해주세요" aria-label="Recipient's username" aria-describedby="basic-addon2">
			</div>
			
			<!-- <label for="product_name">상품명:</label>
			<input type="text" id="product_name" name="product_name"><br> -->
		
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
  				<input type="text" name="product_price" class="form-control" aria-label="Amount (to the nearest dollar)">
  				<span class="input-group-text">원(₩)</span>
			</div>
			
			
			
			<!-- <label for="product_price">상품가격:</label>
			<input type="text" id="product_price" name="product_price"><br> -->
			
			
			
			
			
			<div class="input-group mb-3">
  				<span class="input-group-text" id="basic-addon2">재고 수량</span>
  				<input type="number" name="product_stock" class="form-control" placeholder="재고 수량을 입력해주세요" aria-label="Recipient's username" aria-describedby="basic-addon2">
			</div>
			
			
			
			<!-- <label for="product_stock">재고량:</label>
			<input type="text" id="product_stock" name="product_stock"><br> -->
				
			<!-- 단일 배송 여부 -->
			<!-- 할인 -->
			
			<!-- 옵션 테이블 미생성 -->
			<!-- 옵션사용 여부:<br>
			<input type="radio" name="optionYN">예
			<input type="radio" name="optionYN">아니오<br>
			
			<label for="option_name">옵션명:</label>
			<input type="text" id="option_name" name="option_name"><br> -->
			
			
			
			
			
			
			
         <textarea name="product_desc" id="editor" placeholder="플레이스홀더">
              
          </textarea>
   
   
        
			
			
			
			
			
			
			
			
			
			<!-- br>상품 상세 사진 : <input type="file" name="upoload"><br>
			상품 설명:
			<textarea name="product_desc"></textarea><br> -->
				
			<input type="submit" value="상품 등록" class="btn btn-dark join">
		
		</form>
	</section>
</main>
<script type="text/javascript" src="<%=jsDir %>/image_upload.js"></script>

<script src="https://cdn.ckeditor.com/ckeditor5/35.4.0/super-build/ckeditor.js"></script>
<script src="<%=jsDir %>/editor2.js"></script>
</body>
</html>