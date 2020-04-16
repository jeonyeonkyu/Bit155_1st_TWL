const colors = ["#1abc9c", "#3498db", "#9b59b6", "#f39c12", "#e74c3c"];
//green, blue, purple, orange, red
const title = document.querySelector("h2");
title.style.display = "inline-block";

function handleMouseOver() {
  title.innerHTML = "The moues is here!";
  title.style.color = colors[0];
}

function handleMouseOut() {
  title.innerHTML = "The mouse is gone!";
  title.style.color = colors[1];
}

function handleResize() {
  title.innerHTML = "You just resized!";
  title.style.color = colors[2];
}

function handleMouseDown() {
  title.innerHTML = "That was a right click!";
  title.style.color = colors[3];
}

title.addEventListener("mouseover", handleMouseOver);
title.addEventListener("mouseout", handleMouseOut);
window.addEventListener("resize", handleResize);
window.addEventListener("mousedown", handleMouseDown);

// ALL function handlers should be INSIDE of "superEventHandler"
const superEventHandler = {
  // mouseover: function() {
  //   handleMouseOver();
  // },
  mouseout: function() {
    handleMouseOut();
  },
  resize: function() {
    handleMouseOut();
  },
  mousedown: function() {
    handleMouseDown();
  }
};

//또 다른 방법
// title.mouseover = function() {
//   title.innerHTML = "The moues is here!";
//   title.style.color = colors[0];
// };
