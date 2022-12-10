<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bys21_house_dresser.model.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/header.jsp" %>
<%
	ArrayList<UserDTO> userList = (ArrayList<UserDTO>) session.getAttribute("userList");
	int userIndex = Integer.parseInt(request.getParameter("userIndex"));
	UserDTO user = userList.get(userIndex);
	
%>
<main>
	<div class="admin_nav">
	      <span>관리자 모드</span>
	      <div><a href="./getUserListByAdmin.be">회원정보열람</a></div>
	      <div><a href="./getProductListByAdmin.be">상품정보열람</a></div>
	      <div><a href="./OrderHistoryByAdmin.be">주문내역열람</a></div>
	</div>
	<section>
		<form method="post" action="./updateUserByAdmin.be">
		    <label for="name">이름:</label>
		    <input type="text" id="name" name="name" value="<%=user.getUser_name() %>"><br>
		
		    <label for="email">email:</label>
		    <input type="email" id="email" name="email" value="<%=user.getUser_email() %>" readonly><br>
		
			<!-- 추후에 비밀번호 확인 추가 -->
		    <label for="pwd">비밀번호:</label>
		    <input type="password" id="pwd" name="pwd"><br>
		
		    <label for="phone">연락처:</label>
		    <input type="tel" id="phone" name="phone" value="<%=user.getUser_phone() %>"><br>
		    
		    <input type="checkbox" id="email_check" name="email_check" value="y">
		    <label for="email_check">이메일 수신 동의</label><br>
		
			우편번호:<br>
		    <input type="text" id="sample6_postcode" placeholder="우편번호" name="zip" value=<%=user.getUser_zip() %>>
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" placeholder="주소" name="address1" value=<%=user.getUser_address1() %>><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소" name=address2 value=<%=user.getUser_address2() %>>
			<input type="text" id="sample6_extraAddress" placeholder="참고항목"><br>
			
			<label for="brand_name">브랜드명:</label>
		    <input type="text" id="brand_name" name="brand_name" value="<%=user.getBrand_name() %>"><br>
			<input type="submit" value="회원정보 수정" >
		</form>
	</section>
</main>
</body>
</html>