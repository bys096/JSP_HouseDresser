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
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
    main { font-family: 'Noto Sans KR', sans-serif; }
</style>
</head>
<body>
<%@ include file="/header.jsp" %>

	<main>
		<ul class="nav nav-tabs">
		<li class="nav-item">
   				<a class="nav-link" aria-current="page" href="./orderHistory.be" >주문내역</a>
  			</li>
  <li class="nav-item">
    <a class="nav-link" aria-current="page" href="./getUserInfo.be" >회원정보수정</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="<%= dresserViewDir%>/dress_d.jsp">회원탈퇴</a>
  </li>
</ul>
<div class="article">
			<form method="post" action="./deleteUser.be">
				<label for="pwd">비밀번호 확인</label><br>
				<input type="password" name="pwd" id="pwd"> 
				<input type="submit" value="회원탈퇴">
			</form>
		</div>
	</main>

</body>
</html>