<!-- 지시자(directive, 디렉티브) :  < % @ -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<title>test2.jsp</title>
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">	
    <script>
    	// 자바스크립트 1줄 주석
    	/*
    		자바스크립트 여러줄 주석
    	*/
    	<%-- JSP 주석 (자바스크립트 영역) --%>
    </script>
    <style>
    	/* 스타일시트 주석 */
		<%-- JSP 주석 (스타일시트 영역) --%>
    </style>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>JSP 알아보기</h2>
		<!-- HTML 주석 -->
		<%-- JSP 주석 (본문) --%>
		<%  // 스크립틀릿(scriptlet)
			// 자바코드 작성하기
			System.out.println("JSP파일 내부 (Java)");
		
			out.println("브라우저에 출력 (Java) <br/>");
			out.println("<font size='5'><b>안녕하세요</b></font>");
			out.println("<script>");
			out.println("alert('😀반갑습니다😀')");
			out.println("</script>");
		%>
		<hr/>
		<div>본문이 계속 이어집니다</div>
		<%
			int tot = 0;
		%>
		<h4>1~100까지의 합 ?</h4>
		<%
			for(int i=1; i<=100; i++) {
				tot += i;
			}
			out.println("1~100까지의 합 : " + tot);
		%>
		<hr/>
		<div>1~100까지의 합 : <%= tot %></div>	 <%-- <%=변수 : 표현식(expression) --%>
	</div>
	<p><br/></p>
</body>
</html>