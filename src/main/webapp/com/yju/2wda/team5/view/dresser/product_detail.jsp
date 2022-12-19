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
  @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
    .detail-content, .detail-info { font-family: 'Noto Sans KR', sans-serif; }
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
  
    .right-desc h2 {
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
      width: 650px;
    }
    .detail-info-wrap img {
      width: 100%;
      box-sizing: border-box;
    }
    .detail-info-wrap {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-top: 200px;
    } 
	.detail-content button {
		width: 270px;
		height: 60px;
	}
	.btnGroup {
		display: flex;
		justify-content: center;
	 }
	
	#cartBtn {
		margin-right: 1vw;
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
	<div class="detail-content">
    <div class="left-desc">
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
          <li>재고: <%=item.getProduct_stock() %></li>
        </ul>
          <input type="hidden" id="stock" value="<%=item.getProduct_stock()%>">
      </div>
  
  
  	  <div>수량선택:
			<input type="number" id="quantity" value="0" class="form-control mb-5">
	  </div>
	  <div class="btnGroup">
      <button type="button" id="cartBtn" class="btn btn-outline-danger" onclick="addCart();">장바구니</button>
      <button type="button" id="payBtn" class="btn btn-danger" onclick="addCart();">바로 결제</button>
	  </div>
    </div>
  </div>


  <div class="detail-info-wrap">
    <div class="detail-info">
 
      
      
      <%
          	if(item.getProduct_desc() != null) {
          %>
            <%=item.getProduct_desc() %>
            
          <%
          	}    
          %>
      
      
      
    </div>
  </div>
<!-- </section> -->
<script>
	let stock = parseInt(document.getElementById('stock').value)
	console.log('재고: ' + stock);
	function addCart() {
		let quantity = parseInt(document.getElementById("quantity").value);
		console.log('수량: ' + quantity);
		if(quantity == 0)
			alert('수량을 선택하지 않으셨습니다');
		else {
			if(stock < quantity) {
				alert('재고가 부족합니다');
			}
			else
				location='./addCart.be?quantity=' + quantity;
		}
	}
</script>

</body>
</html>