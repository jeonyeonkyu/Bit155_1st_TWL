const jsRange = document.getElementById("jsRange"),
  header = document.getElementById("jsHeader"),
  footer = document.getElementById("jsFooter"),
  jsForm = document.getElementById("jsForm"),
  userInput = document.getElementById("userInput");
let size = parseInt(jsRange.value);
const h2Judge = document.createElement("h2");
const h2Result = document.createElement("h2");
footer.appendChild(h2Judge);
footer.appendChild(h2Result);

jsForm.addEventListener("submit", function(event) {
    if(userInput.value === ""){
        return;
    }
  event.preventDefault();
  const com = randomNumber();
  if (parseInt(userInput.value) !== parseInt(com)) {
    h2Judge.textContent =
      "You chose: " + userInput.value + ", the machine chose : " + com;
    h2Result.innerText = "YOU LOSE!";
  } else if (parseInt(userInput.value) === parseInt(com)) {
    h2Judge.textContent =
      "You chose: " + userInput.value + ", the machine chose : " + com;
    h2Result.innerText = "YOU WIN!";
  }
});

function randomNumber() {
  if (size === 0) {
    const comNumber = Math.floor(Math.random() * size);
    return comNumber;
  } else {
    const comNumber = Math.floor(Math.random() * (parseInt(size)+1));
    return comNumber;
  }
  return comNumber;
}

function init() {
  const h1 = document.createElement("h1");
  const h2 = document.createElement("h2");
  h1.textContent = "Random Number Game";
  h2.textContent = "Generate a number between 0 and " + jsRange.value;
  jsRange.addEventListener("input", function(event) {
    size = event.target.value;
    h2.textContent = "Generate a number between 0 and " + size;
  });
  header.appendChild(h1);
  header.appendChild(h2);
}

init();
