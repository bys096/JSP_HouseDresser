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
<div>
	<main>
		<div class="manage_nav">
		      <span>회원정보 관리</span>
		      <div><a href="./getUserInfo.be">회원정보수정</a></div>
		      <div><a href="#">회원탈퇴</a></div>
		</div>
		<div class="article">
			<form method="post" action="./deleteUser.be">
				<label for="pwd">비밀번호 확인</label><br>
				<input type="password" name="pwd" id="pwd"> 
				<input type="submit" value="회원탈퇴">
			</form>
		</div>
	</main>
</div>
</body>
</html>