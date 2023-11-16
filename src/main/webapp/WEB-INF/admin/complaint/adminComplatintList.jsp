<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adminComplatintList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br/></p>
	<div class="container text-center">
		<h3>신고한 글 리스트</h3>
		<hr/>
		<table class="table table-borderd text-center">
			<tr>
				<th>번호</th>
				<th>신고항목</th>
				<th>게시글 번호</th>
				<th>신고자 아이디</th>
				<th>신고 사유</th>
				<th>신고 날짜</th>
				
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${vo.idx}</td>
					<td>${vo.part}</td>
					<td>${vo.partIdx}</td>
					<td>${vo.cpMid}</td>
					<td>${vo.cpContent}</td>
					<td>${vo.cpDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<p><br/></p>
</body>
</html>