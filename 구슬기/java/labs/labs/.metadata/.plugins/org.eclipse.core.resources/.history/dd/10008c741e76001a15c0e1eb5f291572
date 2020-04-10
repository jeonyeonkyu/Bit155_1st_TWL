var 이미지좌표 = 0;

var 가위바위보 = {
  //딕셔너리 자료구조
  바위: "0",
  가위: "-142px",
  보: "-284px"
};

function 컴퓨터의선택(이미지좌표) {
  //Object.entries() 메서드는 [key, value] 쌍의 배열을 반환
  return Object.entries(가위바위보).find(function(v) {
    return v[1] === 이미지좌표;
    //좌표는 ["바위", "0"] 에서 두번째에 들어있기 때문에 v[1]
  })[0]; //배열의 첫번째 인덱스인 (바위,가위,보) 중 하나가 나오게 함
}

var 인터벌;
function 인터벌메이커() {
  인터벌 = setInterval(function() {
    if (이미지좌표 === 가위바위보.바위) {
      이미지좌표 = 가위바위보.가위;
    } else if (이미지좌표 === 가위바위보.가위) {
      이미지좌표 = 가위바위보.보;
    } else {
      이미지좌표 = 가위바위보.바위;
    }
    document.querySelector("#computer").style.background =
      'url("https://en.pimg.jp/023/182/267/1/23182267.jpg")' +
      이미지좌표 +
      " 0";
  }, 100);
}

인터벌메이커();

var 점수표 = {
  가위: 1,
  바위: 0,
  보: -1
};

document.querySelectorAll(".btn").forEach(function(btn) {
  btn.addEventListener("click", function() {
    clearInterval(인터벌);
    setTimeout(function() {
      인터벌메이커();
    }, 1000);
    var 나의선택 = this.textContent;
    var 나의점수 = 점수표[나의선택];
    var 컴퓨터점수 = 점수표[컴퓨터의선택(이미지좌표)];
    var 점수차 = 나의점수 - 컴퓨터점수;
    if (점수차 === 0) {
      console.log(무승부);
    } else if ([-1, 2].includes(점수차)) {
      console.log(이김);
    } else {
      console.log(짐);
    }

    console.log(나의선택, 컴퓨터의선택(이미지좌표));
  });
});

// 가위: 1, 바위: 0, 보: -1
// 나\컴퓨터    가위   바위    보
//        가위   1 1    1 0   1 -1
//        바위   0 1    0 0   0 -1
//          보  -1 1   -1 0  -1 -1
