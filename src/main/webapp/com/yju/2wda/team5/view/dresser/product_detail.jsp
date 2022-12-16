<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bys21_house_dresser.model.SearchDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href="<%=cssDir %>/product_detail.css"> --%>


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
      
      padding: 10px;
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
      left: 8%;
      width: 38%;
      
    }
  
    .left-desc {
      width: 560px;
      margin-left: 9.5%;
    }
  
    .detail-content img {
      width: 100%;
      padding: 0px 10%;
      box-sizing: border-box;
    }
  
    .detail-content {
      margin-top: 75px;
      display: flex;
      align-items: stretch;
    }

    .detail-info {
      width: 700px;
      margin-left: 5%;
      
    }
    .detail-info-wrap img {
      width: 100%;
      padding: 0px 10%;
      box-sizing: border-box;
    }
    .detail-info-wrap {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
  </style>
</head>
<body>
<%@ include file="/header.jsp" %>
<%
	ArrayList<SearchDTO> searchList = (ArrayList<SearchDTO>) session.getAttribute("searchList");
	int record_number = Integer.parseInt(request.getParameter("record_number"));
	SearchDTO item = searchList.get(record_number);
	session.setAttribute("viewItem", item);
	SearchDTO nowItem = (SearchDTO) session.getAttribute("viewItem");
	
	
	String desc = item.getProduct_desc();
%>

<%-- <section>
	<div class="article1">
		<div><img src="<%=thumbImgDir %>/<%=item.getI_thumbnail_name() %>"></div>
		<div>상품명: <%=item.getProduct_name() %></div>
		<div>상품가격: <%=item.getProduct_price() %></div>
		<div>브랜드: <%=item.getBrand_name() %></div>
		<div>재고수량: <%=item.getProduct_stock() %></div>
		<!-- 1. ajax로 서버와 통신 2.db에 추가한후 세션에 담기 -->
		<!-- <button onclick="location='./addCart.be'">장바구니 담기</button> -->
		
		<div>수량선택:
			<input type="number" id="quantity" value="0">
		</div>
		<span class="addContainer"
				onclick="addCart();">
				<!-- onclick="location='./addCart.be'" -->
			<i class="fa-solid fa-cart-plus addCart"></i> 장바구니 담기</span>
		<button>바로 결제</button>
		<!-- <button>찜</button> -->
		<div>상품 설명: <%=item.getProduct_desc() %></div>
	</div>
	 --%>
	
	
	
	<div class="detail-content">
    <div class="left-desc">
      <%-- <img src="<%=thumbImgDir %>/<%=item.getI_thumbnail_name() %>"> --%>
   		<img src="<%=prdImgDir %>/<%=item.getI_file_name() %>">
    </div>
  
    <div class="right-desc">
      <div class="brand">
        <span class="brand-icon"><i class="fa-solid fa-tags"></i></span>
        <%=item.getBrand_name() %>
      </div>
  
      <h2><%=item.getProduct_name() %></h2>
      <span class="star">
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
      </span>
  
      <div class="price-group">
        <%=item.getProduct_price() %>원
      </div>
      <div class="info-group">
        <ul>
          <li><span style="font-weight: bold;">1000M</span> 적립예정</li>
          <li>무료배송</li>
        </ul>
      </div>
  
  
  	  <div>수량선택:
			<input type="number" id="quantity" value="0" class="form-control mb-5">
		</div>
      <button type="button" class="btn btn-outline-danger" onclick="addCart();">장바구니</button>
  
      <button type="button" class="btn btn-danger">바로 결제</button>
    </div>
  </div>


  <div class="detail-info-wrap">
    <div class="detail-info">
      <div><img src="https://nimg.lfmall.co.kr/file/product/prd/DL/2022/1500/DLJU2D091BK_04.jpg?2022-09-29T15:55:02.000+09:00"></div>
      <div><img
          src="https://nimg.lfmall.co.kr/file/product/prd/DL/2022/1500/DLJU2D091BK_04.jpg?2022-09-29T15:55:02.000+09:00">
      </div>
      <div><img
          src="https://nimg.lfmall.co.kr/file/product/prd/DL/2022/1500/DLJU2D091BK_04.jpg?2022-09-29T15:55:02.000+09:00">
      </div>
      <div><img
          src="https://nimg.lfmall.co.kr/file/product/prd/DL/2022/1500/DLJU2D091BK_04.jpg?2022-09-29T15:55:02.000+09:00">
      </div>
      
      
      <%=desc %>
      
      
      
    </div>
  </div>
<!-- </section> -->
<script>
	function addCart() {
		let quantity = document.getElementById("quantity").value;
		if(quantity == 0)
			alert('상품 수량이 0개입니다');
		else
			location='./addCart.be?quantity=' + quantity;
		
	}
</script>

</body>
</html>