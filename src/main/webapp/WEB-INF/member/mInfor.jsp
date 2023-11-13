<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>mInfor.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2>${vo.mid}회원님 상세 정보 보기</h2>
		<br/>
		<table class="table">
			<tr><td>아이디 : ${vo.mid}</td></tr>
			<tr><td>닉네임 : ${vo.nickName}</td></tr>
			<tr><td>이름 : ${vo.name}</td></tr>
			<tr><td>성별 : ${vo.gender}</td></tr>
			<tr><td>생일 : ${vo.birthday}</td></tr>
			<tr><td>전화번호 : ${vo.tel}</td></tr>
			<tr><td>주소 : ${vo.address}</td></tr>
			<tr><td>이메일 : ${vo.email}</td></tr>
			<tr><td>홈페이지 : ${vo.homePage}</td></tr>
			<tr><td>직업 : ${vo.job}</td></tr>
			<tr><td>취미 : ${vo.hobby}</td></tr>
			<tr><td>회원사진 : <img src="${ctp}/images/member/${vo.photo}" width="100px"/></td></tr>
			<tr><td>회원소개 : ${vo.content}</td></tr>
			<tr><td>회원 정보 공개여부 : ${vo.userInfor}</td></tr>
			<tr><td>회원 탈퇴 신청여부 : <c:if test="${vo.userDel == 'OK'}">탈퇴신청</c:if>
									<c:if test="${vo.userDel == 'NO'}">활동중</c:if>
			</td></tr>
			<tr><td>회원 누적 포인트 : ${vo.point}</td></tr>
			<tr><td>회원 등급 : ${strLevel}</td></tr>
			<tr><td>총 방문횟수 : ${vo.visitCnt}</td></tr>
			<tr><td>최초 가입일 : ${vo.startDate}</td></tr>
			<tr><td>마지막 접속일 : ${vo.lastDate}</td></tr>
			<tr><td>오늘 방문한 횟수 : ${vo.todayCnt}</td></tr>
		</table>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>