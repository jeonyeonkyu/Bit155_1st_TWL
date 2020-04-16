// <⚠️ DONT DELETE THIS ⚠️>
import "./styles.css";
// <⚠️ /DONT DELETE THIS ⚠️>
const colors = ["#f39c12", "#8e44ad", "#2980b9"];
//주황, 보라, 파랑
//const title = document.querySelector(".title");

function init() {
  document.body.style.background = "#f39c12";
}

window.addEventListener(
  "resize",
  function() {
    var windowWidth = window.innerWidth;
    if (windowWidth < 600) {
      document.body.style.background = colors[2];
    } else if (windowWidth < 800) {
      document.body.style.background = colors[1];
    } else {
      document.body.style.background = colors[0];
    }
  },
  true
);

init();
