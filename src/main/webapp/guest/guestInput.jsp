<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>guestInput.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2>방명록 리스트</h2>
		<br/><br/>
		<form name="myform" method="post" action="${ctp}/GuestInput">
			<table class="table table-bordered">
				<tr>
					<th style="width: 200px">성명</th>
					<td><input type="text" name="name" id="name" class="form-control" required autofocus></td>
				</tr>
				<tr>
					<th>이메일 주소 </th>
					<td><input type="text" name="email" id="email" class="form-control" required></td>
				</tr>
				<tr>
					<th>홈페이지 주소</th>
					<td><input type="text" name="homePage" id="homePage" class="form-control" required></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="content" id="content" rows="10" class="form-control" required></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="btn btn-success form-control"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" class="btn btn-warning form-control"/></td>
				</tr>
			</table>
		</form>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>