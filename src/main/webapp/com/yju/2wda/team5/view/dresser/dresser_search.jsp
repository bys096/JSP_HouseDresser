<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bys21_house_dresser.model.SearchDTO" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bys21_house_dresser.model.PageInfoVO" %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=cssDir%>/search_page10.css?after">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:700|Raleway:500.700">



 <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"> -->
<style>
.tabBox {
  box-shadow: 0px 0px 22px -20px;
  width: 250px;
/*   width: 100%; */
  margin: 40px 25px 0 40px;
  border: 1px solid #f9f9f9;
}
.hideSeekTab {
  cursor: pointer;
  border-bottom: 1px solid #eee;
  width: 250px;
/*   width: 100%; */
  background-color: white;
  text-align: center;
}
.labelBox {
  position: relative;
  display: flex;
  padding: 0 8px 0 16px;
  align-items: center;
  justify-content: space-between;
}
.iconBox {
  position: relative;
  width: 40px;
  height: 40px;
  transform: rotate(-45deg);
  transition: transform .4s;
}
.line {
  margin: auto;
  display: block;
  width: 22px;
  height: 1px;
  background: grey;
  position: absolute;
  top: 20px;
}
.left {
  left: 9px;
  transform: rotate(45deg);
}
.right {
  right: 9px;
  transform: rotate(-45deg);
}
.iconBox.closed {
  transform: rotate(0deg);
}
h3.title {
  text-align: left;
  color: grey;
  font-weight: 200;
}
p.text {
  font-weight: 200;
  color: #1d1d1b;
  display: none;
  padding: 0 16px;
  text-align: left;
  line-height: 1.5;
  opacity: 0;
  transition: opacity .7s;
}
p.text.open {
  opacity: 1;
  display: block;
}

.paging {
	display: flex;
	justify-content: center;
	gap: 2vw;
	position: relative;
	left: 7vw;
	margin-top: 30px;
	margin-bottom: 500px;
	padding: 50px;
}
.top {
	padding-top: 23px;
}







</style>



</head>
<body>

<%
	ArrayList<SearchDTO> searchList = (ArrayList<SearchDTO>)session.getAttribute("searchList");
%>
  <main>
    <section class="tabBox">
  <div class="hideSeekTab">
    <div class="labelBox">
      <h3 class="title">사이즈</h3>
      <div class="iconBox">
        <span class="line left"></span>
        <span class="line right"></span>
      </div>
    </div>
    
    <p class="text"><input type="checkbox">체크박스</p>
  </div>

  <div class="hideSeekTab">
    <div class="labelBox">
      <h3 class="title">성별</h3>
      <div class="iconBox">
        <span class="line left"></span>
        <span class="line right"></span>
      </div>
    </div>
    <p class="text">
    	<a href="./search.be?gender=Woman">여성의류</a>
    </p>
    <p class="text"><a href="./search.be?gender=Man">남성의류</a></p>
    <p class="text"><a href="./search.be?gender=Pub">공용</a></p>
  </div>

  <div class="hideSeekTab">
    <div class="labelBox">
      <h3 class="title">컬러</h3>
      <div class="iconBox">
        <span class="line left"></span>
        <span class="line right"></span>
      </div>
    </div>
    <p class="text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aperiam nesciunt natus fugiat alias similique voluptate dignissimos commodi necessitatibus adipisci neque consequatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aperiam nesciunt natus fugiat alias similique voluptate dignissimos commodi necessitatibus adipisci neque consequatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aperiam nesciunt natus fugiat alias similique voluptate dignissimos commodi necessitatibus adipisci neque consequatur.</p>
  </div>
</section>





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



</main>

 
<div class="paging">
<a href="./search.be?currentPageNo=0">[FIRST]</a>
<% 
	PageInfoVO vo;
	vo = (PageInfoVO)session.getAttribute("vo");
	int currentPageNo = vo.getCurrentPageNo();
   if (currentPageNo > 0) {
%>
      <a href="./search.be?currentPageNo=<%=(currentPageNo-1)%>">[PRE]</a>
<%      
   } else {
%>
      <div>[PRE]</div>
<% 
   }

   for (int i = vo.getStartPageNo(); i < vo.getEndPageNo(); i++) {
      if (i == currentPageNo) {
%>
         <div>[<%=(i+1)%>]</div>
<%
      } else {
%>
         <a href="./search.be?currentPageNo=<%=i%>">[<%=(i+1)%>]</a>
<%
      }
   }
%>
<% 
   if (currentPageNo < vo.getPageCnt() - 1) {
%>
      <a href="./search.be?currentPageNo=<%=(currentPageNo+1)%>">[NXT]</a>
<% 
   } else {
%>
      [NXT]
<%      
   }
%>
<a href="./search.be?currentPageNo=<%=(vo.getPageCnt()-1)%>">[END]</a>

</div> 












<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.0.1/vue.min.js"></script>
<script src="<%=jsDir %>/search_item.js"></script>
<script
			  src="https://code.jquery.com/jquery-3.3.1.min.js"
			  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			  crossorigin="anonymous"></script>
<script>
$(function() {
	  // when a tab is clicked  
	  $('.labelBox').on('click', function() {
	    // if the one you clicked is open,      
	    if ($(this).parent('.hideSeekTab').find('p').hasClass('open')) {
	      $($(this).parent('.hideSeekTab')).find('p').slideToggle().removeClass('open');
	      $($(this).parent('.hideSeekTab')).find('.iconBox').removeClass('closed');
	    } else {
	      // and open the one you clicked
	      $($(this).parent('.hideSeekTab')).find('p').slideToggle().addClass('open');
	      $($(this).parent('.hideSeekTab')).find('.iconBox').addClass('closed');
	    }
	  });
	});
</script>
</body>
</html>