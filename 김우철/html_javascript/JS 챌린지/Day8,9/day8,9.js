// <⚠️ DONT DELETE THIS ⚠️>
import "./styles.css";
// <⚠️ /DONT DELETE THIS ⚠️>

const toDoForm = document.querySelector(".js-toDoForm"),
  toDoInput = document.querySelector("input"),
  toDoPending = document.querySelector(".js-toDoPending"),
  toDoFinished = document.querySelector(".js-toDoFinished"),
  PENDING_LS = "PENDING",
  FINISHED_LS = "FINISHED";
let toPending = [];
let toFinished = [];

function paintToPending(text) {
  const li = document.createElement("li");
  const delBtn = document.createElement("button");
  const checkBtn = document.createElement("button");
  const span = document.createElement("span");
  const newId = String(Math.floor(Math.random() * 100));
  delBtn.innerHTML = "❌";
  delBtn.addEventListener("click", deleteToPending);
  checkBtn.innerHTML = "✅";
  span.innerText = text;
  checkBtn.addEventListener("click", checkPending);
  checkBtn.addEventListener("click", deleteToPending);
  li.appendChild(span);
  li.appendChild(delBtn);
  li.appendChild(checkBtn);
  li.id = newId;
  toDoPending.appendChild(li);
  const toPendingObj = {
    id: newId,
    text: text
  };
  toPending.push(toPendingObj);
  saveToPending();
}

function paintToFinished(id, text) {
  const li = document.createElement("li");
  const delBtn = document.createElement("button");
  const previousBtn = document.createElement("button");
  const span = document.createElement("span");
  delBtn.innerHTML = "❌";
  previousBtn.innerHTML = "⏪";
  span.innerText = text;
  li.appendChild(span);
  li.appendChild(delBtn);
  li.appendChild(previousBtn);
  li.id = id;
  toDoFinished.appendChild(li);
  const toFinishedObj = {
    id: id,
    text: text
  };
  toFinished.push(toFinishedObj);
  saveToFinished();
}

function checkPending(event) {
  const checkBtn2 = event.target;
  const checkLi = checkBtn2.parentNode;
  const li = document.createElement("li");
  const delBtn = document.createElement("button");
  const previousBtn = document.createElement("button");
  const span = document.createElement("span");
  const dom = document.getElementById(checkLi.id);
  delBtn.innerHTML = "❌";
  delBtn.addEventListener("click", deleteToFinished);
  previousBtn.innerHTML = "⏪";
  previousBtn.addEventListener("click", previousToFinished);
  previousBtn.addEventListener("click", deleteToFinished);
  span.innerText = dom.firstElementChild.innerText;
  li.appendChild(span);
  li.appendChild(delBtn);
  li.appendChild(previousBtn);
  li.id = checkLi.id;
  toDoFinished.appendChild(li);
  const toFinishedObj = {
    id: checkLi.id,
    text: dom.firstElementChild.innerHTML
  };
  toFinished.push(toFinishedObj);
  saveToFinished();
}

function handleSubmit(event) {
  event.preventDefault();
  const currentValue = toDoInput.value;
  paintToPending(currentValue);
  toDoInput.value = "";
}

function loadToPending() {
  const tempToPending = localStorage.getItem(PENDING_LS);
  if (tempToPending !== null) {
    const parsedToPending = JSON.parse(tempToPending);
    parsedToPending.forEach(function(toPending) {
      paintToPending(toPending.text);
    });
  }
}

function loadToFinished() {
  const tempToFinished = localStorage.getItem(FINISHED_LS);
  if (tempToFinished !== null) {
    const parsedToFinished = JSON.parse(tempToFinished);
    parsedToFinished.forEach(function(toFinished) {
      paintToFinished(toFinished.id, toFinished.text);
    });
  }
}

function saveToPending() {
  localStorage.setItem(PENDING_LS, JSON.stringify(toPending));
}

function saveToFinished() {
  localStorage.setItem(FINISHED_LS, JSON.stringify(toFinished));
}

function deleteToPending(event) {
  const btn = event.target;
  const li = btn.parentNode;
  toDoPending.removeChild(li);
  const cleanToPending = toPending.filter(function(toDo) {
    return toDo.id !== li.id;
  });
  toPending = cleanToPending;
  saveToPending();
}

function deleteToFinished(event) {
  const btn = event.target;
  const li = btn.parentNode;
  toDoFinished.removeChild(li);
  console.log(toDoFinished);
  const cleanToFinished = toFinished.filter(function(toDo) {
    return toDo.id !== li.id;
  });
  console.log(cleanToFinished);
  toFinished = cleanToFinished;
  saveToFinished();
}

function previousToFinished(event) {
  const previousBtn = event.target;
  const previousLi = previousBtn.parentNode;
  const li = document.createElement("li");
  const delBtn = document.createElement("button");
  const checkBtn = document.createElement("button");
  const span = document.createElement("span");
  const dom = document.getElementById(previousLi.id);
  delBtn.innerHTML = "❌";
  delBtn.addEventListener("click", deleteToPending);
  checkBtn.innerHTML = "✅";
  span.innerText = dom.firstElementChild.innerText;
  checkBtn.addEventListener("click", checkPending);
  checkBtn.addEventListener("click", deleteToPending);
  li.appendChild(span);
  li.appendChild(delBtn);
  li.appendChild(checkBtn);
  li.id = previousLi.id;
  toDoPending.appendChild(li);
  const toPendingObj = {
    id: previousLi.id,
    text: dom.firstElementChild.innerText
  };
  toPending.push(toPendingObj);
  saveToPending();
}

function init() {
  loadToPending();
  loadToFinished();
  toDoForm.addEventListener("submit", handleSubmit);
}

init();
