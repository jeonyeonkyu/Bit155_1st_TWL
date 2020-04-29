<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
  <title>26.8조의 그림판</title>
</head>

<body>
  <img src="./img/thumbs.svg" style="position: relative; left:310px"><div class ="top"> 26.8議곗쓽 洹몃┝�뙋</div>
  <div class="slidecontainer">
    <input type="range" id="jsRange" min="0.1" max="5" value="2.5" step="0.1" class="slider">
  </div>
  <div class="controls__btns">
    <button id="Save">SAVE</button>
  </div>
    <div class="row">
      <span class="cell">
        <div>
          <div class="jb_table">
            <div class="row">
              <span class="cell">
                <img src="./img/red.png" onclick="selectColor('red')" />
                <img src="./img/orange.png" onclick="selectColor('orange')" />
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="./img/yellow.png" onclick="selectColor('yellow')" />
                <img src="./img/green.png" onclick="selectColor('green')" />
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="./img/blue.png" onclick="selectColor('blue')" />
                <img src="./img/lightblue.png" onclick="selectColor('lightblue')" />
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="./img/lightgreen.png" onclick="selectColor('lightgreen')" />
                <img src="./img/brown.png" onclick="selectColor('brown')" />
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="./img/purple.png" onclick="selectColor('purple')" />
                <img src="./img/pink.png" onclick="selectColor('pink')" />
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="./img/gray.png" onclick="selectColor('gray')" />
                <img src="./img/lightgray.png" onclick="selectColor('lightgray')" />
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="./img/black.png" onclick="selectColor('black')" />
                <img src="./img/white.png" onclick="selectColor('white')" />
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="./img/pencil.svg" onclick="selectTool('pencil')" />
                <img src="./img/line2.png" onclick="selectTool('line')" style = "margin-bottom: 4px; margin-left: 2px;"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="./img/circle.svg" onclick="selectTool('circle')" />
                <img src="./img/square.svg" onclick="selectTool('square')" />
              </span>
            </div>
            
            <div class="row">
              <span class="cell">
                <img src="./img/paint.svg" onClick="handleModeClick()" style="margin-bottom: 3px;"/>
                <img src="./img/吏��슦媛�.svg" onClick="initPage()"  style="margin-left: 2px;"/>
              </span>
            </div>
          </div>
        </div>
      </span>
        <div>
          <canvas id="canvas" class="canvas" width="600" height="500" style="margin-left: 10px;"></canvas>
        </div>
      </span>
    </div>
  <script src="Canvas.js"></script>
</body>

</html>