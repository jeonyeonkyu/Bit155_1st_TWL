<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>네이버 : 로그인</title>
	<link rel="stylesheet" type="text/css" href="./login/css/global/desktop/w_20200211.css?20200211">
<script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=8IoRpFPE5InNxVSzJL479FtJhPD3omkc8B4p8gKn0AYtz395PJGqfq87hD2se47xNIg4SRYzxMBMW5QfDEIyhiRyf7NOMwCai5_D3yudJqBcrbV-SPoZn8Tfp0ZrK-7B" charset="UTF-8"></script></head>
<body class="chrome">
<div id="wrap">
    <div id="u_skip">
        <a href="#content" id="u_skip_anchor"><span>본문으로 바로가기</span></a>
    </div>
	<!-- header -->
	<div id="header">
		<h1><a href="http://www.naver.com" class="sp h_logo" id="log.naver"><span class="blind">NAVER</span></a></h1>
		<div class="lang">
			<select id="locale_switch" name="locale_switch" title="언어선택" class="sel">
				<option value="ko_KR" >한국어</option>
				<option value="en_US" >English</option>
				<option value="zh-Hans_CN" >中文(简体)</option>
				<option value="zh-Hant_TW" >中文(台灣)</option>
			</select>
		</div>
	</div>
	<!-- //header -->
	<!-- container -->
	<div id="container">
		<!-- content -->
		<div id="content">
			<div class="title" aria-live="assertive">
				<p></p>
			</div>
				<form id="frmNIDLogin" name="frmNIDLogin" target="_top" AUTOCOMPLETE="off" action="https://nid.naver.com/nidlogin.login" method="POST">
				<input type="hidden" id="localechange" name="localechange" value="">
				<input type="hidden" name="encpw" id="encpw" value="">
