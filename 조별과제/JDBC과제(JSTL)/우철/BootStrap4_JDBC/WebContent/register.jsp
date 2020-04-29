<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="author" content="Kodinger">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>My Login Page &mdash; Bootstrap 4 Login Page Snippet</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./assets/css/my-login.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script type="text/javascript">
	//jquery 로 간단하게 유효성 check 하기
	$(function() {
		$('#joinForm').submit(function() {
			//alert("가입");
			if ($('#id').val() == "") { // 아이디 검사
				alert('ID를 입력해 주세요.');
				$('#id').focus();
				return false;
			} else if ($('#password').val() == "") { // 비밀번호 검사
				alert('비밀번호를 입력해 주세요.');
				$('#password').focus();
				return false;
			} else if ($('#passwordCheck').val() == "") { // 비밀번호 검사
				alert('비밀번호 확인을 입력해 주세요.');
				$('#passwordCheck').focus();
				return false;
			} else if ($('#name').val() == "") { // 이름 검사
				alert('name를 입력해 주세요.');
				$('#name').focus();
				return false;
			} else if ($('#email').val() == "") { // 나이 검사
				alert('email를 입력해 주세요.');
				$('#email').focus();
				return false;
			} else if ($('#phone').val() == "") { // 우편번호
				alert('phone를 입력해 주세요.');
				$('#phone').focus();
				return false;
			}

		});
	});
</script>
</head>

<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<a href="#"> <img src="./assets/img/thumbs.svg"
							alt="bootstrap 4 login page"></a>
					</div>
					<div class="card fat">
						<div class="card-body">
							<div class="mx-auto">
								<h4 class="card-title">회원가입</h4>
							</div>
							
							<!-- class="my-login-validation" -->
							<form action="registerAction.jsp" method="post" name="joinForm"
								id="joinForm" onsubmit="return submitCheck();" >
								<div class="form-group">
									<label for="id">아이디</label> <input id="id" type="text"
										class="form-control" name="id">
									<!-- <div class="invalid-feedback">아이디를 입력해주세요.</div> -->
								</div>
								
								<div class="form-group">
									<label for="password">비밀번호</label> <input id="password"
									onchange="isSame()" type="password" class="form-control" name="password">
									<!-- <div class="invalid-feedback">비밀번호를 입력해주세요.</div>  -->
								</div>

								<div class="form-group">
									<label for="password">비밀번호 확인</label> <input id="passwordCheck"
										onchange="isSame()" type="password" class="form-control" name="passwordCheck">
								<!-- 	<div class="invalid-feedback">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</div> -->
									<div id="same"></div>
									
								</div>

								<div class="form-group">
									<label for="name">이름</label> <input id="name" type="text"
										class="form-control" name="name" >
							<!-- 		<div class="invalid-feedback">이름을 입력해주세요.</div> -->
								</div>

								<div class="form-group">
									<label for="email">이메일 주소</label> <input id="email"
										type="email" class="form-control" name="email">
									<!-- <div class="invalid-feedback">사용할 수 없는 이메일 주소 입니다.</div> -->
								</div>

								<div class="form-group">
									<label for="password">핸드폰 번호 (-제외)</label> <input id="phone"
										type="password" class="form-control" name="phone">
									<!-- <div class="invalid-feedback">핸드폰 번호가 일치하지 않습니다. 다시
										입력해주세요.</div> -->
								</div>


								<div class="form-group">
									<div class="custom-checkbox custom-control">
										<input type="checkbox" name="agree" id="agree"
											class="custom-control-input" required=""> <label
											for="agree" class="custom-control-label">이용약관에 동의합니다.<a
											href="#"> 이용약관 보기</a></label>
										<div class="invalid-feedback">이용약관에 동의해주세요.</div>
									</div>
								</div>

								<div class="form-group">
									<div class="custom-checkbox custom-control">
										<div id="html_element" class="g-recaptcha"
											data-sitekey="6LcUGL4UAAAAAHQDXJveqB7FG3uS9ih1mqa2FNF3"
											style="margin: 0 auto;"></div>
									</div>
								</div>

								<div class="form-group m-0">
									<button onclick="finalCheck()" type="submit" class="btn btn-primary btn-block" disabeld>
										가입하기</button>
								</div>
								<div class="mt-4 text-center">
									이미 아이디가 있으신가요? <a href="login.jsp">로그인</a>
								</div>
							</form>
							
							
						</div>
					</div>
					<div class="footer">Copyright &copy; 2020 &mdash; 26.8조</div>
				</div>
			</div>
		</div>
	</section>


	<script>
	var flag = false;
		function isSame(){
			var pw = document.getElementById("password");
			var pwCheck = document.getElementById("passwordCheck");
			var same = document.getElementById("same");
			
			if(pw.value != '' && pwCheck.value != ''){
				if(pw.value == pwCheck.value){
					same.innerHTML ='비밀번호가 일치합니다.';
					same.style.color = 'blue';
					flag = true;
				} else{
					same.innerHTML ='비밀번호가 일치하지 않습니다.';
					console.log("sssss");
					same.style.color = 'red';
					flag = false;
				}
			}
		}
		
		function submitCheck() {
			if (flag === false) {
				return false;
			} else {
				return true;
			}
		}

	</script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="./assets/js/my-login.js"></script>
</body>
</html>