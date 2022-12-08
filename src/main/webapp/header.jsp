<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/bys21_house_dresser/com/yju/2wda/team5/css/dresser_header2.css?after" >

<!-- 서치 -->
<link rel="stylesheet" href="<%=cssDir %>/search_bar.css?after">
<link href='https://fonts.googleapis.com/css?family=Scada:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
<link href='http://homepages.uc.edu/~arthurra/resource/font-awesome/font-awesome.css' rel='stylesheet'>
<link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/2.0/css/font-awesome.css'>
</head>
<body>
<%@ include file="/globalData.jsp" %>


<div class='search-out-container' tabindex='1'>
      <div class='search-container' tabindex='1'>
        <input placeholder='search' type='text' id="search" name="search" onclick="keyup();">
        <a class='button'>
          <i class='fa fa-search'></i>
        </a>
      </div>
    </div>






<%
	if(session.isNew()) {
		session.setAttribute("loginState", "logout");
		session.setAttribute("userid", null);
		session.setAttribute("userpw", null);
	}
%>
	<header>
    <div class="top">
<%

	if(session.getAttribute("loginState").equals("login")){
%>
		<%=session.getAttribute("userEmail")%>님 로그인중
		<br>
		<form name="logout" method="post" action="./logout.be">
		  <input type="hidden" name="actionType" value="LOGOUT">
		  <input type="submit" value="로그아웃">
		</form> 
		<a href="./getUserInfo.be">회원정보수정</a>
		<%
		if(session.getAttribute("class").equals("user")) {
%>
			<a href="<%= dresserViewDir%>/product_upload.jsp">상품 게시</a>
<%
		}
%>
<%
	}
	else {
%>
		<a href="<%= dresserViewDir%>/dresser_login.jsp" class="hover-3">로그인</a>
	    <a href="<%= dresserViewDir%>/dress_c.jsp" class="hover-3">회원가입</a>
	    
	    
<%
	}
%>	
	    <a href="#" class="hover-3">고객센터</a>
    
  </div>
  <div class="logo">
    <div><a href="<%=rootDir%>/index.jsp"><img src="<%=imgDir %>/logo2.png" alt="logo"></a></div>
    
  </div>
  
  <nav>
	  <div class="btn-holder">
		<button class="btn btn-4 hover-border-10">
	      <span>Menu1</span>
	    </button>
	    <button class="btn btn-4 hover-border-10">
	      <span>Menu2</span>
	   </button>
	   <button class="btn btn-4 hover-border-10">
	      <span>Menu3</span>
	   </button>
	   <button class="btn btn-4 hover-border-10">
	      <span>Menu4</span>
	   </button>
	   
	   
	   
	   
	   
	   
	   </div>
	   
  </nav>
   <!-- 
    <form method="post" action="./search.be">
    	<input type="search" name="search" placeholder="Search" value="">
    	<input type="submit" value="검색">
   </form>  
    
    -->
   <script>
   document.addEventListener("keyup", function(event) {
	    if (event.keyCode === 13) {
	        location.href='./search.be?search=' + document.getElementById('search').value;
	    }
	});
   </script>
   
   
   
  
  </header>
</body>
</html>