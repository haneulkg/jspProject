<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>t1_requestGet.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
	<p><br/></p>
	<div class="container">
		<form name="myform" method="post" action="t1_requestGetOk.jsp">
		 	<h3>전송된 값과 환경을 서버에서 확인해오기</h3>
			<div class="border p-3">
				<div class="mb-3">성명 :
					<input type="text" name="name" value="홍길동" class="form-control mt-2 mb-3" autofocus required />
				</div><br/>
				<div class="mb-3">취미 :
					<input type="checkbox" name="hobby" value="등산" checked />등산
					<input type="checkbox" name="hobby" value="낚시" />낚시
					<input type="checkbox" name="hobby" value="바둑" />바둑
					<input type="checkbox" name="hobby" value="싸이클 "/>싸이클
					<input type="checkbox" name="hobby" value="수영" />수영
					<input type="checkbox" name="hobby" value="독서" />독서
				</div><br/>
				<div class="text-center mb-3">
					<input type="submit" value="전송" class="btm btn-success" />
					<input type="submit" value="취소" class="btm btn-danger" />
				</div>
			</div>
			<input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>" />
		</form>
	</div>
	<p><br/></p>
</body>
</html>