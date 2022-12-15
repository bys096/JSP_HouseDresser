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
<script src="https://kit.fontawesome.com/61d64879c5.js" crossorigin="anonymous"></script>


<style>

.info-group {
	margin-top: 21px;
}

.info-group ul li {
	line-height: 28px;
    border-bottom: 1px solid #eee;
    list-style: none;
}
.info-group ul {
	padding-left: 0px;
/* 	color: blue; */
}

.brand {
	font-size: 15px;
	font-weight: bold;
}
.brand-icon {
	color: gray;
}

h2 {
	font-size: 25px;
	line-height: 38px;
}
.star {
	color: #EDF206;
	line-height: 26px;
}
.price-group {
	margin-top: 25px;
	font-size: 30px;
	font-weight: bold;
}

.right-desc {
	position: relative;
	left: 300px;
}
.left-desc {
	width: 500px;
      border: 4px solid red;
      background-color: aqua;
}
img {
	width: 100%;
      padding: 50px 20%;
      box-sizing: border-box;
}
.detail-content {
	margin-top: 25px;
	display: flex;
}
</style>


</head>
<body>
<!-- <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="..." class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
      	<p class="card-text">HDMall</p>
        <h5 class="card-title">제네시스</h5>
        
        
        

        <h5 class="card-title">10000원</h5>
        
        
        <h5 class="card-title">Card title</h5>
        <p class="card-text">상품명: 제네시스</p>
        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
      </div>
    </div>
  </div>
</div> -->

<div class="detail-content">
	<div class="left-desc" style="width: 560px; background-color: red;">
		<img src="https://nimg.lfmall.co.kr/file/product/prd/DL/2022/1500/DLJU2D091BK_04.jpg?2022-09-29T15:55:02.000+09:00">
	</div>



	<div class="right-desc">
		<div class="brand">
			<span class="brand-icon"><i class="fa-solid fa-tags"></i></span>
			브랜드
		</div>
		
		<h2>제네시스</h2>
		<span class="star">
		<i class="fa-solid fa-star"></i>
		<i class="fa-solid fa-star"></i>
		<i class="fa-solid fa-star"></i>
		<i class="fa-solid fa-star"></i>
		<i class="fa-solid fa-star"></i>
		</span>
		
		<div class="price-group">
		
		15000원
		</div>
		<div class="info-group">
			<ul>
				<li><span style="font-weight: bold;">1000M</span> 적립예정</li>
				<li>무료배송</li>
			</ul>
		</div>
		
		<button type="button" class="btn btn-outline-danger">장바구니</button>
		
		<button type="button" class="btn btn-danger">바로 결제</button>
	</div>
</div>



</body>
</html>