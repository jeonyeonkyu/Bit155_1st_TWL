<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	 
	$(document).ready(function(){
		$('#ajaxBtn').click(function(){
			 var array = new Array();
			     array[0] = "a";
			     array[1] = "b";
			 $.ajax(
					 { //json  방식
						type : "GET",
						url  : "json.kosta",
						//data : "command=AjaxTest&name=java&array="+array,
						data :{"command":"Ajax","name":"java","array":array},
						success : function(data){  //서버 {"menu",list}   //data > {}
							console.log(data);
						} 
					 } 
			       )    
		});
		
		//////////
		 $("#ajaxBtn2").click(function() {
               var string = ["abc","def"];
               
           $.ajax({
               url: "json.kosta2",
               type: "GET",           
               data: {"string":string},
               success: function(data) {                   
                   var as = eval(data);
                   alert("data:"+as[0]+"/"+as[1]);
               },
               error: function(msg, error) {
                   alert(error);
               }
           });   
     });// end .click()

	});

	//'[{"Product" : "Mouse", "Maker":"Samsung", "Price":23000},{"Product" : "KeyBoard", "Maker":"LG", "Price":12000}]';
	//'{"Product" : "Mouse", "Maker":"Samsung", "Price":23000}';
	/*  
	   var json = new Object();
	   json.Product = "Mouse";
	   json.Maker = "Samsung"; .....
	   
	   JSON.stringify({"Product" : "Mouse", "Maker":"Samsung", "Price":23000})
	   json 타입의 문자열을 만들어서 넘겨준다
	   
	   data:{jsonData:JSON.stringify({"Product" : "Mouse", "Maker":"Samsung", "Price":23000})}
	   
	   Servlet 코드
	   String json = request.getParameter("jsonData");
	   JSONObject json1 = JSONObject.fromObject(json);
	   //또는 JSON.parse()
	       만약 DTO 객체가 있다면
	   DTO d = new DTO(); 
	   d.setName((String)json1.get("Product"));
	*/			
	</script>
</head>
<body>
	<input type="button" id="ajaxBtn" value="전송하기">
	<br>
	<input type="button" id="ajaxBtn2" value="전송하기">
	<br>
	<input type="button" id="ajaxBtn3" value="전송하기">
</body>
</html>