var cvs;
var canvas;
var bufCanvas;
var bufCtx;

var paintMode = [
  "point",
  "line",
  "circle",
  "square",
];

var toolTable = {
  pencil: 0,
  line: 1,
  circle: 2,
  square: 3,
};

var pointShape = {
  mouseDown: pointMouseDown,
  mouseMove: pointMouseMove,
  mouseUp: pointMouseUp
};

var shapeList = [pointShape];

var paintMouseDownAction = {
  point: pointMouseDown,
  line: lineMouseDown,
  circle: circleMouseDown,
  square: squareMouseDown,
};

var paintMouseUpAction = {
  point: pointMouseUp,
  line: lineMouseUp,
  circle: circleMouseUp,
  square: squareMouseUp,
};

var paintMouseMoveAction = {
  point: pointMouseMove,
  line: lineMouseMove,
  circle: circleMouseMove,
  square: squareMouseMove,
};

var pos = {
  isDraw: false,
  color: "black",
  colorIdx: 0,
  drawMode: 0,
  filled: false,
  lineWidth: 2.5,
  mouseDownAction: paintMouseDownAction[paintMode[0]],
  mouseUpAction: paintMouseUpAction[paintMode[0]],
  mouseMoveAction: paintMouseMoveAction[paintMode[0]],
  x: 0,
  y: 0,
  update: function (drawMode) {
    this.drawMode = drawMode;
    this.mouseDownAction = paintMouseDownAction[paintMode[drawMode]];
    this.mouseUpAction = paintMouseUpAction[paintMode[drawMode]];
    this.mouseMoveAction = paintMouseMoveAction[paintMode[drawMode]];
  }
};

function point() {
  return {
    X: 0,
    Y: 0
  };
}

function drawCommand() {
  return {
    mode: paintMode[0],
    color: "white",
    filled: false,
    X1: point(),
    X2: point(),
    X3: point(),
    R: 0,
    A: 0,
    B: 0,
    lines: [],
    toCommand: function () {
      var newCommand = this.mode + " ";
      var isFilled = this.filled == true ? 'F' : 'E';
      switch (this.mode) {
        case "color":
          newCommand += this.color;
          break;
        case "pencil_begin":
        case "pencil_end":
          break;
        case "point":
        case "line":
          newCommand +=
            this.X1.X +
            " " +
            this.X1.Y +
            " " +
            this.X2.X +
            " " +
            this.X2.Y;
          break;
        case "circle":
          newCommand +=
            this.X1.X +
            " " +
            this.X1.Y +
            " " +
            this.R +
            " " +
            isFilled;
          break;
        case "square":
          newCommand +=
            this.X1.X +
            " " +
            this.X1.Y +
            " " +
            this.X2.X +
            " " +
            this.X2.Y +
            " " +
            isFilled;
          break;
        default:
          break;
      }
      return newCommand;
    }
  };
}

function getMousePosition(event) {
  var x = event.pageX - canvas.offsetLeft;
  var y = event.pageY - canvas.offsetTop;
  return { X: x, Y: y };
}

function mouseListener(event) {
  switch (event.type) {
    case "mousedown":
      if (!pos.isDraw) {
        pos.mouseDownAction(event);
      }
      break;
    case "mousemove":
      if (pos.isDraw) {
        pos.mouseMoveAction(event);
      }
      break;
    case "mouseup":
    case "mouseout":
      if (pos.isDraw) {
        pos.mouseUpAction(event);
      }
      break;
  }
}

function selectColor(choosedColor) {
  var colorTableIdx = {
    red: 0,
    orange: 1,
    yellow: 2,
    green: 3,
    blue: 4,
    lightblue: 5,
    lightgreen: 6,
    brown: 7,
    purple: 8,
    pink: 9,
    gray: 10,
    lightgray: 11,
    black: 12,
    white: 13
  };
  pos.color = choosedColor;
  pos.colorIdx = colorTableIdx[choosedColor];

  var newColor = drawCommand();
  newColor.mode = "color";
  newColor.color = choosedColor;
}

function selectTool(choosedTool) {
  if (choosedTool.indexOf("filled") != -1) {
    pos.filled = true;
  } else {
    pos.filled = false;
  }
  pos.update(toolTable[choosedTool]);
}

function pointMouseDown(event) {
  if (pos.isDraw) {
    return;
  }
  pos.isDraw = true;
  cvs.beginPath();
  cvs.strokeStyle = pos.color;
  var startPos = getMousePosition(event);
  cvs.moveTo(startPos.X, startPos.Y);
  cvs.stroke();
  pos.X = startPos.X;
  pos.Y = startPos.Y;
  

  var newPoint = drawCommand();
  newPoint.mode = "pencil_begin";
}

function pointMouseMove(event) {
  var currentPos = getMousePosition(event);

  cvs.lineTo(currentPos.X, currentPos.Y);
  cvs.stroke();

  var newPoint = drawCommand();
  newPoint.mode = "line";
  newPoint.X1 = { X: pos.X, Y: pos.Y };
  newPoint.X2 = { X: currentPos.X, Y: currentPos.Y };

  pos.X = currentPos.X;
  pos.Y = currentPos.Y;
}

