<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

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
	//jquery �� �����ϰ� ��ȿ�� check �ϱ�
	$(function() {
		$('#joinForm').submit(function() {
			//alert("����");
			if ($('#id').val() == "") { // ���̵� �˻�
				alert('ID�� �Է��� �ּ���.');
				$('#id').focus();
				return false;
			} else if ($('#password').val() == "") { // ��й�ȣ �˻�
				alert('��й�ȣ�� �Է��� �ּ���.');
				$('#password').focus();
				return false;
			} else if ($('#passwordCheck').val() == "") { // ��й�ȣ �˻�
				alert('��й�ȣ Ȯ���� �Է��� �ּ���.');
				$('#passwordCheck').focus();
				return false;
			} else if ($('#name').val() == "") { // �̸� �˻�
				alert('name�� �Է��� �ּ���.');
				$('#name').focus();
				return false;
			} else if ($('#email').val() == "") { // ���� �˻�
				alert('email�� �Է��� �ּ���.');
				$('#email').focus();
				return false;
			} else if ($('#phone').val() == "") { // �����ȣ
				alert('phone�� �Է��� �ּ���.');
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
								<h4 class="card-title">ȸ������</h4>
							</div>
							
							<!-- class="my-login-validation" -->
							<form action="registerAction.jsp" method="post" name="joinForm"
								id="joinForm" >
								<div class="form-group">
									<label for="id">���̵�</label> <input id="id" type="text"
										class="form-control" name="id">
									<!-- <div class="invalid-feedback">���̵� �Է����ּ���.</div> -->
								</div>
								
								<div class="form-group">
									<label for="password">��й�ȣ</label> <input id="password"
									onchange="isSame()" type="password" class="form-control" name="password">
									<!-- <div class="invalid-feedback">��й�ȣ�� �Է����ּ���.</div>  -->
								</div>

								<div class="form-group">
									<label for="password">��й�ȣ Ȯ��</label> <input id="passwordCheck"
										onchange="isSame()" type="password" class="form-control" name="passwordCheck">
								<!-- 	<div class="invalid-feedback">��й�ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� �Է����ּ���.</div> -->
									<div id="same"></div>
									
								</div>

								<div class="form-group">
									<label for="name">�̸�</label> <input id="name" type="text"
										class="form-control" name="name" >
							<!-- 		<div class="invalid-feedback">�̸��� �Է����ּ���.</div> -->
								</div>

								<div class="form-group">
									<label for="email">�̸��� �ּ�</label> <input id="email"
										type="email" class="form-control" name="email">
									<!-- <div class="invalid-feedback">����� �� ���� �̸��� �ּ� �Դϴ�.</div> -->
								</div>

								<div class="form-group">
									<label for="password">�ڵ��� ��ȣ (-����)</label> <input id="phone"
										type="password" class="form-control" name="phone">
									<!-- <div class="invalid-feedback">�ڵ��� ��ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ�
										�Է����ּ���.</div> -->
								</div>


								<div class="form-group">
									<div class="custom-checkbox custom-control">
										<input type="checkbox" name="agree" id="agree"
											class="custom-control-input" required=""> <label
											for="agree" class="custom-control-label">�̿����� �����մϴ�.<a
											href="#"> �̿��� ����</a></label>
										<div class="invalid-feedback">�̿����� �������ּ���.</div>
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
										�����ϱ�</button>
								</div>
								<div class="mt-4 text-center">
									�̹� ���̵� �����Ű���? <a href="login.jsp">�α���</a>
								</div>
							</form>
							
							
						</div>
					</div>
					<div class="footer">Copyright &copy; 2020 &mdash; 26.8��</div>
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
					same.innerHTML ='��й�ȣ�� ��ġ�մϴ�.';
					same.style.color = 'blue';
					flag = true;
				} else{
					same.innerHTML ='��й�ȣ�� ��ġ���� �ʽ��ϴ�.';
					console.log("sssss");
					same.style.color = 'red';
					flag = false;
				}
			}
		}
		
		function finalCheck(){
			if(flag == false){
				alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.')
				location.href = "./register.jsp";
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