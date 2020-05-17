<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Cos Blog</title>
  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="<%=request.getContextPath()%>/css/blog-home.css" rel="stylesheet">
  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/validation.js"></script>
</head>
<body>
<!-- Navigation -->
<jsp:include page="/include/navigation.jsp"/>

<div class="container">
	<!-- Login Form -->
	<div class="row">
  <!-- Blog Entries Column -->
	  <div class="col-md-8 my-order">
		<div class="content-section">
			<form method="POST" action="<%=request.getContextPath()%>/member?cmd=member_join" onsubmit="return joinCheck(this)">
				<fieldset class="form-group">
					<legend class="border-bottom mb-4">Join</legend>
					<div class="form-group">
							<label class="form-control-label">ID</label>
							<input class="form-control form-control-lg" type="text" name="id" maxlength="20" required autofocus>
					</div>
					<div class="form-group">
							<label class="form-control-label">Password</label>
							<input class="form-control form-control-lg" type="password" name="password" maxlength="20" required>
					</div>
					<div class="form-group">
							<label class="form-control-label">Confirm_password</label>
							<input class="form-control form-control-lg" type="password" name="confirm" maxlength="20" required>
					</div>
					<div class="form-group">
							<label class="form-control-label">Username</label>
							<input class="form-control form-control-lg" type="text" name="username" maxlength="20" required>
					</div>
					<div class="form-group">
							<label class="form-control-label">Email</label>
							<input class="form-control form-control-lg" type="email" name="email" maxlength="50" required>
					</div>
					<div class="border-top pt-3">
				  	<small class="text-muted">
					  	Already Have An Account? <a class="ml-2" href="/Blog/member?cmd=loginForm">login</a>
				  	</small>
			  	</div>
					<div class="form-group">
							<button class="btn btn-outline-info" type="submit">Sign in</button>
					</div>		
				</fieldset>
			</form>
		</div>
		</div>

	<!-- SideBar -->
  <jsp:include page="/include/sidebar.jsp"/>
  </div>
  <!-- ./row -->
  </div>
<!-- ./container -->
</body>
</html>