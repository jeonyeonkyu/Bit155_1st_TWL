<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>맥도날드 커스텀</title>
<link rel="shortcut icon" type="image/x-icon" href="./kor/images/favicon.ico">
<link rel="stylesheet" href="./kor/css/common.css?t=2020032601">
<link rel="alternate" href="https://www.mcdonalds.co.kr">
<script type="text/javascript"
	src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=KlH_WAJFCibGDKISxdnW4fsv91xpXwhSRnvf_MZ1KBhOTEiazjpjIS4ueX6DtNSFviyNdvoXRj4TqohBYfhklw"
	charset="UTF-8"></script>
<script src="./kor/js/libs.js"></script>
<script src="./mdelivery.js"></script>
<script src="./kor/js/common.js"></script>
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-15032749-2"></script>
<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'UA-15032749-2');
	</script>
<script>
		$(window).on('load',function()
		{
			// commonJs.menu.TopActive(idx(0~3))	menu : 0 , store : 1 , what's news : 2 , story : 3 서브페이지에 메뉴 순번에 맞춰서 활성화 
			// commonJs.menu.TopDeActive()			활성화 해제
			//commonJs.menu.TopActive( 2 );
			setWebTitle();
		});
		function loadTemplate(id) { return document.getElementById(id).innerHTML;}
		function replaceTemplate(templateStr, data) {
			var result = templateStr;
			for (var key in data) {
				var pattern = new RegExp("{"+key+"}","g");
				result = result.replace(pattern, data[key]);
			}
			return result;
		}
		function makeHtml(id,data){
			return replaceTemplate(loadTemplate(id),data);
		}
		function setWebTitle(){
			
			var title = $("[data-title]").data("title");
			var des = $("[data-desc]").data("desc");
			if(title != undefined && $.trim(title) !="N"){
				 $(document).attr("title",title +" - " + $(document).attr("title"));
			}
			if(des != undefined && $.trim(des) !=""){
				 $("#description").attr("contents",$("#description").attr("contents")+" "+des);
			}
			
		}
		function setCookie( name, value, expiredays ) 
		{ 
				var todayDate = new Date(); 
				todayDate.setDate( todayDate.getDate() + expiredays ); 
				document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
		}
		function getCookie(cname) {
		    var name = cname + "=";
		    var decodedCookie = decodeURIComponent(document.cookie);
		    var ca = decodedCookie.split(';');
		    for(var i = 0; i <ca.length; i++) {
		        var c = ca[i];
		        while (c.charAt(0) == ' ') {
		            c = c.substring(1);
		        }
		        if (c.indexOf(name) == 0) {
		            return c.substring(name.length, c.length);
		        }
		    }
		    return "";
		}
		function altEscapeTag(){
			$("img").each(function (i,ob){
				$(ob).attr("alt",$(ob).attr("alt").replace(/(<([^>]+)>)/ig,""));
			});
		}
	</script>
</head>
<body>

	<div class="wrapper">
		<jsp:include page="./common/nav.jsp"></jsp:include>
		
		
			
		
		<jsp:include page="./common/footer.jsp"></jsp:include>
	</div>
	<!-- //wrapper -->

</body>
</html>
