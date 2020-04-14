var tetris = document.querySelector("#tetris");
var blockArr = [
    ['red', true, [
        [1, 1],
        [1, 1],
    ]],
    ['blue', true, [
        [0, 2, 0],
        [2, 2, 2],
    ]],
    ['orange', true, [
        [3, 3, 0],
        [0, 3, 3],
    ]],
    ['skyblue', true, [
        [0, 4, 4],
        [4, 4, 0],
    ]],
    ['yellowgreen', true, [
        [5, 5, 5],
        [5, 0, 0],
    ]],
    ['pink', true, [
        [6, 6, 6],
        [0, 0, 6],
    ]],
    ['yellow', true, [
        [7, 7, 7, 7],
    ]],
];
var blockDict = {
    0 : ['white', false, []], //빈칸
    //색깔, 움직임 여부, 블럭의 실제 모양
    1: ['red', true, [
    [1, 1],
    [1, 1],
]],
    2: ['blue', true, [
        [0, 1, 0],
        [1, 1, 1],
    ]],
    3: ['orange', true, [
        [1, 1, 0],
        [0, 1, 1],
    ]],
    4: ['skyblue', true, [
        [0, 1, 1],
        [1, 1, 0],
    ]],
    5: ['yellowgreen', true, [
        [1, 1, 1],
        [1, 0, 0],
    ]],
    6: ['pink', true, [
        [1, 1, 1],
        [0, 0, 1],
    ]],
    7: ['yellow', true, [
        [1, 1, 1, 1],
    ]],
    10: ['red', false, [
        [1, 1],
        [1, 1],
    ]],
    20: ['blue', false, [
        [1, 1],
        [1, 1],
    ]],
    30: ['orange', false, [
        [1, 1],
        [1, 1],
    ]],
    40: ['skyblue', false, [
        [1, 1],
        [1, 1],
    ]],
    50: ['yellowgreen', false, [
        [1, 1],
        [1, 1],
    ]],
    60: ['pink', false, [
        [1, 1],
        [1, 1],
    ]],
    70: ['yellow', false, [
        [1, 1],
        [1, 1],
    ]]
}
var tetrisData = [

];
var stopDown = false;

function 칸만들기() { //10X20 칸
  var fragment = document.createDocumentFragment();
  for (var i = 0; i < 20; i+=1) {
    var tr = document.createElement("tr");
    var arr = []; //tetrisData와 참조관계
    tetrisData.push(arr);
    fragment.appendChild(tr);
    for (var j = 0; j < 10; j++) {
      var td = document.createElement("td");
      tr.appendChild(td);
      arr.push(0);
    }
  }
  console.log(tetrisData);
  tetris.appendChild(fragment);
}

//싹다 지웠다가 다시 싹 그림(사실은 비효율적 / 하지만 내가 편함)
function 화면그리기() {
    tetrisData.forEach(function(tr, i) {
        tr.forEach(function(td, j) {
            // TODO : 블록 생성할 때 이미 차 있으면 게임오버
            tetris.children[i].children[j].className = blockDict[td][0]; //td에 접근
        });
    });
}

function 블록생성기() {
    stopDown = false;
    var 블록 = blockArr[Math.floor(Math.random() * 7)][2]; //랜덤으로 블록의 모양을 가져옴
    console.log(블록);
    블록.forEach(function(tr, i) {
        tr.forEach(function(td, j) {
            tetrisData[i][j+3] = td; //td를 tetridData에 복사, 맨위 기준 0,3부터 도형 뜸
        });
    });
    화면그리기();
}

function 블록내리기() { //아래서부터 데이터 읽음
  for (var i = tetrisData.length - 1; i >= 0; i -= 1) {
    tetrisData[i].forEach(function(td, j) {
      if (td > 0 && td < 10) {  //움직이는 블럭들
        if (tetrisData[i + 1] && !stopDown) { //다음칸이 존재하면서 색깔이 안차있으면..
          tetrisData[i + 1][j] = td;
          tetrisData[i][j] = 0;
        } else { //땅끝에 도달한 경우
            stopDown = true;
            tetrisData[i][j] = td * 10;
            
        }
      }
    });
  }
  if(stopDown) {
      블록생성기();
  }
  console.log(tetrisData);
  화면그리기();
}


window.addEventListener("keydown", function(e) {
  console.log(e);
  switch (e.code) {
    case "ArrowLeft": //왼쪽 이동
      break;
    case "ArrowDown": //아래쪽 이동
      break;
    case "ArrowRight": //오른쪽 이동
      break;

    default:
      break;
  }
});

window.addEventListener("keyup", function(e) {
  switch (e.code) {
    case "Space": //한방에 내리기
      console.log("Space");
      break;
    case "ArrowUp": //방향 전환
      break;
    default:
      break;
  }
});

칸만들기();
블록생성기();
setInterval(블록내리기, 100);