<input type="hidden" name="enctp" id="enctp" value="1">
<input type="hidden" name="svctype" id="svctype" value="1">
<input type="hidden" name="smart_LEVEL" id="smart_LEVEL" value="1">
<input type="hidden" name="bvsd" id="bvsd" value="">
<input type="hidden" name="encnm" id="encnm" value="">
<input type="hidden" name="locale" id="locale" value="ko_KR">
<input type="hidden" name="url" id="url" value="https://www.naver.com">

				<fieldset class="login_form">
					<legend class="blind">로그인</legend>
					<div class="id_area">
						<div class="input_row" id="id_area">
							<span class="input_box">
								<label for="id" id="label_id_area" class="lbl">아이디</label>
								<input type="text" id="id" name="id" accesskey="L" placeholder="아이디" class="int" maxlength="41" value="">
							</span>
							<button type="button" disabled="" title="delete" id="id_clear" class="wrg">삭제</button>
						</div>
						<div class="error" id="err_empty_id" style="display:none" aria-live="assertive"></div>
					</div>
					<div class="pw_area">
						<div class="input_row" id="pw_area">
							<span class="input_box">
								<label for="pw" id="label_pw_area"  class="lbl">비밀번호</label>
								<input type="password" id="pw" name="pw" placeholder="비밀번호" class="int" maxlength="16">
							</span>
							<button type="button" disabled="" title="delete" id="pw_clear" class="wrg">삭제</button>
							<div class="ly_v2" id="err_capslock" style="display:none;">
								<div class="ly_box">
									<p><strong>Caps Lock</strong>이 켜져 있습니다.</p>
								</div>
								<span class="sp ly_point"></span>
							</div>
						</div>
						<div class="error" id="err_empty_pw" style="display:none" aria-live="assertive"></div>
					</div>

					<input type="submit" title="로그인" alt="로그인" value="로그인" class="btn_global" id="log.login">
					<div class="check_info">
						<div class="login_check">
							<span class="login_check_box">
								<input type="checkbox" id="login_chk" name="nvlong" class=""  value="off" />
								<label for="login_chk" id="label_login_chk" class="sp ">로그인 상태 유지</label>
							</span>
							<div class="ly_v2" id="persist_usage" style="display:none;">
								<div class="ly_box">
									<p>개인정보 보호를 위해 <strong>개인 PC에서만 사용하세요.</strong>&nbsp;&nbsp; &nbsp;&nbsp;<a href="https://help.naver.com/support/contents/contents.nhn?serviceNo=532&categoryNo=1523" target="_blank" class="sp btn_check_help">도움말보기</a></p>
								</div>
								<span class="sp ly_point"></span>
							</div>
						</div>
						<div class="pc_check">
							<span class="ip_check">
								<a href="/login/ext/help_ip3.html" target="_blank" id="ipguide" title="" >IP보안</a>
								<span class="ip_ch">
									<input type="checkbox" id="ip_on" value="off" class=""/>
									<label for="ip_on" id="label_ip_on" class="sp "><span class="blind">on</span></label>
								</span>
							</span>
							<span class="bar">|</span>
							<div class="dis_di">
								<a href="#" id="log.otn" title="일회용 로그인">일회용 로그인</a><a href="#" id="log.otnhelp" title="도움말" class="btn_help_cover"><span class="sp btn_help"></span><span class="blind">도움말</span></a>
								<div class="ly" id="onetime_usage" style="display:none;">
									<div class="ly_box">
										<p>네이버앱에서 생성된 일회용 로그인 번호를 입력하면, 앱에 로그인된 계정으로 PC에서 로그인할 수 있어요. 아이디/비밀번호를 입력하지 않아 간편하고 더욱 안전합니다.</p>
									</div>
									<span class="sp ly_point"></span>
								</div>
							</div>
						</div>
						<div id="nudge_tooltip">
							<a href="#" class="diaper_banner">								
								<span class="nudge"><img src="https://ssl.pstatic.net/static/nid/login/nudge_bar.png" width="255" height="30" alt="PC방처럼 여러 사람이 쓰는 PC라면?"></span>
								<button type="button" aria-label="닫기" class="nudge_close" id="nudge_close" style="width:10px;height:10px;"></button>
							</a>
						</div>
					</div>
				</fieldset>
			</form>
			<div class="position_a">
				<div class="find_info">
					<a target="_blank" id="idinquiry" href="https://nid.naver.com/user2/api/route.nhn?m=routeIdInquiry&lang=ko_KR">아이디 찾기</a> <span class="bar" aria-hidden="true">|</span> <a target="_blank" id="pwinquiry" href="https://nid.naver.com/user2/api/route.nhn?m=routePwInquiry&lang=ko_KR">비밀번호 찾기</a> <span class="bar" aria-hidden="true">|</span> <a target="_blank" id="join" href="https://nid.naver.com/user2/V2Join.nhn?m=agree&lang=ko_KR">회원가입</a>
				</div>
			</div>
			<a href="https://m.site.naver.com/0vK5N" target="_blank" class="otp_step_banner" id="log.banner">
				<span class="bill_img_pc"></span>
				<span class="blind">
					<strong>네이버 2단계 인증</strong>
					내가 허락할 때만 로그인 되도록
					늦기 전에 사용하세요~
				</span>
			</a>
		</div>
		<!-- //content -->
	</div>
	<!-- //container -->
	<!-- footer -->
	<div id="footer">
		<ul>
		<li><a target="_blank" href="http://www.naver.com/rules/service.html" id="fot.agreement">이용약관</a></li>
		<li><strong><a target="_blank" href="http://www.naver.com/rules/privacy.html" id="fot.privacy">개인정보처리방침</a></strong></li>
		<li><a target="_blank" href="http://www.naver.com/rules/disclaimer.html" id="fot.disclaimer">책임의 한계와 법적고지</a></li>
		<li><a target="_blank" href="https://help.naver.com/support/service/main.nhn?serviceNo=532" id="fot.help">회원정보 고객센터</a></li>
		</ul>
		<address><em><a target="_blank" href="http://www.navercorp.com" class="logo" id="fot.naver"><span class="blind">naver</span></a></em><em class="copy">Copyright</em> <em class="u_cri">&copy;</em> <a target="_blank" href="http://www.navercorp.com" class="u_cra" id="fot.navercorp">NAVER Corp.</a> <span class="all_r">All Rights Reserved.</span></address>	
	</div>
	<!-- //footer -->
</div>
<input type="hidden" id="nclicks_nsc" name="nclicks_nsc" value="nid.login_kr">
<input type="hidden" id="nid_buk" name="nid_buk" value="exist">
<input type="hidden" id="ncaptchaSplit" name="ncaptchaSplit" value="none">
<input type="hidden" id="id_error_msg" name="id_error_msg" value="아이디를 입력해주세요.">
<input type="hidden" id="pw_error_msg" name="pw_error_msg" value="비밀번호를 입력해주세요.">
<input type="hidden" id="locale" name="locale" value="ko_KR">
<input type="hidden" id="adult_surl_v2" name="adult_surl_v2" value="">
<script type="text/javascript" src="./login/js/bvsd.1.3.4.min.js"></script>
<script type="text/javascript" src="./login/js/default/common200225.js?20200424"></script>
<script type="text/javascript" src="./login/js/default/default.js?20200424"></script>
<div id="nv_stat" style="display:none;">20</div>
</body>
</html>
