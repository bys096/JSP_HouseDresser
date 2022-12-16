<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bys21_house_dresser.model.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/bys21_house_dresser/com/yju/2wda/team5/js/zip.js"></script>




<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css
">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js
"></script>
<link rel="stylesheet" href="<%=cssDir %>/dress_u2.css?after">
</head>
<body>
<%@ include file="/header.jsp" %>
<%
	UserDTO user = (UserDTO)session.getAttribute("userInfo");
	String email_check = user.getEmail_check();
%>
	<main>
		<ul class="nav nav-tabs">
  			<li class="nav-item">
   				<a class="nav-link active" aria-current="page" href="./getUserInfo.be" >회원정보수정</a>
  			</li>
 			<li class="nav-item">
   				<a class="nav-link" href="<%= dresserViewDir%>/dress_d.jsp">회원탈퇴</a>
  			</li>
		</ul>


		<div class="article">
			<div class="form-container ">
			  <div class="rounded">
			    <form method="post" action="./updateUser.be" class="form-floating ">
			      <div class="form-floating mb-3 join">
			        <input type="text" id="name" name="name" class="form-control" placeholder="김철수" value="<%=user.getUser_name() %>" readonly><br>
			        <label for="name">이름</label>
			      </div>
			
			      <div class="form-floating mb-3 join email">
			        <input type="email" id="email" name="email" class="form-control"
			          placeholder="test@naver.com" value="<%=user.getUser_email() %>" readonly>
			        <label for="email">email</label>
			      </div>
			
			      <div class="form-floating mb-3 join">
			        <input type="password" id="pwd" name="pwd" class="form-control" placeholder="password" required><br>
			        <label for="pwd">비밀번호</label>
			      </div>
			
			      <div class="form-floating mb-0 join">
			        <input type="tel" id="phone" name="phone" class="form-control" placeholder="tel" value="<%=user.getUser_phone() %>" required><br>
			        <label for="phone">연락처</label>
			      </div>
			
			   
			      <div class="content echeck">
			      	<ul class="list">
			        	<li class="list__item">
			        
<%
						if(email_check.equals("y")) {
%>
			          		<label class="label--checkbox">
			            	<input type="checkbox" name="email_check" value="y" class="checkbox" checked>
			            		이메일 수신 동의
			          		</label>
<%
						} else {
%>      
				
					 		<label class="label--checkbox">
			            	<input type="checkbox" name="email_check" value="y" class="checkbox">
			            		이메일 수신 동의
			          		</label>
<%
						}
%>   
			        	</li>
					  </ul>
					</div>
			
			
			      <div class="form-floating mb-3 join zip">
			        <input type="text" id="sample6_postcode" placeholder="우편번호" name="zip" value="<%=user.getUser_zip() %>" class="form-control">
			        <label for="phone">우편번호</label>
			        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-dark"><br>
			      </div>
			      <div class="form-floating mb-3 join">
			        <input type="text" id="sample6_address" placeholder="주소" name="address1" value="<%=user.getUser_address1() %>" class="form-control address1"><br>
			        <label for="sample6_address">주소</label>
			      </div>
			      <div class="form-floating mb-3 join">
			        <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address2" value="<%=user.getUser_address2() %>" class="form-control address2">
			        <label for="sample6_detailAddress">상세주소</label>
			      </div>
			      <div class="form-floating mb-3 join">
			        <input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control"><br>
			        <label for="sample6_extraAddress">참고항목</label>
			      </div>
			      <input type="submit" value="회원정보 수정" class="btn btn-dark join">
			
			    </form>
			  </div>
			</div>
		</div>
	</main>
	
<%@ include file="/footer.jsp" %>
</body>
</html>