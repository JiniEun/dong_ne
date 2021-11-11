<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.input-form {
	max-width: 680px;
	margin-top: 50px;
	padding: 30px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

.btn-color {
	border-color: #5BA6A6;
	color: #5BA6A6;
}
</style>
</head>
<body>
	<div class="container-sm">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">

				<h1 class="col-sm-offset-2 col-sm-10">로그인</h1>
				<form class="form-horizontal" action="/user/login" method="post">
					<input type="hidden" name="rurl" value="${param.rurl}"> <input
						type="hidden" name="bbsno" value="${param.bbsno}"> <input
						type="hidden" name="nowPage" value="${param.nowPage}"> <input
						type="hidden" name="nPage" value="${param.nPage}"> <input
						type="hidden" name="col" value="${param.col}"> <input
						type="hidden" name="word" value="${param.word}">

					<div class="form-group">
						<label class="control-label col-sm-2" for="ID">아이디</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="ID"
								placeholder="Enter id" name="ID" required="required" value=''>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="password">비밀번호</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" id="password"
								placeholder="Enter password" name="password" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<div class="checkbox">
								<label> <input type="checkbox" name="c_id" value="Y"
									checked="checked"> Remember ID
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-8">
							<button type="submit" class="btn btn-color">로그인</button>
							<button type="button" class="btn btn-color"
								onclick="location.href='create'">회원가입</button>
							<button type="button" class="btn">아이디 찾기</button>
							<button type="button" class="btn">패스워드 찾기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>