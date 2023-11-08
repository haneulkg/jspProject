<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test5.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function test5Check() {
			/*
			let su1 = myform.su1.value;
			let su2 = myform.su2.value;
			
			location.href= "${ctp}/mapping/test5?su1="+su1+"&su2="+su2;
			*/
			
			// myform.submit();
			
			// form 태그에 액션태그를 사용하지 못할 경우 : javascript에서 action명령으로 이동할 곳의 경로 지정해주기
			myform.action = "${ctp}/mapping/test5_4.re";
			myform.submit();
		}
		function test5Gugudan() {
			let dan = prompt("계산할 구구단을 입력하세요");	
			
			location.href ='${ctp}/mapping/test5_5.re?dan='+dan;
		}
		function test5Message() {
			location.href ='${ctp}/mapping/test5_6.re';
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<!-- <div class="container text-center" style="height:600px"> -->
	<div class="container text-center">
		<h2>URL 매핑 - 확장자 Mapping 패턴</h2>
		<p>이곳은 test5.jsp입니다</p>
		<hr/>
		<img src="${ctp}/images/1.jpg" width="400px" />
		<hr/>
		<div>
			<input type="button" value="test5_2.jsp" onclick="location.href='${ctp}/mapping/test5_2.re';" class="btn btn-success m-3" />
			<input type="button" value="test5_3.jsp" onclick="location.href='${ctp}/mapping/test5_3.re';" class="btn btn-primary m-3" />
			<input type="button" value="test5_4(계산).jsp" onclick="test5Check()" class="btn btn-info m-3" />
			<a href="javascript:test5Gugudan()" class="btn btn-warning m-3">test5_5(구구단)</a>
			<a href="javascript:test5Message()" class="btn btn-warning m-3">test5(메세지)</a>
		</div>
		<hr/>
		<div>
			<div>
				<%-- <form name="myform" method="post" action="${ctp}/mapping/test4"> --%>
				<form name="myform" method="post">
					<input type="number" name="su1" value="<c:if test="${empty su1}">0</c:if><c:if test="${!empty su1}">${su1}</c:if>" class="form-control mb-2" />
					<select name="op" class="form-control mb-2">
						<option <c:if test="${op == '+'}"> selected</c:if>>+</option>
						<option <c:if test="${op == '-'}"> selected</c:if>>-</option>
						<option <c:if test="${op == '*'}"> selected</c:if>>*</option>
					</select>
					<input type="number" name="su2" value="${empty su2 ? 0 : su2}" class="form-control mb-2" />
				</form>
			</div>
			<div>계산 결과 ❔ ${res}</div>
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