<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- loginResC.jsp -->
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
%>
<jsp:include page="/include/bs4.jsp"></jsp:include>
<div class="container">
	<p><br/></p>
	<h3>총무과 회원정보-(loginResC.jsp)</h3>
	<p>아이디 : <%=mid%></p>
	<p>비밀번호 : <%=pwd%></p>
	<p><a href="login.jsp" class="btn btn-info">돌아가기</a></p>
</div>