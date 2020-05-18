<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/common/head.jsp" />
<style>
p {
    white-space: normal/pre/nowrap/pre-line/pre-wrap;
}
</style>
</head>
<body class="">
    <div class="wrapper">
        <jsp:include page="/WEB-INF/common/sidebar.jsp" />
        <div class="main-panel">
            <jsp:include page="/WEB-INF/common/nav.jsp" />
            <div class="content">
                <div class="row"><br><br><br><br><br></div>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6" align="center">
                        <h3 style="margin-bottom: 1px">#TEAM 4</h3>
                        <h5>@EMP MANAGEMENT SYSTEM</h5>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <form name="login" action="login.do"
                                        method="get">
                                        <div class="row">
                                            <div class="col-md-11 pr-md-1">
                                                <div class="form-group">
                                                    <label>ID</label> <input type="text" class="form-control"
                                                        placeholder="ID" name = "id" id ="id">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-11 pr-md-1">
                                                <div class="form-group">
                                                    <label>PASSWORD</label> <input type="password"
                                                        class="form-control" placeholder="PASSWORD" name = "pwd" id="pwd">
                                                </div>
                                            </div>
                                        </div>
                                        <center>
                                            <button type="submit" class="btn btn-fill btn-primary">로그인</button>
                                        </center>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <jsp:include page="/WEB-INF/common/footer.jsp" />
        </div>
    </div>

</body>
</html>