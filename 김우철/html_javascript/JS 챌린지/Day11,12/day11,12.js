// // <⚠️ DONT DELETE THIS ⚠️>
// import "./styles.css";
// // <⚠️ /DONT DELETE THIS ⚠️>

let jsResult = document.querySelector(".jsResult");
const jsClear = document.querySelector("#jsClear"),
  jsEquals = document.querySelector("#jsEquals");

var calcVar = "";

jsClear.addEventListener("click", function() {
  calcVar = "";
  jsResult.value = "0";
});

jsEquals.addEventListener("click", function() {
  console.log(calcVar);
  jsResult.value = eval(calcVar);
});

function calc(num) {
  if(jsResult.value === "0"){
    jsResult.value = "";
  }

  if (["+", "-", "*", "/"].includes(num)) { //피연산자
    calcVar += num;
    // jsResult.value = num;
  } else { //number
    if(["+", "-", "*", "/"].includes(calcVar.substring(calcVar.length-1, calcVar.length))){
      jsResult.value = "";
      calcVar += num;
      jsResult.value += num;
    }else{ //연산자 2
      calcVar += num;
      jsResult.value += num;

    }
  }
}
