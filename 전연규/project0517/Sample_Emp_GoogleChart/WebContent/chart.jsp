<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.Dao" %>
<%@page import="net.sf.json.JSONArray"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
    src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    var queryObject = "";
    var queryObjectLen = "";
    
    
    google.charts.load('current', {
        packages : [ 'corechart', 'bar' ]
    });
    $(function(){   
    	<% Dao dao= new Dao();%>
    	   $("#select").click(function(){
    	    	if($("#select").val()=="1"){
    	    	queryObject =<%=dao.getAllSal()%>;
    	    	}    	    	
    	    	else if($("#select").val()=="10"){
    	    		queryObject =<%=dao.getSal(10)%>;
    	    	}else if($("#select").val()=="20"){
    	    		queryObject =<%=dao.getSal(20)%>;
    	    	}else if($("#select").val()=="30"){
    	    		queryObject =<%=dao.getSal(30)%>;
    	    	}      	 
    	    	google.charts.setOnLoadCallback(drawMultSeries);
    	    });    	
    });

  
    function drawMultSeries() {
        
         var data = new google.visualization.DataTable();
         data.addColumn('string', 'ename');
         //data.addColumn('number', 'deptno');
         data.addColumn('number', 'sal');        
 
        //alert('data생성');
        for (var i = 0; i < queryObject.length; i++) {
            var ename = queryObject[i].ename;
            var deptno = queryObject[i].deptno;
            var sal = queryObject[i].sal;
            //alert(city + amount + per);
             data.addRows([
                            [ename,sal]
                        ]);
 
        }
 
        var options = {
            title : 'Emp 급여정보',
            width: 600,
            height:400,
            chartArea : {
                width : '50%'
            },
            hAxis : {
                title : 'Salary',
                minValue : 0
            },
            vAxis : {
                title : 'Name'
            }
        };
        var chart = new google.visualization.BarChart(document
                .getElementById('chart_div'));
        chart.draw(data, options);
    }
    
</script>
</head>
<body>
<select id="select">
<option value="1" checked>전체조회</option>
<option value="10">10번 부서</option>
<option value="20">20번 부서</option>
<option value="30">30번 부서</option>
</select>
    <div id="chart_div"></div>
</html>