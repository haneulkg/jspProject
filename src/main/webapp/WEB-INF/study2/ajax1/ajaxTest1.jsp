<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ajaxTest1.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		// 일반 아이디 검색
		function idCheck() {
			//let mid = document.myform.value;
			//let mid = myform.value;
			//let mid = document.getElementById("mid").value;
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			location.href = "ajaxTest1Ok.st?mid="+mid;
		}
		
		// aJax로 아이디 검색1
		function idCheck1() {
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			
			$.ajax({
				url  : "${ctp}/ajaxTest1",
				type : "get",
				data : {mid:mid},  // data : {서버에서 받는 변수명 : 클라이언트 값을 담은 변수명}
				contextType : "application/json",
				charset : "utf-8",
				success : function(res) {
					alert("서버에 성공적으로 다녀왔습니다😀 ==> "+ res);
					//demo.innerHTML = res;
					$("#demo").html(res);
				},
				error : function() {
					alert("전송 오류😅");
				} 
			});
		}
		
		// 아이디체크2
		function idCheck2() {
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			
			let query = {
				mid : mid		
			}
			
			$.ajax({
				url : "${ctp}/ajaxTest2",
				type : "post",
				data : query,
				success : function(res) {
					$("#demo").html(res);
					let str = res.split("¦");	
					$("#tMid").html(str[0]);					
					$("#name").html(str[1]);					
					$("#point").html(str[2]);					
					$("#todayCount").html(str[3]);					
				},
				error : function() {
					alert("전송오류");
				}
			});
		}
		
		// 아이디검색3(문자열처리)
		function idCheck3() {
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			
			$.ajax({
				url : "${ctp}/ajaxTest3",
				type : "post",
				data : {mid:mid},
				success : function(res) {
					$("#demo").html(res);
					//res = res.substring(res.indexOf("[")+1, res.lastIndexOf("]"));
					$("#tMid").html(res.substring(res.indexOf("mid=")+4,res.indexOf(",",res.indexOf("mid="))));
					$("#name").html(res.substring(res.indexOf("name=")+5,res.indexOf(",",res.indexOf("name="))));					
					$("#point").html(res.substring(res.indexOf("point=")+6,res.indexOf(",",res.indexOf("point="))));					
					$("#todayCount").html(res.substring(res.indexOf("todayCount=")+11,res.indexOf("]")));					
				},
				error : function() {
					alert("전송오류");
				}
			});
		}
		
		// 아이디검색4
		function idCheck4() {
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			
			$.ajax({
				url : "${ctp}/ajaxTest4",
				type : "post",
				data : {mid:mid},
				success : function(res) {
					console.log("res", res);
					$("#demo").html(res);
					
					let js = JSON.parse(res);
					console.log("js", js);
					
					$("#tMid").html(js.mid);					
					$("#name").html(js.name);					
					$("#point").html(js.point);					
					$("#todayCount").html(js.todayCount);						
				},
				error : function() {
					alert("전송오류");
				}
			});
		}
		
		// 아이디검사5
		function idCheck5() {
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			
			$.ajax({
				url : "${ctp}/ajaxTest5",
				type : "post",
				data : {mid:mid},
				success : function (res) {
					$("#demo").html(res);
					let js = JSON.parse(res);
					console.log("js". js);
					
					let tMid = "", name="", point="", todayCount="";
					for(let j of js) {
						tMid += j.mid + "/";
						name += j.name + "/";
						point += j.point + "/";
						todayCount += j.todayCount + "/";
					}				
					$("#tMid").html(tMid);					
					$("#name").html(name);					
					$("#point").html(point);					
					$("#todayCount").html(todayCount);
						
				},
				error : function() {
					alert("전송오류");
				}
			});
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2>AJax 연습</h2>
		<hr/>
		<form name="myform">
			아이디 : 
			<div class="input-group">
				<input type="text" name="mid" id="mid" class="form-control"/>
				<div class="input-group-oppend">
					<input type="button" value="일반검색" onclick="idCheck()" class="btn btn-secondary"/>
				</div>
			</div>
			<hr/>
			aJax검색 : <br/>
			<div>
			</div>			
				<input type="button" value="아이디검색1" onclick="idCheck1()" class="btn btn-info"/>
				<input type="button" value="아이디검색2" onclick="idCheck2()" class="btn btn-success"/>
				<input type="button" value="아이디검색3" onclick="idCheck3()" class="btn btn-primary"/>
				<input type="button" value="아이디검색4" onclick="idCheck4()" class="btn btn-warning"/>
				<input type="button" value="아이디검색5" onclick="idCheck5()" class="btn btn-warning"/>
			<hr/>
			<div>출력 결과 : <font color="purple"><b><span id="demo"></span></b></font></div>
			<hr/>
			<div>
				<div>아이디 : <font color="orange"><b><span id="tMid"></span></b></font></div>
				<div>성명 : <font color="orange"><b><span id="name"></span></b></font></div>
				<div>포인트 : <font color="orange"><b><span id="point"></span></b></font></div>
				<div>오늘 방문카운트 : <font color="orange"><b><span id="todayCount"></span></b></font></div>
			</div>
		</form>
		<hr/>
		<div><a href="javascript:location.href='${ctp}/';" class="btn btn-warning">돌아가기</a></div>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>