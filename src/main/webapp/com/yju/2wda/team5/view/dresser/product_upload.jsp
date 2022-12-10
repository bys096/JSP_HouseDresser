<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/header.jsp" %>

<h2>상품 등록</h2>

<main>
	<div class="manage_nav">
	      <span>상품 관리</span>
	      <div><a href="<%= dresserViewDir%>/product_upload.jsp">상품 등록</a></div>
	      <div><a href="./productRead.be">상품 조회</a></div>
	      <div><a href="#">상품 노출 관리</a></div>
	      <div><a href="#">상품 카테고리 등록 관리</a></div>
	</div>

	<section>
		<form method="post" action="./productUpload.be" enctype="multipart/form-data">
			상품 대표 이미지:
			<br><input type="file" name="i_thumb">
			
			<label for="product_name">상품명:</label>
			<input type="text" id="product_name" name="product_name"><br>
		
			상품 카테고리<br>
		 
			<select name="gender">
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
			<select name="size">
				<option disabled selected>Size</option>
				<option value="100">100</option>
				<option value="110">110</option>
			</select>
			<select name="color">
				<option disabled selected>Color</option>
				<option value="yellow">yellow</option>
				<option value="red">red</option>
			</select>
			<br>
			
			<label for="product_price">상품가격:</label>
			<input type="text" id="product_price" name="product_price"><br>
			
			<label for="product_stock">재고량:</label>
			<input type="text" id="product_stock" name="product_stock"><br>
				
			<!-- 단일 배송 여부 -->
			<!-- 할인 -->
			
			<!-- 옵션 테이블 미생성 -->
			<!-- 옵션사용 여부:<br>
			<input type="radio" name="optionYN">예
			<input type="radio" name="optionYN">아니오<br>
			
			<label for="option_name">옵션명:</label>
			<input type="text" id="option_name" name="option_name"><br> -->
			
			<br>상품 상세 사진 : <input type="file" name="upoload"><br>
			상품 설명:
			<textarea name="product_desc"></textarea><br>
				
			<input type="submit" value="상품 등록">	
		
		</form>
	</section>
</main>
</body>
</html>