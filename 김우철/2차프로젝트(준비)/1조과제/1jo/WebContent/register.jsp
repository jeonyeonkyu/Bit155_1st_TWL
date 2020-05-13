<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="author" content="Kodinger">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./assets/css/my-login.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body class="my-login-page">
    <section class="h-100">
        <div class="container h-100">
            <div class="row justify-content-md-center h-100">
                <div class="card-wrapper">
                    <div class="brand">
                        <a href="#"> <img src="./assets/img/thumbs.svg" alt="bootstrap 4 login page"></a>
                    </div>
                    <div class="card fat">
                        <div class="card-body">
                            <div class="mx-auto"> sssssssssss
                                <h4 class="card-title">회원가입</h4>
                            </div>

                            <!-- class="my-login-validation" -->
                            <form action="join.do" method="post" name="joinForm" id="joinForm"
                                onsubmit="return submitCheck();">
                                <div class="form-group">
                                    <label for="id">아이디</label> <input id="id" type="text" class="form-control"
                                        name="id">
                                    <div id="idFeedback" class="feedback"></div>
                                </div>

                                <div class="form-group">
                                    <label for="password">비밀번호</label> <input id="password" onchange="isSame()"
                                        type="password" class="form-control" name="password">
                                    <div id="passwordFeedback" class="feedback"></div>
                                </div>

                                <div class="form-group">
                                    <label for="password">비밀번호 확인</label> <input id="passwordCheck" onchange="isSame()"
                                        type="password" class="form-control" name="passwordCheck">
                                    <div id="same"></div>
                                </div>

                                <div class="form-group">
                                    <label for="name">이름</label> <input id="name" type="text" class="form-control"
                                        name="name">
                                    <div id="nameFeedback" class="feedback"></div>
                                </div>

                                <div class="form-group">
                                    <label for="email">이메일 주소</label> <input id="email" type="email"
                                        class="form-control" name="email">
                                    <div id="emailFeedback" class="feedback"></div>
                                </div>

                                <div class="form-group">
                                    <label for="address">주소</label>
                                    <input type="text" style="display: none;" class="form-control" id="sample3_postcode"
                                        placeholder="우편번호">
                                    <input type="text" class="form-control" id="address" name="address"
                                        placeholder="주소"><br>
                                    <input type="text" class="form-control mb-4" name="detailAddress" id="detailAddress"
                                        placeholder="상세주소">
                                    <input type="button" class="form-control" onclick="sample3_execDaumPostcode()"
                                        value="검색"><br>
                                    <input style="display: none;" type="text" id="sample3_extraAddress"
                                        placeholder="참고항목">
                                    <!-- <input id="address" type="address" class="form-control" name="address"> -->
                                    <div id="wrap"
                                        style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                                        <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap"
                                            style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1"
                                            onclick="foldDaumPostcode()" alt="접기 버튼">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="text">핸드폰 번호 (-제외)</label> <input id="phone" type="text"
                                        class="form-control" name="phone">
                                    <!-- <div class="invalid-feedback">핸드폰 번호가 일치하지 않습니다. 다시
                                        입력해주세요.</div> -->
                                    <div id="phoneFeedback" class="feedback"></div>
                                </div>


                                <div class="form-group">
                                    <div class="custom-checkbox custom-control">
                                        <input type="checkbox" name="agree" id="agree" class="custom-control-input"
                                            required=""> <label for="agree" class="custom-control-label">이용약관에 동의합니다.<a
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
                                    <button type="submit" id="joinButton" class="btn btn-primary btn-block">
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

    <script type="text/javascript"> //jquery 유효성 check 

        //1.공백 검사(alert)
        $(function () {

            $('#joinForm').submit(function () {
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
                } else if ($('#address').val() == "") { // 주소 검사
                    alert('주소를 입력해 주세요.');
                    $('#email').focus();
                    return false;
                } else if ($('#detailAddress').val() == "") { // 상세주소 검사
                    alert('상세주소를 입력해 주세요.');
                    $('#email').focus();
                    return false;
                }
                else if ($('#phone').val() == "") { // 우편번호
                    alert('phone를 입력해 주세요.');
                    $('#phone').focus();
                    return false;
                }

            });
        });

        var regFlag = [false, false, false, false, false];
        //2.정규표현식 검사
        $(function () {
            $("#idFeedback").hide();
            $("#passwordFeedback").hide();
            $("#nameFeedback").hide();
            $("#emailFeedback").hide();

             var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
            //아이디 : 영문 대소문자,숫자,'_,-'만 입력가능, 5~20자리
            // var passwordCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
            //비밀번호 : 영문 대소문자, 숫자, 특수문자를 하나이상 포함하여 8~16자
            var passwordCheck = RegExp(/(?=.*[a-z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,16}$/);
            //8~16자 사이에 적어도 하나의 영어대문자,특수문자가 포함

            var nameCheck = RegExp(/^[가-힣]{2,6}$/);
            //이름 : 한글, 2~6자
            var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
            //이메일 : aa@aa.aa
            var phoneCheck = RegExp(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/); 
         

            $('.feedback').css('color', 'red');
            $('#id').keyup(function () {
                if (!userIdCheck.test($('#id').val())) { //정규표현식 refuse
                    regFlag[0] = false;
                    $("#idFeedback").show();
                    $('#idFeedback').text('영문 대소문자,숫자,특수기호(_,-),5~20자리 입력가능')
                } else {
                    regFlag[0] = true;
                    $("#idFeedback").hide();
                }
            });
            $('#password').keyup(function () {
                if (!passwordCheck.test($('#password').val())) { //정규표현식 refuse
                    regFlag[1] = false;
                    $("#passwordFeedback").show();
                    $('#passwordFeedback').text('하나이상의 특수문자,8~16자')
                } else {
                    regFlag[1] = true;
                    $("#passwordFeedback").hide();
                }
            });
            $('#name').keyup(function () {
                if (!nameCheck.test($('#name').val())) { //정규표현식 refuse
                    regFlag[2] = false;
                    $("#nameFeedback").show();
                    $('#nameFeedback').text('한글, 2~6자 입력가능')
                } else {
                    regFlag[2] = true;
                    $("#nameFeedback").hide();
                }
            });
            $('#email').keyup(function () {
                if (!emailCheck.test($('#email').val())) { //정규표현식 refuse
                    regFlag[3] = false;
                    $("#emailFeedback").show();
                    $('#emailFeedback').text('*@*.* 형식 입력가능')
                } else {
                    regFlag[3] = true;
                    $("#emailFeedback").hide();
                }
            });
            $('#phone').keyup(function () {
                if (!phoneCheck.test($('#phone').val())) { //정규표현식 refuse
                    regFlag[4] = false;
                    $("#phoneFeedback").show();
                    $('#phoneFeedback').text('01012341234 입력가능(-제외)')
                } else {
                    regFlag[4] = true;
                    $("#phoneFeedback").hide();
                }
            });
        });

        // function regCheck(e) {
        //     for (var index in regFlag) {
        //         if ($('#id').val() != "" && $('#password').val() != "" && $('#name').val() != "" && $('#email').val() != "" && regFlag[index] === false) {
        //             alert('정규표현식을 맞춰주세요.')
        //             // e.preventDefault();
        //             e.stopPropagation();
        //             break;
        //         }
        //     }
        // }

        var flag = false;
        var pw = document.getElementById("password");
        var pwCheck = document.getElementById("passwordCheck");
        var same = document.getElementById("same");
        function isSame() {
            if (pw.value != '' && pwCheck.value != '') {
                if (pw.value == pwCheck.value) {
                    same.innerHTML = '비밀번호가 일치합니다.';
                    same.style.color = 'blue';
                    flag = true;
                } else {
                    same.innerHTML = '비밀번호가 일치하지 않습니다.';
                    console.log("sssss");
                    same.style.color = 'red';
                    flag = false;
                }
            }
        }

        function submitCheck() {
            if (flag === false && pw.value != '') {
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            } else if (regFlag[0] === false || regFlag[1] === false || regFlag[2] === false || regFlag[3] === false || regFlag[4] === false) {
                alert('정규표현식을 맞춰주세요.')
                return false;
            } else {
                return true;
            }
        }

    </script>

    <!-- <script>
        var flag = false;
        var pw = document.getElementById("password");
        var pwCheck = document.getElementById("passwordCheck");
        var same = document.getElementById("same");
        function isSame() {
            if (pw.value != '' && pwCheck.value != '') {
                if (pw.value == pwCheck.value) {
                    same.innerHTML = '비밀번호가 일치합니다.';
                    same.style.color = 'blue';
                    flag = true;
                } else {
                    same.innerHTML = '비밀번호가 일치하지 않습니다.';
                    console.log("sssss");
                    same.style.color = 'red';
                    flag = false;
                }
            }
        }

        function submitCheck() {
            if (flag === false && pw.value != '') {
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            } else {
                return true;
            }
        }

    </script> -->

    <!-- 다음주소 API 우편번호 -->
    <script>
        // 우편번호 찾기 찾기 화면을 넣을 element
        var element_wrap = document.getElementById('wrap');

        function foldDaumPostcode() {
            // iframe을 넣은 element를 안보이게 한다.
            element_wrap.style.display = 'none';
        }

        function sample3_execDaumPostcode() {
            // 현재 scroll 위치를 저장해놓는다.
            var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
            new daum.Postcode({
                oncomplete: function (data) {
                    // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample3_extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("sample3_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample3_postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddress").focus();

                    // iframe을 넣은 element를 안보이게 한다.
                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                    element_wrap.style.display = 'none';

                    // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                    document.body.scrollTop = currentScroll;
                },
                // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                onresize: function (size) {
                    element_wrap.style.height = size.height + 'px';
                },
                width: '100%',
                height: '100%'
            }).embed(element_wrap);

            // iframe을 넣은 element를 보이게 한다.
            element_wrap.style.display = 'block';
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    <script src="./assets/js/my-login.js"></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>

</html>