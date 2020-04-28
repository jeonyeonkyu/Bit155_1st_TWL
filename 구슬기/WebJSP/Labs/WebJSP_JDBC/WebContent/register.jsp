<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>My Login Page &mdash; Bootstrap 4 Login Page Snippet</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./Resources/register/css/my-login.css">
</head>
<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<a href="#">
						<img src="./Resources/register/img/thumbs.svg" alt="bootstrap 4 login page"></a>
					</div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">회원가입</h4>
						<form action="Ex02_JDBC_JoinOK.jsp" method="post" name="joinForm" id="joinForm">
								<div class="form-group">
									<label for="name">이름</label>
									<input id="name" type="text" class="form-control" name="name" required autofocus>
									<div class="invalid-feedback">
										이름을 입력해주세요.
									</div>
								</div>

								<div class="form-group">
									<label for="email">이메일 주소</label>
									<input id="email" type="email" class="form-control" name="email" required>
									<div class="invalid-feedback">
										사용할 수 없는 이메일 주소 입니다.
									</div>
								</div>

								<div class="form-group">
									<label for="password">비밀번호</label>
									<input id="password" type="password" class="form-control" name="password" required>
									<div class="invalid-feedback">
										비밀번호를 입력해주세요.
									</div>
								</div>

								<div class="form-group">
									<label for="password">비밀번호 확인</label>
									<input id="password" type="password" class="form-control" name="password" required>
									<div class="invalid-feedback">
										비밀번호가 일치하지 않습니다. 다시 입력해주세요.
									</div>
								</div>

								<div class="form-group">
									<label for="password">핸드폰 번호 (-제외)</label>
									<input id="password" type="password" class="form-control" name="password" required>
									<div class="invalid-feedback">
										핸드폰 번호가 일치하지 않습니다. 다시 입력해주세요.
									</div>
								</div>


								<div class="form-group">
									<div class="custom-checkbox custom-control">
										<input type="checkbox" name="agree" id="agree" class="custom-control-input" required="">
										<label for="agree" class="custom-control-label">이용약관에 동의합니다.<a href="#"> 이용약관 보기</a></label>
										<div class="invalid-feedback">
											이용약관에 동의해주세요.
										</div>
									</div>
								</div>

								<div class="form-group">
								<div class="custom-checkbox custom-control">
								<div id="html_element" class="g-recaptcha" data-sitekey="6LcUGL4UAAAAAHQDXJveqB7FG3uS9ih1mqa2FNF3"
								style="margin:0 auto;"></div>
								</div>
							</div>



								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block">
										가입하기
									</button>
								</div>
								<div class="mt-4 text-center">
									이미 아이디가 있으신가요? <a href="index.html">로그인</a>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; 2020 &mdash; 26.8조
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="./Resources/register/js/my-login.js"></script>
	<script src='https://www.google.com/recaptcha/api.js'></script>
    <script type="text/javascript"> /* 서브밋 전에 리캡챠 체크 여부 를 확인합니다. */
    function FormSubmit() {
        if (grecaptcha.getResponse() == "") {
            alert("리캡챠를 체크해야 합니다.");
            return false;
        } else {
            return true;
        }
    }
    </script>


</body>
</html>