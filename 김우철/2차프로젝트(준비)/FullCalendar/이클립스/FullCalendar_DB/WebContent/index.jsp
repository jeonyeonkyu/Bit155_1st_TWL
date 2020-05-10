<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- https://kutar37.tistory.com/entry/FullCalendar-%EC%98%88%EC%A0%9C%EB%8D%B0%EB%AA%A8  -->
<!DOCTYPE html>
<html lang='en'>

<head>
<meta charset="UTF-8">
<title>ì»¤ì¤í</title>
<link rel='stylesheet' href='./index.css' />
<link rel="stylesheet" href="./vendor/css/fullcalendar.min.css" />
<link rel="stylesheet" href="./vendor/css/bootstrap.min.css">
<link rel="stylesheet" href='./vendor/css/select2.min.css' />
<link rel="stylesheet"
	href='./vendor/css/bootstrap-datetimepicker.min.css' />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src='./fullcalendar/core/main.js'></script>
<script src='./fullcalendar/daygrid/main.js'></script>
<script src="./fullcalendar/interaction/main.min.js"></script>
<script src="./fullcalendar/timegrid/main.min.js"></script>
</head>

<script>
/*   document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');

    // $.ajax({
    //   url: "data.json",
    //   type: "get",
    //   dataType: 'json',
    //   success: function (data) {
    //     console.log(data[0].title);
    //   }
    // })

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: ['interaction', 'dayGrid'],
      header: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title',
        right: 'dayGridMonth,dayGridWeek,dayGridDay'
      },
      //defaultDate: '2020-02-12',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      eventSources: [{
        events: function (info, successCallback, failureCallback) {
          $.ajax({
            url: "cc.do",
            type: "get",
            dataType: 'json',
            success: function (data) {
              successCallback(data); //jsonë°ì´í° íë©´ì ë¿ë ¤ì¤
            }
          })
        }
      }]
      // events: [
      //   {
      //     title: data[0].title,
      //     start: data[0].start
      //   },
      //   {
      //     title: 'Long Event',
      //     start: '2020-05-07',
      //     end: '2020-05-10'
      //   }
      //   // {
      //   //   groupId: 999,
      //   //   title: 'Repeating Event',
      //   //   start: '2020-02-16T16:00:00'
      //   // },
      //   // {
      //   //   title: 'Click for Google',
      //   //   url: 'http://google.com/',
      //   //   start: '2020-02-28'
      //   // }
      // ]
    });

    calendar.render();
  }); */

</script>
</head>

<body>
	<div class="container">


		<!-- 일자 클릭시 메뉴오픈 -->
		<div id="contextMenu" class="dropdown clearfix">
			<ul class="dropdown-menu dropNewEvent" role="menu"
				aria-labelledby="dropdownMenu"
				style="display: block; position: static; margin-bottom: 5px;">
				<li><a tabindex="-1" href="#">카테고리1</a></li>
				<li><a tabindex="-1" href="#">카테고리2</a></li>
				<li><a tabindex="-1" href="#">카테고리3</a></li>
				<li><a tabindex="-1" href="#">카테고리4</a></li>
				<li class="divider"></li>
				<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
			</ul>
		</div>



		<div id="wrapper">
			<div id="loading"></div>
			<div id="calendar"></div>
		</div>

		<!-- 일정 추가 MODAL -->
		<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body">

						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-allDay">하루종일</label> <input
									class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-title">일정명</label> <input
									class="inputModal" type="text" name="edit-title"
									id="edit-title" required="required" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-start">시작</label> <input
									class="inputModal" type="text" name="edit-start"
									id="edit-start" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-end">끝</label> <input
									class="inputModal" type="text" name="edit-end" id="edit-end" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-type">구분</label> <select
									class="inputModal" type="text" name="edit-type" id="edit-type">
									<option value="카테고리1">카테고리1</option>
									<option value="카테고리2">카테고리2</option>
									<option value="카테고리3">카테고리3</option>
									<option value="카테고리4">카테고리4</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-color">색상</label> <select
									class="inputModal" name="color" id="edit-color">
									<option value="#D25565" style="color: #D25565;">빨간색</option>
									<option value="#9775fa" style="color: #9775fa;">보라색</option>
									<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
									<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
									<option value="#f06595" style="color: #f06595;">핑크색</option>
									<option value="#63e6be" style="color: #63e6be;">연두색</option>
									<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
									<option value="#4d638c" style="color: #4d638c;">남색</option>
									<option value="#495057" style="color: #495057;">검정색</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-desc">설명</label>
								<textarea rows="4" cols="50" class="inputModal" name="edit-desc"
									id="edit-desc"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer modalBtnContainer-addEvent">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="save-event">저장</button>
					</div>
					<div class="modal-footer modalBtnContainer-modifyEvent">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
						<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->


		<!-- 내가만든 일정등록  -->
		<form id="form1" name="form1" action="input.do" method="post">
			<table>
				<tr>
					<td>title</td>
					<td><input type='text' id='c_title' name='c_title'
						tabindex='1' /></td>
					<td rowspan='3'><input type='submit' id='login' tabindex='3'
						value='ë±ë¡' style='height: 50px' /></td>
				</tr>
				<tr>
					<td>start</td>
					<td><input type='text' id='c_start' name='c_start'
						tabindex='2' /></td>
				</tr>
				<tr>
					<td>end</td>
					<td><input type='text' id='c_end' name='c_end' tabindex='3' /></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- /.container -->
</body>
<script src="./vendor/js/jquery.min.js"></script>
<script src="./vendor/js/bootstrap.min.js"></script>
<script src="./vendor/js/moment.min.js"></script>
<script src="./vendor/js/fullcalendar.min.js"></script>
<script src="./vendor/js/ko.js"></script>
<script src="./vendor/js/select2.min.js"></script>
<script src="./vendor/js/bootstrap-datetimepicker.min.js"></script>
<script src="./index.js"></script>
<script src="./addEvent.js"></script>
<script src="./editEvent.js"></script>
<script src="./etcSetting.js"></script>

</html>