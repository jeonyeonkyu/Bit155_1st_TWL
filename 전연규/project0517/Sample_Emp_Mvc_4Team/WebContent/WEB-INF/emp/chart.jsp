<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/common/head.jsp" />
<!-- Styles -->
<style>
#container {
	min-width: 320px;
	max-width: 600px;
	margin: 0 auto;
}
</style>

<!-- Resources -->

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<script type="text/javascript">

</script>

</head>
<body class="">
	<div class="wrapper">
		<jsp:include page="/WEB-INF/common/sidebar.jsp" />
		<div class="main-panel">
			<jsp:include page="/WEB-INF/common/nav.jsp" />
			<div class="content" style="font-color: white">
				<div id="container"></div>
				<br><br>
				<button id="plain">Plain</button>
				<button id="inverted">Inverted</button>
				<button id="polar">Polar</button>

			</div>
			<jsp:include page="/WEB-INF/common/footer.jsp" />
		</div>
	</div>
<script>
var i = "${requestScope.emplist}";
console.log(i);
var res = i.substring(1, i.length - 1)
console.log(res);
var arr = res.split(',');
var name1 = [];
var sal = [];
console.log(arr.length);
for(var i = 0; i < arr.length; i++){
	if(i%2 == 0){
		sal.push(arr[i]);
	} else {
		name1.push(Number(arr[i]));
	}
		
}
console.log(name1);
console.log(sal);
var chart = Highcharts.chart('container', {

	  title: {
	    text: 'Salary'
	  },

	  subtitle: {
	    text: 'emp'
	  },

	  xAxis: {
	    categories: sal
	  },

	  series: [{
	    type: 'column',
	    colorByPoint: true,
	    data: name1,
	    showInLegend: false
	  }]

	});


	$('#plain').click(function () {
	  chart.update({
	    chart: {
	      inverted: false,
	      polar: false
	    },
	    subtitle: {
	      text: 'Plain'
	    }
	  });
	});

	$('#inverted').click(function () {
	  chart.update({
	    chart: {
	      inverted: true,
	      polar: false
	    },
	    subtitle: {
	      text: 'Inverted'
	    }
	  });
	});

	$('#polar').click(function () {
	  chart.update({
	    chart: {
	      inverted: false,
	      polar: true
	    },
	    subtitle: {
	      text: 'Polar'
	    }
	  });
	});
</script>
</body>
</html>