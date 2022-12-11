<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	var request = new XMLHttpRequest();
	function search() {
		request.open("Post", "./ajaxsearch.be?userName=" + encodeURIComponent(document.getElementById("userName").value), true);
		request.onreadystatechange = searchProcess;
		request.send(null);
		
	}
	function searchProcess() {
		
		var search = document.getElementById("searchResult");
		var userName = document.getElementById("userName");
		
		if(request.readyState == 4 && request.status == 200) {
			var object = eval('(' + request.responseText + ')');
			var result = object.result;
			var bool = false;
			for(var i = 0; i < result.length; i++) {
				if(userName.value === result[i][1].value2) {
					bool = true;
					console.log("입력된값: " + userName.value);
					console.log("통신값: " + result[i][1].value2);
				}
					console.log(bool);
			}
			if(bool)
				search.innerHTML = "중복";
			else
				search.innerHTML = "중복아님";
			
		}
		
	}
</script>
</head>
<body>
<div>
<!-- onkeyup="search(); -->
	<input type="text" id="userName">
</div>
<div>
	<button type="button" onclick="search();">검색</button>
	<div id="searchResult"></div>
</div>

</body>
</html>