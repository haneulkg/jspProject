<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
	String midCheck = request.getParameter("midCheck")==null ? "" : request.getParameter("midCheck");
	
	if(midCheck.equals("true")) {
		Cookie cookieMid = new Cookie("cMid", mid);
		cookieMid.setMaxAge(60*60*24*3);
		
		response.addCookie(cookieMid);
	}
	else {
		Cookie[] cookies = request.getCookies();
		
		for(int i=0; i<cookies.length; i++) {
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
 	}
	session.setAttribute("sMid", mid);

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ex_member.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<style>
	.empty {
		height: 600px
	}
</style>
<body>
	<div id="header" class="text-center" style="height:200px; background-color:beige">
		<h2>회원 메인창</h2>
		<br/>
		<%-- <span><%=cookieMid%>님 로그인 중이십니다</span> --%>
	<div style="height:170px; text-align:center">
		<p><br/></p>
		<a href="ex_Img1.jsp?mid=<%=mid%>" class="btn btn-outline-info">Img1</a> | &nbsp;
		<a href="ex_Img2.jsp?mid=<%=mid%>" class="btn btn-outline-info">Img2</a> | &nbsp;
		<a href="ex_Img3.jsp?mid=<%=mid%>" class="btn btn-outline-info">Img3</a> | &nbsp;
		<a href="ex_Img4.jsp?mid=<%=mid%>" class="btn btn-outline-info">Img4</a> | &nbsp;
		<a href="ex_login.jsp" class="btn btn-outline-danger">Logout</a>
	</div>
	</div>
	<div class="empty"></div>
	<div id="footer" class=" text-center">
		<%@ include file="ex_footer.jsp" %>
	</div>		
</body>
</html>