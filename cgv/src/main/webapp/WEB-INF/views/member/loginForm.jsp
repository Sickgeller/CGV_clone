<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".btn-secondary").click(function(event){
		event.preventDefault()
		window.location.href = 'registerForm.do'
	})
})
</script>
</head>
<body>
<div class="container">
	<form action="login.do" method="post">
		<div class="form-group">
		<ul>
			<li>
				<label for="id" class="form-label">아이디</label>
				<input type="text" id="id" name="id" autocomplete="off" class="form-input">
			<li>
			<li>
				<label for="passwd" class="form-label">비밀번호</label>
				<input type="password" id="passwd" name="passwd" class="form-input">
			</li>
		</ul>
		</div>
		<div class="button">
			<button class="btn btn-primary" type="submit">로그인</button>
			<button class="btn btn-secondary" type="button">회원가입</button>
		</div>
	</form>
</div>
</body>
</html>