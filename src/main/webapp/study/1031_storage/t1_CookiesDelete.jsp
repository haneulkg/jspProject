<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesDelete.jsp -->
<%
	Cookie[] cookies = request.getCookies();
	
	// Cookie는 따로 지우는 명령어가 없으므로 만료시간을 0으로 주어서 삭제함 
	for(int i=0; i<cookies.length; i++) {
		cookies[i].setMaxAge(0);
		response.addCookie(cookies[i]);
	}
%>
<script>
	alert("쿠키가 삭제되었습니다.");
	location.href="t1_CookiesMain.jsp";
</script>