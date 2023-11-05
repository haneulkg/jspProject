<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
	Cookie[] cookies = request.getCookies();
	String cookieMid = "";
	
	  for(int i=0; i<cookies.length; i++) {
	      if(cookies[i].getName().equals("cMid")){
	          cookieMid = cookies[i].getValue();
	  }	
%> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ex_login.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h3>로그인</h3>
		<hr/>
		<form name="myform" method="post" action="ex_member.jsp" style="width: 400px">
			<div class="mb-3">아이디 : <input type="text" name="mid" value="" autofocus class="form-control" /></div>
			<div class="mb-3">비밀번호 : <input type="password" name="pwd" value="1234" autofocus class="form-control" /></div>
			<div><input type="checkbox" name="midCheck" checked/>&nbsp;&nbsp;아이디 저장</div>
			<hr/>
			<div class="row">
				<div class="col"><button type="submit" class="btn btn-success form-control">로그인</button></div>
				<div class="col"><button type="reset" class="btn btn-danger form-control">다시입력</button></div>
			</div>
		</form>
	</div>
	<p><br/></p>
</body>
</html>