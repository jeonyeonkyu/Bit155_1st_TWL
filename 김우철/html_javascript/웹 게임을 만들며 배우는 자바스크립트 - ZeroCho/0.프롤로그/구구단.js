var 숫자1 = Math.ceil(Math.random() * 9) + 1;
var 숫자2 = Math.ceil(Math.random() * 9) + 1;
var 결과 = 숫자1 * 숫자2;
var 문장 = document.createElement("div");
문장.textContent = String(숫자1) + " * " + String(숫자2) + "는?";
document.body.append(문장);

var 폼 = document.createElement("form");
document.body.append(폼);

var 입력창 = document.createElement("input");
폼.append(입력창);
var 버튼 = document.createElement("button");
버튼.textContent = "등록";
폼.append(버튼);

var 결과창 = document.createElement("div");
document.body.append(결과창);

폼.addEventListener("submit", function 콜백함수(이벤트) {
  이벤트.preventDefault();
  if (결과 === Number(입력창.value)) {
    결과창.textContent = "딩동댕";
    숫자1 = Math.ceil(Math.random() * 9) + 1;
    숫자2 = Math.ceil(Math.random() * 9) + 1;
    결과 = 숫자1 * 숫자2;
    var temp = String(숫자1) + " * " + String(숫자2) + "는?";
    문장.textContent = temp;
    입력창.value = "";
    입력창.focus;
  } else {
    결과창.textContent = "땡";
    입력창.value = "";
    입력창.focus;
  }
});

// while (true) {
//   var 숫자1 = Math.floor(Math.random() * 9) + 1;
//   var 숫자2 = Math.floor(Math.random() * 9) + 1;
//   var 결과 = 숫자1 * 숫자2;
//   var 조건 = true;
//   while (조건) {
//     var 답 = prompt(String(숫자1) + "곱하기" + String(숫자2) + "는?");
//     if (결과 === Number(답)) {
//       alert("딩동댕");
//     } else {
//       alert("땡");
//     }
//   }
// }
