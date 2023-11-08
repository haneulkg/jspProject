<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test5_3.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<!-- <div class="container text-center" style="height:600px"> -->
	<div class="container text-center">
		<h2>URL 매핑 - 확장자 Mapping 패턴</h2>
		<p>이곳은 test5_3.jsp입니다</p>
		<hr/>
		<img src="${ctp}/images/3.jpg" width="400px" />
		<hr/>
		<div>
			<input type="button" value="test5_1.jsp" onclick="location.href='${ctp}/mapping/test5.re';" class="btn btn-success m-3" />
			<input type="button" value="test5_2.jsp" onclick="location.href='${ctp}/mapping/test5_2.re';" class="btn btn-primary m-3" />
		</div>
		<hr/>
		<pre style="text-align: left">
			🔅 test1.jsp/test2.jsp/test3.jsp 파일에 접속시키고 해당 파일의 파일명을 화면에 출력하기
			🔅 test4.jsp 클릭시 test1.jsp 화면에 입력된 su1과 su2의 내용에 해당하는 값을 구하여 test1.jsp에 출력하기
			🔅 단, test4컨트롤러는 이동지시만 하고 계산은 Test4Service객체를 사용하기
		</pre>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>