<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bys21_house_dresser.model.SearchDTO" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cssDir%>/search_page5.css?after">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:700|Raleway:500.700">
</head>
<body>
<%@ include file="/header.jsp" %>
<%

	ArrayList<SearchDTO> searchList = (ArrayList<SearchDTO>)session.getAttribute("searchList");
%>
  <main>
    <div class="condition_nav">
      <div class="category">
        <span>카테고리</span>
        <div><a href="./search.be?gender=Woman">여성의류</a></div>
        <div><a href="./search.be?gender=Man">남성의류</a></div>
        <div><a href="./search.be?gender=Pub">공용</a></div>
      </div>
      <div class="size">
        <span>사이즈</span>
        <div class="top_clo">
          <span>상의</span>
          <div class="size_item">
            <input type="checkbox" name="size_100">
            <label for="size_100">100</label>
          </div>
    
          <div class="size_item">
            <input type="checkbox" name="size_105">
            <label for="size_105">105</label>
          </div>
    
          <div class="size_item">
            <input type="checkbox" name="size_110">
            <label for="size_110">110</label>
          </div>
        </div>
      </div>
      <div>색상</div>
    </div>





<div id="app" class="container">
<%
	for(int i= 0; i < searchList.size(); i++) {
%>
	
		<card data-image="<%=prdImgDir%>/<%=searchList.get(i).getI_file_name()%>"
		onclick="location='<%=dresserViewDir %>/product_detail.jsp?record_number=<%=i %>'">
      		<h1 slot="header"><%=searchList.get(i).getProduct_name()%></h1>
     		 <p slot="content"><%=searchList.get(i).getBrand_name() %></p>
      		<p slot="content"><%=searchList.get(i).getProduct_price() %>원</p>
  		  </card>
	
<%	
	}
%>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.0.1/vue.min.js"></script>
<script src="<%=jsDir %>/search_item.js"></script>

</main>
</body>
</html>