<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>home.jsp</title>
	<%@ include file="../../include/bs4.jsp" %>
</head>
<body>
	<!-- 헤더영역(로고/메뉴/Top Image 등등) -->
	<div id="header" class="text-center" style="background-color:lightgray">
		<%@ include file="nav.jsp" %>
	</div>
	<p><br/></p>
	<div class="container" style="text-align:center">
		<h3>이곳은 메인 화면(Home)입니다</h3>
		<hr/>
		<p><img src="../../images/1.jpg" width="400px" /></p>
		<hr/>
	</div>
	<p><br/></p>
	<!-- 푸터영역(Copyright/Email Adderss/사업자등록증 등등) -->
	<div id="footer" class="text-center">
		<%@ include file="footer.jsp" %>
	</div>	
</body>
</html>