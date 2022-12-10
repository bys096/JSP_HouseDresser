<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bys21_house_dresser.model.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cssDir%>/admin.css?after">
</head>
<body>
<%
	ArrayList<UserDTO> userList = (ArrayList<UserDTO>) session.getAttribute("userList");
	UserDTO user;
%>
<%@ include file="/header.jsp" %>
<h1>관리자 회원 정보 조회 페이지</h1>
<main>
	<div class="admin_nav">
	      <span>관리자 모드</span>
	      <div><a href="./getUserListByAdmin.be">회원정보열람</a></div>
	      <div><a href="./getProductListByAdmin.be">상품정보열람</a></div>
	      <div><a href="./OrderHistoryByAdmin.be">주문내역열람</a></div>
	</div>
	<section>
		<table>
			<thead>
				<tr>
					<th>name</th>
					<th>email</th>
					<th>password</th>
					<th>email수신동의</th>
					<th>가입일</th>
					<th>Role</th>
					<th>브랜드명</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
		<%
			for(int i = 0; i < userList.size(); i++) {	
				user = userList.get(i);
			
		%>
				<tr>
					<td><%=user.getUser_name() %></td>
					<td><%=user.getUser_email() %></td>
					<td><%=user.getUser_pwd() %></td>
					<td><%=user.getEmail_check() %></td>
					<td><%=user.getUser_regdate() %></td>
					<td><%=user.getUser_class() %></td>
					<td><%=user.getBrand_name() %></td>
					<td><%=user.getUser_zip() %></td>
					<td><%=user.getUser_address1() %></td>
					<td><%=user.getUser_address2() %></td>
					<td><a href="<%=dresserViewDir %>/admin_u_user.jsp?userIndex=<%=i%>">수정</a></td>
					<td><a href="./deleteUserByAdmin.be?user_email=<%=user.getUser_email() %>">삭제</a>
				</tr>
		<%
			}
		%>
			
			</tbody>
		</table>
	</section>
</main>
</body>
</html>