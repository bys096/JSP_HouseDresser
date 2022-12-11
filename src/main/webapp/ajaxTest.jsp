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
		request.open("Post", "./UserSearchServlet?userName=" + encodeURIComponent(document.getElementById("userName").value), true);
		request.onreadystatechange = searchProcess;
		request.send(null);
		
	}
	function searchProcess() {
		var table = document.getElementById("ajaxTable");
		var search = document.getElementById("searchResult");
		var userName = document.getElementById("userName");
		table.innerHTML = "";
		if(request.readyState == 4 && request.status == 200) {
			var object = eval('(' + request.responseText + ')');
			var result = object.result;
			var bool = false;
			for(var i = 0; i < result.length; i++) {
				var row = table.insertRow(0);
				for(var j = 0; j < result[i].length; j++) {
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
				
				
				if(userName.value === result[i][0].value) {
					bool = true;
					console.log(bool);
					console.log("입력된값: " + userName.value);
					console.log("통신값: " + result[i][0].value);
				}
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
	<input type="text" id="userName" onkeyup="search();">
</div>
<div>
	<button type="button" onclick="search();">검색</button>
	<div id="searchResult"></div>
</div>

<table style="text-align: center; border: 1px solid black;">
	<thead>
		<tr>	
			<th>이름</th>
			<th>이메일</th>
			<th>phone</th>
			<th>이메일체크</th>
		<tr>
	</thead>
	<tbody id="ajaxTable">
		<tr>
			<td>반영서</td>
			<td>james@naver.com</td>
			
			
		</tr>
	</tbody>
</table>
</body>
</html>