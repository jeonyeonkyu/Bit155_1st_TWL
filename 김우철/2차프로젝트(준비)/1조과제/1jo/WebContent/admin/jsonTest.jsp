<%@ page language="java" contentType="application/json; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.DAO.Test"%>

<%
//커넥션 선언

Connection conn = null;

try { 
    //드라이버 호출, 커넥션 연결
 	Class.forName("oracle.jdbc.OracleDriver");
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bit","1004");

	ResultSet rs = null; */
    //DB에서 뽑아온 데이터(JSON) 을 담을 객체. 후에 responseObj에 담기는 값
 
String query = "select count(*) from jo_member";


PreparedStatement pstm = conn.prepareStatement(query);
    rs = pstm.executeQuery(query);

    
    JSONArray jsonArray = new JSONArray(); 
    //ajax에 반환할 JSON 생성
     JSONObject responseObj = new JSONObject();

    JSONObject lineObj = null;
    int count = 0;
	while (rs.next()) {
			count = rs.getInt(1);
	    	lineObj = new JSONObject();
        	lineObj.put("count", count);
        	jsonArray.add(lineObj);
    }  

 responseObj.put("dustlist", dustlist); 
     out.print("kwc" + responseObj.toString()); 
    request.setAttribute("mCount", count);

 } catch (Exception e) {

    e.printStackTrace();

} finally {
    if (conn != null) {
        try {
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

} 

	Test test = new Test();

	JSONArray jsonArray = test.getAllMembersJSONArray();

%>
<!DOCTYPE html>

<html>

<head>

<meta charset="utf-8">
<title>Line_Controls_Chart</title>
<meta http-equiv="refresh" content="300">
<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="vendors/themify-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">
<link rel="stylesheet" href="vendors/jqvmap/dist/jqvmap.min.css">


<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<script>
    window.onload = function(){
    	var val = $('#kwc').val();
    	 callAjax();
    	 var queryObject;
    	 function callAjax(){
    		 console.log("여긴오냐?");
    		 $.ajax({
    			 type:'POST',
    			 data:"",
    			 dataType : 'json',
    			 success : function(data){
    				 queryObject = eval('('+JSON.stringify(data,null,2)+')');
    				 console.log("queryObject : " + queryObject);
    			 },
    			 error : function(data){}
    		 })
    	 }
    	
    }
    </script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>

	<br>
	<br>
	<br>
	<br>
	<br> 케케 : ${requestScope.mCount}
	풉풉 : <%=jsonArray %>

	<div class="col-sm-6 col-lg-3">
		<div class="card text-white bg-flat-color-1">
			<div class="card-body pb-0">
				<div class="dropdown float-right">
					<button
						class="btn bg-transparent dropdown-toggle theme-toggle text-light"
						type="button" id="dropdownMenuButton1" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<div class="dropdown-menu-content">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a> <a
								class="dropdown-item" href="#">Something else here</a>
						</div>
					</div>
				</div>
				<h4 class="mb-0">
					<%-- <span class="count">${requestScope.mCount}</span> --%>
					<span id="kwc" class="count">${requestScope.mCount}</span>
					<!-- 총 회원수 -->
				</h4>
				<p class="text-light">Members online</p>

				<div class="chart-wrapper px-0" style="height: 70px;" height="70">
					<canvas id="widgetChart1"></canvas>
				</div>

			</div>

		</div>
	</div>

</body>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<!-- google charts -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://www.google.com/jsapi"></script>
<script src="vendors/jquery/dist/jquery.min.js"></script>
<script src="vendors/popper.js/dist/umd/popper.min.js"></script>
<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="assets/js/main.js"></script>


<script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
<script src="assets/js/dashboard.js"></script>
<script src="assets/js/widgets.js"></script>
<script src="vendors/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script>
        (function($) {
            "use strict";

            jQuery('#vmap').vectorMap({
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: ['#1de9b6', '#03a9f5'],
                normalizeFunction: 'polynomial'
            });
        })(jQuery);
    </script>
</html>