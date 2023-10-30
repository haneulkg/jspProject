<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- nav2.jsp -->
<%-- <%@ include file="bs4.jsp" %> --%>
<%@ include file="../../include/bs4.jsp" %>
<%-- <%@ include file="<%=request.getContextPath()%>/includ/bs4.jsp" %> --%> <!-- 사용불가 : %안에는 %를 또 사용할 수 없음 -->
<%-- <jsp:include page ="<%=request.getContextPath()%>/includ/bs4.jsp"></jsp:include> --%>
<!-- <div class=container> -->
<script>
	function LogoutCheck() {
		let ans = confirm("로그아웃 하시겠습니까 ?");
		if(ans) {
			location.href = "${pageContext.request.contextPath}/j1030/logout?mid=${mid}";
		}
	}
</script>
<div style="height:150px; text-align:center">
	<p><br/></p>
	<a href="main.jsp?mid=${mid}" class="btn btn-outline-info">Home</a> |
	<a href="main.jsp?mid=${mid}&flag=guest" class="btn btn-outline-info">Guest</a> |
	<a href="main.jsp?mid=${mid}&flag=board" class="btn btn-outline-info">Board</a> |
	<a href="main.jsp?mid=${mid}&flag=pds" class="btn btn-outline-info">Pds</a> |
	<a href="javascript:LogoutCheck()" class="btn btn-outline-warning">Logout</a> 
</div>