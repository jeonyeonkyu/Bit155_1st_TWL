// import "./styles.css";
const NINE_HOURS_MILLISECONDS = 32400000;

const clockContainer = document.querySelector(".js-clock"),
  clockTitle = clockContainer.querySelector("h1");

function getTime() {
  const xmasDay = new Date("2020-12-24:00:00:00+0900");
  const toDay = new Date();
  const distance = xmasDay.getTime() - toDay.getTime();
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)); 
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60)); 
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);


  clockTitle.innerText = `${days}d ${
    hours < 10 ? `0${hours}` : hours}h ${
    minutes < 10 ? `0${minutes}` : minutes}m ${
        seconds < 10 ? `0${seconds}` : seconds}s`;
}


function init() {
  getTime();
  setInterval(getTime, 1000);
}
init();