function pointMouseUp(event) {
  if (!pos.isDraw) {
    return;
  }

  pos.isDraw = false;
  cvs.closePath();

  var newPoint = drawCommand();
  newPoint.mode = "pencil_end";
}

function lineMouseDown(event) {
  if (pos.isDraw) {
    return;
  }
  bufCtx.drawImage(canvas, 0, 0);
  var startPos = getMousePosition(event);
  pos.X = startPos.X;
  pos.Y = startPos.Y;
  pos.isDraw = true;
}

function lineMouseMove(event) {
  var currentPos = getMousePosition(event);
  cvs.beginPath();
  // Need a delay
  cvs.clearRect(0, 0, canvas.width, canvas.height);
  cvs.drawImage(bufCanvas, 0, 0);

  cvs.strokeStyle = pos.color;
  cvs.moveTo(pos.X, pos.Y);
  cvs.lineTo(currentPos.X, currentPos.Y);
  cvs.closePath();
  cvs.stroke();
}

function lineMouseUp(event) {
  if (!pos.isDraw) {
    return;
  }
  
  var currentPos = getMousePosition(event);
  bufCtx.beginPath();
  bufCtx.strokeStyle = pos.color;
  bufCtx.lineWidth = pos.lineWidth;
  bufCtx.moveTo(pos.X, pos.Y);
  bufCtx.lineTo(currentPos.X, currentPos.Y);
  bufCtx.closePath();
  bufCtx.stroke();
  cvs.drawImage(bufCanvas, 0, 0);

  var newLine = drawCommand();
  newLine.mode = "line";
  newLine.X1 = { X: pos.X, Y: pos.Y };
  newLine.X2 = { X: currentPos.X, Y: currentPos.Y };

  pos.isDraw = false;
}

function circleMouseDown(event) {
  if (pos.isDraw) {
    return;
  }
  bufCtx.drawImage(canvas, 0, 0);
  pos.isDraw = true;
  var startPos = getMousePosition(event);
  pos.X = startPos.X;
  pos.Y = startPos.Y;
  
}

function circleMouseMove(event) {
  var currentPos = getMousePosition(event);
  cvs.beginPath();

  cvs.clearRect(0, 0, canvas.width, canvas.height);
  cvs.drawImage(bufCanvas, 0, 0);
  cvs.strokeStyle = pos.color;


  var circle = {
    X: Math.round((pos.X + currentPos.X) / 2),
    Y: Math.round((pos.Y + currentPos.Y) / 2),
    R: Math.round(Math.abs(currentPos.Y - pos.Y) / 2)
  };

  cvs.arc(circle.X, circle.Y, circle.R, 0, Math.PI * 2);

  if (pos.filled) {
    cvs.fillStyle = pos.color;
    cvs.fill();
  }

  cvs.closePath();
  cvs.stroke();
  cvs.strokeStyle = pos.color;
}

function circleMouseUp(event) {
  if (pos.isDraw) {
    var currentPos = getMousePosition(event);
    bufCtx.beginPath();
    bufCtx.strokeStyle = pos.color;
    bufCtx.lineWidth = pos.lineWidth;
    var circle = {
      X: Math.round((pos.X + currentPos.X) / 2),
      Y: Math.round((pos.Y + currentPos.Y) / 2),
      R: Math.round(Math.abs(currentPos.Y - pos.Y) / 2)
    };

    bufCtx.arc(circle.X, circle.Y, circle.R, 0, Math.PI * 2);

    if (pos.filled) {
      bufCtx.fillStyle = pos.color;
      bufCtx.fill();
    }

    bufCtx.closePath();
    bufCtx.stroke();

    cvs.clearRect(0, 0, canvas.width, canvas.height);
    cvs.drawImage(bufCanvas, 0, 0);

    var newCircle = drawCommand();
    newCircle.mode = "circle";
    newCircle.filled = pos.filled;
    newCircle.X1 = { X: circle.X, Y: circle.Y };
    newCircle.R = circle.R;

    pos.isDraw = false;
  }
}

function squareMouseDown(event) {
  if (pos.isDraw) {
    return;
  }
  bufCtx.drawImage(canvas, 0, 0);
  pos.isDraw = true;
  var startPos = getMousePosition(event);
  pos.X = startPos.X;
  pos.Y = startPos.Y;
}

function squareMouseMove(event) {
  var currentPos = getMousePosition(event);
  cvs.beginPath();

  cvs.clearRect(0, 0, canvas.width, canvas.height);
  cvs.drawImage(bufCanvas, 0, 0);
  cvs.strokeStyle = pos.color;

  var box = {
    W: currentPos.Y - pos.Y,
    H: currentPos.Y - pos.Y
  };

  if (pos.filled) {
    cvs.fillStyle = pos.color;
    cvs.fillRect(pos.X, pos.Y, box.W, box.H);
  }

  cvs.strokeRect(pos.X, pos.Y, box.W, box.H);
  cvs.closePath();
  cvs.stroke();
  cvs.strokeStyle = pos.color;
}

