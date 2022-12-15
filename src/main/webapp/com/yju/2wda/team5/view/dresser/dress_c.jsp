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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css
">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js
"></script>
<link rel="stylesheet" href="<%=cssDir %>/dress_c.css?after">


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
	


<div class="form-container ">
  <div class="rounded">
    <form method="post" action="./joinUser.be" class="form-floating ">
      <div class="join-purpose join">
        <div class="class-container">
          <div class="tabs">
            <input type="radio" id="radio-1" name="class" value="user" checked />
            <label class="tab" for="radio-1">일반사용자</label>
            <input type="radio" id="radio-2" name="class" value="seller" />
            <label class="tab" for="radio-2">판매자</label>
            <span class="glider"></span>
          </div>
        </div>
      </div>
      
      


      <div class="content agree">
        <ul class="list">
          <li class="list__item">
            <label class="label--checkbox">
              <input type="checkbox" class="checkbox" required>
              약관동의
            </label>
          </li>
        </ul>
      </div>



      <div class="form-floating mb-3 join">
        <input type="text" id="name" name="name" class="form-control" placeholder="김철수" required><br>
        <label for="name">이름</label>
      </div>

      <div class="form-floating mb-3 join email">
        <input type="email" id="email" name="email" class="form-control"
          placeholder="test@naver.com" required>
        <label for="email">email</label>
        <button type="button" onclick="redundancyCheck();" class="btn btn-dark join">중복체크</button>
        <!-- <div id="checkResult">이메일중복여부</div> -->
      </div>

      <div class="form-floating mb-3 join">
        <input type="password" id="pwd" name="pwd" class="form-control" placeholder="password" required><br>
        <label for="pwd">비밀번호</label>
      </div>

      <div class="form-floating mb-0 join">
        <input type="tel" id="phone" name="phone" class="form-control" placeholder="tel" required><br>
        <label for="phone">연락처</label>
      </div>

    <!-- <div class="form-check join">
              <input type="checkbox" id="email_check" name="email_check" value="y" class="form-check-input">
              <label for="email_check" class="form-check-label">이메일 수신 동의</label><br>
            </div> -->
    <div class="content echeck">
      <ul class="list">
        <li class="list__item">
          <label class="label--checkbox">
            <input type="checkbox" name="email_check" value="y" class="checkbox" checked>
            이메일 수신 동의
          </label>
        </li>
      </ul>
    </div>


      <div class="form-floating mb-3 join zip">
        <input type="text" id="sample6_postcode" placeholder="우편번호" name="zip" class="form-control">
        <label for="phone">우편번호</label>
        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-dark"><br>
      </div>
      <div class="form-floating mb-3 join">
        <input type="text" id="sample6_address" placeholder="주소" name="address1" class="form-control address1"><br>
        <label for="sample6_address">주소</label>
      </div>
      <div class="form-floating mb-3 join">
        <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address2" class="form-control address2">
        <label for="sample6_detailAddress">상세주소</label>
      </div>
      <div class="form-floating mb-3 join">
        <input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control"><br>
        <label for="sample6_extraAddress">참고항목</label>
      </div>
      <input type="submit" value="회원가입" class="btn btn-dark join">

    </form>
  </div>
</div>
  


  <%@ include file="/footer.jsp" %>
  
  
  
  
  
  <script type="text/javascript">
	var request = new XMLHttpRequest();
	var bool = false;
	function redundancyCheck() {
		
		request.open("Post", "./redundancyCheck.be?userEmail=" + encodeURIComponent(document.getElementById("email").value), true);
		request.onreadystatechange = searchProcess;
		request.send(null);
	}
	function searchProcess() {
		
		var email = document.getElementById("email");
		/* var checkResult = document.getElementById("checkResult"); */
		/* checkResult.innerHTML = ""; */
		
		if(request.readyState == 4 && request.status == 200) {
			var object = eval('(' + request.responseText + ')');
			var result = object.result;
			
			if(!email.value)
				
				bool = true;
			else if(email.value === result)
				bool = true;
/* 				console.log("입력된값: " + email.value);
				console.log("통신값: " + result); */
			
			if(bool) {
				bool=false;
				email.setAttribute('class', 'form-control is-invalid');
				/* checkResult.innerHTML = "중복"; */				
			}
			else {
				email.setAttribute('class', 'form-control is-valid');				
				/* checkResult.innerHTML = "중복아님"; */
			}	
		}
	}
</script>
  
  
  
  
  
  
</body>
</html>