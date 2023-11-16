<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>fileUpload1.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function fCheck() {
			let fName = document.getElementById("file").value;
			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase(); // 업로드한 파일의 확장자 값 가져오기 
			// 1KByte=10^3Byte=1024Byte=2^10Byte, 1MByte=2^20Byte=10^6Btye, 1GByte=2^30Byte=10^9Byte, 1TByte=2^40Byte=10^12Byte
			let maxSize = 1024 * 1024 * 10; // 10MByte제한 걸음
			
			if(fName.trim() == "") {
				alert("업로드할 파일을 선택하세요");
				return false;
			}
			
			let fileSize = document.getElementById("file").files[0].size; // 파일 사이즈받기
			if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'zip' && ext != 'hwp' && ext != 'ppt' && ext != 'pptx' && ext != 'xlsx') {
				alert("업로드 불가한 파일입니다 (업로드 가능 파일:jpg|gif|png|zip|hwp|ppt|pptx|xlsx)");
			}
			else if(fileSize > maxSize) {
				alert("업로드 가능한 파일의 최대용량 : 10MByte");
			}
			else {
				myform.submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2>파일 업로드 연습(싱글파일처리)</h2>
		<p>✔ COS라이브러리를 이용한 파일 업로드</p>
		<div>✔ https://www.servlets.com/cos/</div>
		<hr/>
		<!-- <form name="myform" method="post" action="fileUpload1Ok.st" enctype="multipart/form-data"> -->
		<form name="myform" method="post" action="fileUpload1Ok.st">
			파일명 :
			<input type="file" name="fName" id="file" class="form-control-file mb-2 border"/>
			<input type="button" value="전송" onclick="fCheck()" class="btn btn-secondary form-control"/>
		</form>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>