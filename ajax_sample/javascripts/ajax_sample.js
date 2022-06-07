let number = 0;
let data = []; // ajax.jsonから取得したデータを格納するための変数を追加
const button = document.getElementById('btn');
const titleArea = document.getElementById("title");
const contentArea = document.getElementById("content");
const videoArea = document.getElementById("video");

function getData() {
  // ajax.jsonからデータを取得する処理を記述
  const request = new XMLHttpRequest();
  request.onreadystatechange = function() {
    if(request.readyState == 4) {
      if(request.status == 200) {
        const videoData = request.response;
        data = videoData;
      }
    }
  }
  request.open("GET", "ajax.json");
  request.responseType = "json";
  request.send(null);
}

function changeVideo() {
  // ボタンがクリックされた際の処理を記述
  // ajax.jsonからデータを取得していない場合のみ、getDataの処理を呼び出す
  if(data.length < 1) {
    getData();
  }
  button.addEventListener("click", e => {
    titleArea.innerHTML = data[number].title;
    contentArea.innerHTML = data[number].content;
    videoArea.setAttribute("src", data[number].url);
    number == 2 ? number = 0 : number++;
  })
}

window.onload = changeVideo;