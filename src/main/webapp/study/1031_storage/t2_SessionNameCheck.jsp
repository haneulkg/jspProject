<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionNameCheck.jsp - 세션이름 확인 -->
<jsp:include page="/include/bs4.jsp"></jsp:include>
<p><br/></p>
<div class="container">
<%
	Enumeration names = session.getAttributeNames();
	
	int cnt = 0;
	while(names.hasMoreElements()) { // .hasMoreElements() : 값이 있으면 true , 값이 있을동안만 반복됨
		cnt ++;
		String sName = (String)names.nextElement();
		out.println(cnt+".세션이름 : "+sName+"<br/>");
	}
%>
<hr/>
<p><a href="t2_SessionMain.jsp" class="btn btn-success">돌아가기</a></p>
</div>