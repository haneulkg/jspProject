<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		
		// 페이징처리하기
		function pageCheck() {
			let pageSize = document.getElementById("pageSize").value;
			location.href='mAdminMemberList.mem?pag=${pag}&pageSize='+pageSize;
		}		
		
	</script>
	<style>
	.page-link {
	  color: #000; 
	  background-color: #fff;
	  border: 1px solid #ccc; 
	}
	
	.page-item.active .page-link {
	 z-index: 1;
	 color: black;
	 font-weight:bold;
	 background-color: gray;
	 border-color: #ccc;
	 
	}
	
	.page-link:focus, .page-link:hover {
	  color: #000;
	  background-color: lightgray; 
	  border-color: #ccc;
	}
</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">📜 전체 회원 리스트 📜</h2>
		<table class="table table-borderless">
			<tr>
				<td>
					<form name="memberLevelForm">
						<div>
							<select name="memberLevel" onchange="memberLevelCheck()">
								<option value="4">전체보기</option>
								<option value="0"${Vlevel==0 ? "selected" : ""}>관리자</option>
								<option value="1"${Vlevel==1 ? "selected" : ""}>준회원</option>
								<option value="2"${Vlevel==2 ? "selected" : ""}>정회원</option>
								<option value="3"${Vlevel==3 ? "selected" : ""}>우수회원</option>
							</select>
						</div>
					</form>
				</td>
			</tr>
		</table>
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td>한 페이지당 회원수 보기🙍‍♀️🙍‍♂️ &nbsp;&nbsp;
				<select name="pageSize" id="pageSize" onchange="pageCheck()">
						<option <c:if test="${pageSize == 2}">selected</c:if>> 2</option>
						<option <c:if test="${pageSize == 3}">selected</c:if>> 3</option>
						<option <c:if test="${pageSize == 5}">selected</c:if>> 5</option>
						<option <c:if test="${pageSize == 10}">selected</c:if>> 10</option>
					</select>건
				</td>
				<td class="text-right">
					<c:if test="${pag > 1}">
						<a href="${ctp}/mAdminMemberList.mem?pag=1&pageSize=${pageSize}" title="첫페이지">⏪</a>&nbsp;&nbsp;
						<a href="${ctp}/mAdminMemberList.mem?pag=${pag-1}&pageSize=${pageSize}" title="이전페이지">◀</a>	
					</c:if>	
					${pag}/${totPage}				
					<c:if test="${pag < totPage}">
						<a href="${ctp}/mAdminMemberList.mem?pag=${pag+1}&pageSize=${pageSize}" title="다음페이지">▶</a>&nbsp;&nbsp;	
						<a href="${ctp}/mAdminMemberList.mem?pag=${totPage}&pageSize=${pageSize}" title="마지막페이지">⏩</a>	
					</c:if>						
				</td>
			</tr>
		</table>
		<table class="table table-hover">
			<tr class="table-dark text-dark text-center">
				<th>번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>성명</th>
				<th>성별</th>
				<th>공개여부</th>
				<th>오늘방문횟수</th>
				<th>회원등급</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr class="text-center">
					<td>${vo.idx}</td>
					<c:if test="${vo.userInfor == '공개' || vo.mid == sMid || sMid == 'admin'}">
						<td><a href="memberInfor.mem?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.mid}</a></td>
					</c:if>
					<c:if test="${vo.userInfor != '공개' && vo.mid != sMid && sMid != 'admin'}">
						<td>${vo.mid}</td>
					</c:if>
					<td>${vo.nickName}</td>
<%-- 					<td>
						<c:if test="${userInfor == '공개'}">${vo.name}</c:if>
						<c:if test="${userInfor != '공개'}">비공개</c:if>
					</td> --%>
					<c:if test="${vo.userInfor == '공개' || vo.mid == sMid || sMid == 'admin'}">
						<td>${vo.name}</td>
						<td>${vo.gender}</td>
						<td>${vo.userInfor}</td>
						<td>${vo.todayCnt}</td>
						<td>
							<c:if test="${vo.level==0}">관리자</c:if>
							<c:if test="${vo.level==1}">준회원</c:if>
							<c:if test="${vo.level==2}">정회원</c:if>
							<c:if test="${vo.level==3}">우수회원</c:if>
						</td>
					</c:if>
					<c:if test="${vo.userInfor != '공개' && vo.mid != sMid && sMid != 'admin'}">
						<td colspan="5" style="background-color: lightgray">비공개</td>
					</c:if>
				</tr>
			</c:forEach>
			<tr><td colspan="8" class="m-0 p-0"></td></tr>
		</table>
			<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>	
		<!-- 페이징 처리 -->
		<div class="text-center">
		
			<ul class="pagination justify-content-center" style="margin:20px 0">
			
				<li class="page-item">
					<c:if test = "${curBlock > 0}">
						<a class="page-link" href="mAdminMemberList.mem?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}">이전블록</a>
					</c:if>
				</li>
	
				
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
					
						<c:if test="${i<=totPage}">
						
							<c:if test="${i==pag}">
								<li class="page-item active">
									<a class="page-link" href = "mAdminMemberList.mem?pag=${i}&pageSize=${pageSize}">${i}</a>
								</li>
							</c:if>
							
							<c:if test="${i!=pag}">
								<li class="page-item">
									<a class="page-link" href = "mAdminMemberList.mem?pag=${i}&pageSize=${pageSize}">${i}</a>
								</li>
							</c:if>
							
						</c:if>
						
				</c:forEach>
				<c:if test = "${curBlock < lastBlock}">
					<li class="page-item">
						<a class="page-link" href="mAdminMemberList.mem?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a>
					</li>
				</c:if>
			</ul>
		</div>				
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>