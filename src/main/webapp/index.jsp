<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 가장 좋은 방법 --%>
<%
	pageContext.forward("main.ad");
%>

<%--  경로가 다 나옴
<script>
	location.href = "main.ad";
</script>
--%>

<%-- <jsp:forward page="main.ad" /> 경로가 나오지는 않음 --%>

<%-- 경로가 다 나옴
<%
	response.sendRedirect("main.ad");
%>
--%>
