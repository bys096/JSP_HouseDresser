<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/bys21_house_dresser/com/yju/2wda/team5/css/dresser_index.css?after">

<title>Insert title here</title>
</head>
<body>
  <%@ include file="./header.jsp" %>
  
  <main>
  	<div class="dynamic">
  		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
  			<div class="carousel-indicators">
  				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  			</div>
  			<div class="carousel-inner">
        		<div class="carousel-item active">
          			<img src="<%=imgDir %>/dy_pic1.jpg" class="d-block w-100" alt="..." width="">
        		</div>
       			<div class="carousel-item">
          			<img src="<%=imgDir %>/dy_pic2.jpg" class="d-block w-100" alt="...">
       			</div>
      		</div>
      		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
        		<span class="visually-hidden">Previous</span>
     		</button>
      		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        		<span class="carousel-control-next-icon" aria-hidden="true"></span>
        		<span class="visually-hidden">Next</span>
      		</button>
    	</div>
  	</div>
	<div class="item_container">
    	<div class="new_item"></div>
    	<div class="remark_brand"></div>
  	</div>
  </main>
  <%@ include file="./footer.jsp" %>
</body>
</html>