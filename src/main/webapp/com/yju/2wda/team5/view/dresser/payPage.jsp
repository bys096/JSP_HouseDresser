<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>결제 페이지입니다.</h1>
</body>
<script>
	window.onload = function(){
		function sayHi() {
			var is = confirm("정말 결제하시겠습니까?");
			if(is == true) {
				/* alert("결제가 완료되었습니다."); */
				location='./pay.be'
			}
		}
		setTimeout(sayHi, 1000);
		
		
	}
</script>
</html>