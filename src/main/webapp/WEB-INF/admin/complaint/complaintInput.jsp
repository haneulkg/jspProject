<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>complaintInput.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		// 신고 취소하기
		function cancel() {
			window.close();
		}
		
		// 신고 완료
		function complaint() {
			let cpContent = $("#cpContent").val();
			let ans = confirm("신고 하시겠습니까 ?");
			if(!ans) return false;
			
			
			let query = {
				part : '${part}',
				partIdx : '${partIdx}',
				cpMid : '${sMid}',
				cpContent : cpContent
			}
			
			$.ajax({
				url  : "complainInputOk.ad",
				type : "post", 
				data : query,
				success : function(res) {
					if(res == "1") {
						alert("신고가 접수되었습니다");
						window.close();
					}
					else {
						alert("신고 접수 실패");
					}
				},
				error : function() {
					alert("전송오류");
				}
			});
		}
	</script>
	<style>
		th {
			width: 40%;
		}
	</style>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">❗ 신고하기 ❗</h2>
		<br/>
		<form name="myform" method="post">
			<table class="table table-bordered text-center">
				<tr>
					<th>게시글 위치 : </th>
					<td>${partStr}</td>
				</tr>
				<tr>
					<th>게시글 제목 : </th>
					<td>${title}</td>
				</tr>
				<tr>
					<th>신고자 : </th>
					<td>${sMid}</td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="6" name="cpContent" id="cpContent" placeholder="신고사유를 작성해주세요." class="form-control"></textarea></td>
				</tr>
			</table>
			<div class="text-center">
				<input type="button" value="신고하기" onclick="complaint()" class="btn btn-danger btn-sm"/>	
				<input type="button" value="취소하기" onclick="cancel()" class="btn btn-secondary btn-sm"/>	
			</div>
<%-- 			<input type="hidden" name="part" id="part" value="${part}"/>
			<input type="hidden" name="partIdx" id="partIdx" value="${partIdx}"/>
			<input type="hidden" name="cpMid" id="cpMid" value="${sMid}"/> --%>
		</form>
	</div>
</body>
</html>