<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 카카오 주소 서비스 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/bys21_house_dresser/com/yju/2wda/team5/js/zip.js"></script>
</head>
<body>
<%
	
if( session.isNew()){
	session.setAttribute("loginState", "logout");
	session.setAttribute("userid", null);
	session.setAttribute("userpw", null);
} 
%>

	<%@ include file="/header.jsp" %>
	
	
	<form method="post" action="./joinUser.be">
    <input type="checkbox" id="agree" name="agree" required>
    <label for="agree">약관 모두 동의</label><br>

	가입목적:
	<input type="radio" id="seller" name="class" value="seller">
	<label for="seller">판매자</label>
	<input type="radio" id="user" name="class" value="user">
	<label for="user">일반회원</label><br>
	
    <label for="name">이름:</label>
    <input type="text" id="name" name="name"><br>

    <label for="email">email:</label>
    <input type="email" id="email" name="email"><br>

    <label for="pwd">비밀번호:</label>
    <input type="password" id="pwd" name="pwd"><br>

    <label for="phone">연락처:</label>
    <input type="tel" id="phone" name="phone"><br>
    
    <input type="checkbox" id="email_check" name="email_check" value="y">
    <label for="email_check">이메일 수신 동의</label><br>

	우편번호:<br>
    <input type="text" id="sample6_postcode" placeholder="우편번호" name="zip">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" id="sample6_address" placeholder="주소" name="address1"><br>
	<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address2">
	<input type="text" id="sample6_extraAddress" placeholder="참고항목"><br>
	
	<input type="submit" value="회원가입" >
</form>


  <%@ include file="/footer.jsp" %>
</body>
</html>