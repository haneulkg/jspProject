<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>el1.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>EL(Expression Language)</h2>
  <p>저장소에 기록되어 있는 자료에 대한 처리를 담당한다.</p>
  <pre>
    용도 : 사용자가 '변수/값/수식/객체'등을 전송받은후에 저장, 또는 처리하는 용도로 사용한다.
    표기법 : $ {변수/값/수식/객체}
    저장소 : Application / Session / PageContext / Request
  </pre>
  <hr/>
<%
  String atom = "Seoul";
  String name = "홍길동";
  int su1 = 100, su2 = 200;
%>
  <h4>스크립틀릿을 이용할경우</h4>
  <div>
    atom = <%=atom %><br/>
    name = <%=name %><br/>
    su1 = <%=su1 %><br/>
    su2 = <%=su2 %><br/>
  </div>

</div>
<p><br/></p>
</body>
</html>