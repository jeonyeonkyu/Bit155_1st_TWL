<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<header class="header"><!-- 상단 고정 fixed 클래스 추가, 메뉴의 depth1 오버시 open 클래스 추가 -->

	<div class="headArea">
				<strong class="hLogo"><a href="/" class="logo" title="메인으로 이동"><img src="./kor/images/common/logo.png" alt="맥도날드"></a></strong>
				<nav class="hMenu">
					<div class="menu">
						<ul class="depth1">
							<li><!-- li 오버시 on 클래스 추가 -->
								<a href="javascript:gotoMenu(1);" class="dth1 ">Menu</a><!-- 현재페이지 메뉴에 current 클래스 추가 -->
								<ul class="depth2">
									<li><a href="javascript:gotoMenu(1);" class="dth2">버거</a></li>
									<li><a href="javascript:gotoMenu(3);" class="dth2">맥모닝</a></li>
									<li><a href="javascript:gotoMenu(5);" class="dth2">해피밀</a></li>
									<li><a href="javascript:gotoMenu(7);" class="dth2">사이드 &amp; 디저트</a></li>
									<li><a href="javascript:gotoMenu(9);" class="dth2">맥카페 &amp; 음료</a></li>
								</ul>
							</li>
							<li>
								<a href="./kor/story/main.do" class="dth1  ">Story</a>
								<ul class="depth2">
									<li><a href="./kor/story/intro/brandintro.do" class="dth2">브랜드 소개</a></li>
									<li><a href="./kor/story/society/list.do" class="dth2">사회적 책임과 지원</a></li>
									<li><a href="./kor/story/competition/farmToRestaurant.do" class="dth2">맥도날드 경쟁력</a></li>
									<li><a href="./kor/story/people/crew.do" class="dth2">맥도날드 사람들</a></li>
								</ul>
							</li>
							<li>
								<a href="./kor/store/main.do" class="dth1 ">Community</a>
								<ul class="depth2">
									<li><a href="#" class="dth2">공지사항</a></li>
									<li><a href="#" class="dth2">리뷰게시판</a></li>
								</ul>
							</li>
							<li>
								<a href="/kor/promotion/list.do" class="dth1">MyPage</a>
								<ul class="depth2">
									<li><a href="#" class="dth2">계정설정</a></li>
									<li><a href="#" class="dth2">주문조회</a></li>
								    <li><a href="#" class="dth2">문의하기</a></li> 
								    <li><a href="#" class="dth2">관리자페이지</a></li> 
								</ul>
							</li>
							
						</ul>
					</div>
					<!-- //menu -->
					<form id="commonSearchForm" method="post">
					<div class="util">
						<a href="./register.jsp" class="recruit" title="회원가입">회원가입</a>
						<a href="./login.jsp" class="lang" title="로그인">로그인</a>
					</div>
					</form>
					<!-- //util -->
				</nav>
			</div>
			
			
		<form id="gotoMenuForm" method="post">
		<input type="hidden" name="sub_category_seq" id="gotoform_sub_category_seq">
		</form>
	<script>
			function gotoMenu(val){
				$("#gotoform_sub_category_seq").val(val);
				$("#gotoMenuForm").attr("action","/kor/menu/list.do");
				$("#gotoMenuForm").submit();
			}
			function gotoCommonSearch(){
				if($.trim($("#commonSearchWord").val())==""){
					alert("검색어을 입력해 주세요");
					$("#commonSearchWord").focus();
				}else{
					$("#commonSearchForm").attr("action","/kor/search.do");
					$("#commonSearchForm").submit();
				}
			}
	</script>
		</header>
		<!-- //header -->