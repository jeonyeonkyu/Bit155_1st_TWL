const target = document.querySelector(".selectBox");
const key = "country";

function saveName(text) {
  localStorage.setItem(key, text);
}

function handleSelect() {
  const value = target.options[target.selectedIndex].value;
  saveName(value);
}

function askForName() {
  target.addEventListener("change", handleSelect);
}

function loadName() {
  askForName();
}

function init() {
  loadName();
  document.onkeydown = function(e) {
    /* F5 */
    if (e.keyCode == 116) {
      localStorage.setItem("test1", 123);
    }
  };
}

init();
