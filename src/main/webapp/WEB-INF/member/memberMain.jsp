<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberMain.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
	function pageCheck() {
		let pageSize = document.getElementById("pageSize").value;
		location.href='${ctp}/memberList?pag=${pag}&pageSize='+pageSize;
	}  
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>🤗 회원 전용방 🤗</h2>
  <hr/>
  <p>
    정회원 등업조건 ❔❔
  </p>
  <hr/>
  <div><img src="${ctp}/images/member/noimage.jpg" width="200px"/></div>
  <hr/>
  <div>
  	<p>현재 <font color="orange"><b>${sNickName}(${strLevel})</b></font>님이 로그인 중이십니다.</p>
  	<p>🔅 총 방문횟수 : ${mVo.visitCnt}회</p>
  	<p>🔅 오늘 방문횟수 : ${mVo.todayCnt}회</p>
  	<p>🔅 총 보유 포인트 : ${mVo.point}점</p>
  	<hr/>
  	<h4>활동내역</h4>
  	<p>🔅 방명록에 올린글수 : ${fn:length(gVos)}건</p>
  	<p>🔅 게시판에 올린글수 : ${empty bVo.boardCnt ? 0 : bVo.boardCnt}건</p>
  	<hr/>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>