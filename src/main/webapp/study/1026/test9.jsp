<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String flag = request.getParameter("flag");
	System.out.println("flag : " + flag);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test9.jsp</title>
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">	
    <style>
    	.cont {
    		margin-bottom: 10px;
    	}
    </style>
    <script>
    	'use strict';
    	
    	if('<%=flag %>' != '') {
    		alert("😀 "+'<%=flag %>'+"님 회원가입 성공 😀");
    	}
    	
    	function fCheck() {
			let name = myform.name.value;
			let age = document.getElementById("age").value;
			
			if(name.trim() == "") {
				alert("성명을 입력하세요");
				myform.name.focus();
			}
			else if(age.trim() == "") {
				alert("나이를 입력하세요");
				document.getElementById("age").focus();
			}
			else {
				myform.submit();
			}
		}
    </script>	    
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>값 전송 연습</h2>
		<form name="myform" method="post" action="<%=request.getContextPath() %>/j1026/Test9Ok">
			<div class="cont">성명
				<input type="text" name="name" class="form-control mb-3" autofocus />
			</div>
			<div class="cont">나이
				<input type="number" name="age" id="age" class="form-control mb-3" />
			</div>
			<div class="cont">성별
				<input type="radio" name="gender" value="남자" />남자
				<input type="radio" name="gender" value="여자" checked />여자
			</div>
			<div class="cont">취미
				<input type="checkbox" name="hobby" value="등산" />등산 &nbsp;
				<input type="checkbox" name="hobby" value="수영" />수영 &nbsp;
				<input type="checkbox" name="hobby" value="낚시" />낚시 &nbsp;
				<input type="checkbox" name="hobby" value="바둑" />바둑 &nbsp;
				<input type="checkbox" name="hobby" value="싸이클" />싸이클 &nbsp;
				<input type="checkbox" name="hobby" value="배드민턴" />배드민턴
			</div>
			<div class="cont">직업
				<select name="job" class="form-control mb-3">
					<option value="">직업선택</option>
					<option>학생</option>
					<option>회사원</option>
					<option>교사</option>
					<option>개발자</option>
					<option>공무원</option>
					<option>기타</option>
				</select>
			</div>
			<div class="cont">
				<input type="button" value="전송(button)" onclick="fCheck()" class="btn btn-success form-control" />
			</div>		
		</form>
	</div>
	<p><br/></p>
</body>
</html>