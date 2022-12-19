<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bys21_house_dresser.model.UserDTO" %>
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
    .nav-tabs, table { font-family: 'Noto Sans KR', sans-serif; }
    table {
      margin-top: 55px;
    }
	table { text-align: center; }
</style>
</head>
<body>
<%
	ArrayList<UserDTO> userList = (ArrayList<UserDTO>) session.getAttribute("userList");
	UserDTO user;
%>
<%@ include file="/header.jsp" %>
<main>
	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a class="nav-link disabled">관리자</a>
		</li>
		<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="./getUserListByAdmin.be" >회원정보 열람</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="./getProductListByAdmin.be">상품정보 열람</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="./OrderHistoryByAdmin.be">주문내역 열람</a>
		</li>
	</ul>

	<section>
		<table class="table align-middle table-hover">
			<thead class="table-dark">
				<tr>
					<th scope="col">#</th>
		       	 	<th scope="col">성명</th>
		        	<th scope="col">E-Mail</th>
		        	<th scope="col">Password</th>
		        	<th scope="col">E-Mail 수신동의</th>
		        	<th scope="col">가입일</th>
		        	<th scope="col">Class</th>
		        	<th scope="col">브랜드명</th>
		        	<th scope="col">우편번호</th>
		        	<th scope="col">주소</th>
		        	<th scope="col">상세주소</th>
		        	<th scope="col">수정</th>
		        	<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody>
		<%
			for(int i = 0; i < userList.size(); i++) {	
				user = userList.get(i);
			
		%>
				<tr>
					<th scope="row"><%=i+1 %></th>
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
					<td>
			        	<button onclick="location='<%=dresserViewDir %>/admin_u_user.jsp?userIndex=<%=i%>'" 
			        			class="btn btn-outline-success">
							회원 수정
						</button>
					</td>
					<td>
			        	<button onclick="location='./deleteUserByAdmin.be?user_email=<%=user.getUser_email() %>'" 
			        			class="btn btn-outline-danger">
							회원 삭제
						</button>
					</td>
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