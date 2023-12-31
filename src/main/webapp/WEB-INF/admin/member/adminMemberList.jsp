<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adminMemberList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function levelChange(e) {
			let ans = confirm("선택한 회원의 등급을 변경하시겠습니까?");
			if(!ans) {
				location.reload();
				return false;
			} 
			
			let items = e.value.split("/");
			let query = {
					idx : items[1],
					level : items[0]
			}
			
			$.ajax({
				url : "adminMemberLevelChange.ad",
				type : "post",
				data : query,
				success : function(res) {
					if(res != "0") {
						alert("등급 수정 완료");
						location.reload();
					}
					else alert("등급 수정 실패");
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
		
		// 등급별 검색하기
		function memberLevelCheck() {
			let level = document.memberLevelForm.memberLevel.value;
			
			if(level == 4) {
				location.href="adminMemberList.ad";
			} else {
				location.href = "memberLevelSearch.ad?level="+level;
			}
		}
		
		// 페이징처리하기
		function pageCheck() {
			let pageSize = document.getElementById("pageSize").value;
			location.href='adminMemberList.ad?pag=${pag}&pageSize='+pageSize;
		}		
		
		// 탈퇴신청한 회원정보 삭제하기
		function memberDeleteOk(idx) {
			let ans = confirm("선택한 회원정보를 삭제하시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				url : "memberDeleteOk.mem",
				type : "post",
				data : {idx:idx},
				success : function() {
					alert("회원 삭제 완료");
					location.reload();
				},
				error : function() {
					alert("전송오류");
				}
			});
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
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">📜 전체 회원 리스트 📜</h2>
		<table class="table table-borderless">
			<tr>
				<td>
					<form name="memberLevelForm">
						<div>등급별 검색
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
						<a href="${ctp}/adminMemberList.ad?pag=1&pageSize=${pageSize}" title="첫페이지">⏪</a>&nbsp;&nbsp;
						<a href="${ctp}/adminMemberList.ad?pag=${pag-1}&pageSize=${pageSize}" title="이전페이지">◀</a>	
					</c:if>	
					${pag}/${totPage}				
					<c:if test="${pag < totPage}">
						<a href="${ctp}/adminMemberList.ad?pag=${pag+1}&pageSize=${pageSize}" title="다음페이지">▶</a>&nbsp;&nbsp;	
						<a href="${ctp}/adminMemberList.ad?pag=${totPage}&pageSize=${pageSize}" title="마지막페이지">⏩</a>	
					</c:if>						
				</td>
			</tr>
		</table>
		<table class="table table-hover">
			<tr class="table-dark text-dark text-center">
				<th>번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>공개여부</th>
				<th>오늘방문횟수</th>
				<th>탈퇴신청</th>
				<th>회원등급</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr class="text-center">
					<td>${vo.idx}</td>
					<td><a href="adminMemberInfor.ad?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.mid}</a></td>
					<%-- <td><a href="adminMemberInfor.ad?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&Vlevel=${Vlevel}">${vo.mid}</a></td> --%>
					<%-- <td><a href="adminMemberInfor.ad?idx=${vo.idx}">${vo.mid}</a></td> --%>
					<td>${vo.nickName}</td>
					<td>${vo.name}</td>
					<td>${vo.userInfor}</td>
					<td>${vo.todayCnt}</td>
					<td>
						<c:if test="${vo.userDel == 'OK'}"><font color="orange"><b>탈퇴신청</b></font>
							<c:if test="${vo.deleteDiff >= 30}"><a href="javascript:memberDeleteOk(${vo.idx})" title="탈퇴신청:30일경과">✅</a></c:if>
						</c:if>
						<c:if test="${vo.userDel != 'OK'}">활동중</c:if>
					</td>
					<td>
						<form name="levelForm">
							<select name="level" onchange="levelChange(this)">
								<option value="0/${vo.idx}" ${vo.level==0 ? "selected" : ""}>관리자</option>
								<option value="1/${vo.idx}" ${vo.level==1 ? "selected" : ""}>준회원</option>
								<option value="2/${vo.idx}" ${vo.level==2 ? "selected" : ""}>정회원</option>
								<option value="3/${vo.idx}" ${vo.level==3 ? "selected" : ""}>우수회원</option>
							</select>
						</form>
					</td>
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
						<a class="page-link" href="adminMemberList.ad?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}">이전블록</a>
					</c:if>
				</li>
	
				
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
					
						<c:if test="${i<=totPage}">
						
							<c:if test="${i==pag}">
								<li class="page-item active">
									<a class="page-link" href = "adminMemberList.ad?pag=${i}&pageSize=${pageSize}">${i}</a>
								</li>
							</c:if>
							
							<c:if test="${i!=pag}">
								<li class="page-item">
									<a class="page-link" href = "adminMemberList.ad?pag=${i}&pageSize=${pageSize}">${i}</a>
								</li>
							</c:if>
							
						</c:if>
						
				</c:forEach>
				<c:if test = "${curBlock < lastBlock}">
					<li class="page-item">
						<a class="page-link" href="adminMemberList.ad?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a>
					</li>
				</c:if>
			</ul>
		</div>				
	</div>
	<p><br/></p>
</body>
</html>