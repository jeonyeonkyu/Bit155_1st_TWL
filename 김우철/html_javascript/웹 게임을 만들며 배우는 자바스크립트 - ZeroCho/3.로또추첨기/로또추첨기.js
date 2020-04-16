// var 후보군 = Array(45);
// var 필 = 후보군.fill();

var 후보군 = Array(45)
  .fill()
  .map(function(요소, 인덱스) {
    return 인덱스 + 1;
  });

var 셔플 = [];
while (후보군.length > 0) {
  var 이동값 = 후보군.splice(Math.floor(Math.random() * 후보군.length), 1)[0];
  셔플.push(이동값);
}
// console.log(셔플);
var 보너스 = 셔플[셔플.length - 1];
var 당첨숫자들 = 셔플.slice(0, 6);
console.log(
  "당첨숫자들",
  당첨숫자들.sort(function(p, c) {
    return p - c;
  }),
  "보너스",
  보너스
);

var count = 0;
var 보너스결과 = 0;
var 입력창 = document.querySelector("#입력창");
var 폼 = document.querySelector("#폼");
폼.addEventListener("submit", function 비동기(이벤트) {
  이벤트.preventDefault();
  var 답 = 입력창.value.split(",");
  var 당첨결과 = document.querySelector("#당첨결과");
  if (답.join("") === 당첨숫자들.join("")) {
    //답이 다 맞으면
    당첨결과.textContent = "1등 당첨!!";
    console.log("1등 당첨!!");
    공로드();
  } else {
    //1등이 아닐때
    var re = 로또기계(당첨숫자들, 답, 보너스);
    if (re <= 5) {
      당첨결과.textContent = re + "등 당첨!!";
    } else {
      당첨결과.textContent = " 꽝";
    }
    console.log(re);
    공로드();
  }
});

function 로또기계(lot, entry, bonus) {
  var rate = 0;
  for (var i = 0; i < 6; i += 1) {
    if (parseInt(entry[i]) === parseInt(bonus)) {
      보너스결과 += 1;
    }
    for (var j = 0; j < 6; j += 1) {
      if (parseInt(lot[i]) === parseInt(entry[j])) {
        count += 1;
      }
    }
  }
  if (count == 5 && 보너스결과 === 1) {
    rate = 2;
  } else if (count === 5) {
    rate = 3;
  } else if (count === 4) {
    rate = 4;
  } else if (count === 3) {
    rate = 5;
  } else {
    rate = "꽝";
  }

  console.log("맞춘개수 : ", count);
  console.log("보너스 : ", 보너스결과);
  return rate;
}

// var 결과창 = document.getElementById('결과창');
var 결과창 = document.querySelector("#결과창");

function 공색칠하기(숫자, 결과창) {
  var 공 = document.createElement("div");
  공.textContent = 숫자;
  공.style.display = "inline-block";
  공.style.border = "1px solid black";
  공.style.borderRadius = "10px";
  공.style.width = "20px";
  공.style.height = "20px";
  공.style.textAlign = "center";
  공.style.marginRight = "10px";
  공.style.fontSize = "12px";
  공.id = "공아이디" + 숫자;
  var 배경색;
  if (숫자 <= 10) {
    배경색 = "red";
  } else if (숫자 <= 20) {
    배경색 = "orange";
  } else if (숫자 <= 30) {
    배경색 = "yellow";
  } else if (숫자 <= 40) {
    배경색 = "blue";
  } else {
    배경색 = "green";
  }
  공.style.background = 배경색;
  결과창.appendChild(공);
}

/*
function 공로드() {
  setTimeout(function 비동기콜백함수() {
    공색칠하기(당첨숫자들[0], 결과창);
  }, 1000); //밀리초
  setTimeout(function 비동기콜백함수() {
    공색칠하기(당첨숫자들[1], 결과창);
  }, 2000); //밀리초
  setTimeout(function 비동기콜백함수() {
    공색칠하기(당첨숫자들[2], 결과창);
  }, 3000); //밀리초
  setTimeout(function 비동기콜백함수() {
    공색칠하기(당첨숫자들[3], 결과창);
  }, 4000); //밀리초
  setTimeout(function 비동기콜백함수() {
    공색칠하기(당첨숫자들[4], 결과창);
  }, 5000); //밀리초
  setTimeout(function 비동기콜백함수() {
    공색칠하기(당첨숫자들[5], 결과창);
  }, 6000); //밀리초
*/
//클로저 해결
for (var i = 0; i < 당첨숫자들.length; i++) {
  (function 클로저(j) {
    setTimeout(function() {
      공색칠하기(당첨숫자들[j], 결과창);
    }, (j + 1) * 1000);
  })(i); //즉시 실행 함수(선언하자마자 실행), function을 소괄호로 감싸고 바로실행(가장 많이 사용하는 방법)
}

setTimeout(function 비동기콜백함수() {
  // var 보너스칸 = document.getElementsByClassName("보너스")[0];
  var 보너스칸 = document.querySelector(".보너스");
  공색칠하기(보너스, 보너스칸);
}, 7000); //밀리초