function squareMouseUp(event) {
  if (pos.isDraw) {
    var currentPos = getMousePosition(event);
    bufCtx.beginPath();
    bufCtx.strokeStyle = pos.color;
    bufCtx.lineWidth = pos.lineWidth;
    var box = {
      W: currentPos.Y - pos.Y,
      H: currentPos.Y - pos.Y
    };
    if (pos.filled) {
      bufCtx.fillStyle = pos.color;
      bufCtx.lineWidth = pos.lineWidth;
      bufCtx.fillRect(pos.X, pos.Y, box.W, box.H);
    } else {
      bufCtx.strokeRect(pos.X, pos.Y, box.W, box.H);
    }
    bufCtx.closePath();
    bufCtx.stroke();

    cvs.clearRect(0, 0, canvas.width, canvas.height);
    cvs.drawImage(bufCanvas, 0, 0);

    var newSqure = drawCommand();
    newSqure.mode = "square";
    newSqure.filled = pos.filled;
    newSqure.X1 = { X: pos.X, Y: pos.Y };
    newSqure.X2 = { X: (pos.X + box.H), Y: currentPos.Y };

    pos.isDraw = false;
  }
}

function rectMouseDown(event) {
  if (pos.isDraw) {
    return;
  }
  bufCtx.drawImage(canvas, 0, 0);
  pos.isDraw = true;
  var startPos = getMousePosition(event);
  pos.X = startPos.X;
  pos.Y = startPos.Y;
}

function rectMouseMove(event) {
  var currentPos = getMousePosition(event);
  cvs.beginPath();

  cvs.clearRect(0, 0, canvas.width, canvas.height);
  cvs.drawImage(bufCanvas, 0, 0);

  cvs.strokeStyle = "black";
  var box = {
    W: currentPos.X - pos.X,
    H: currentPos.Y - pos.Y
  };

  cvs.strokeRect(pos.X, pos.Y, box.W, box.H);

  if (pos.filled) {
    cvs.fillStyle = pos.color;
    cvs.fillRect(pos.X, pos.Y, box.W, box.H);
  }

  cvs.stroke();
  cvs.closePath();
  cvs.strokeStyle = pos.color;
}

function rectMouseUp(event) {
  if (pos.isDraw) {
    var currentPos = getMousePosition(event);
    bufCtx.beginPath();
    bufCtx.strokeStyle = pos.color;
    var box = {
      W: currentPos.X - pos.X,
      H: currentPos.Y - pos.Y
    };
    if (pos.filled) {
      bufCtx.fillStyle = pos.color;
      bufCtx.fillRect(pos.X, pos.Y, box.W, box.H);
    } else {
      bufCtx.strokeRect(pos.X, pos.Y, box.W, box.H);
    }
    bufCtx.closePath();
    bufCtx.stroke();

    cvs.clearRect(0, 0, canvas.width, canvas.height);
    cvs.drawImage(bufCanvas, 0, 0);

    var newRect = drawCommand();
    newRect.mode = "rect";
    newRect.filled = pos.filled;
    newRect.X1 = { X: pos.X, Y: pos.Y };
    newRect.X2 = { X: currentPos.X, Y: currentPos.Y };

    pos.isDraw = false;
  }
}

function clearCanvas() { //전체 지우기
  cvs.clearRect(0, 0, canvas.width, canvas.height);
  bufCtx.clearRect(0, 0, canvas.width, canvas.height);
}

function initPage() { //전체 지우기
  clearCanvas();
}


function handleRangeChange(event) { //두께조절
  const size = event.target.value;
  cvs.lineWidth = size;
  pos.lineWidth = size;

}

function handleSaveClick() { //저장
  const image = canvas.toDataURL();
  const link = document.createElement("a");
  link.href = image;
  link.download = "savepng";
  link.click();
}


function handleModeClick() { //전체 칠하기
  if (pos.filled === true) {
    pos.filled = false;
  } else {
    pos.filled = true;
  }
}


function handleCanvasClick() { //전체 칠하기
  if(pos.filled){
    cvs.fillStyle = pos.color;
    cvs.fillRect(0, 0, canvas.width, canvas.height);
    bufCtx.fillRect(0,0, canvas.width, canvas.height);
  }
}

function onLoadPage() {
  canvas = document.getElementById("canvas");
  cvs = canvas.getContext("2d");
  bufCanvas = document.createElement("canvas");
  bufCanvas.width = canvas.width;
  bufCanvas.height = canvas.height;
  bufCtx = bufCanvas.getContext("2d");
  const range = document.getElementById("jsRange");
  const lineWidth = 2.5;
  const saveBtn = document.getElementById("Save");

 
  canvas.addEventListener("mousedown", mouseListener);
  canvas.addEventListener("mousemove", mouseListener);
  canvas.addEventListener("mouseout", mouseListener);
  canvas.addEventListener("mouseup", mouseListener);
  range.addEventListener("input", handleRangeChange);
  saveBtn.addEventListener("click", handleSaveClick);
  canvas.addEventListener("click", handleCanvasClick);

  initPage();
}

window.onload = onLoadPage();