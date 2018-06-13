/* 監聽開啟按鈕 */
let openBtn = document.getElementById("openBtn");

openBtn.addEventListener("click", openBtnClick, false);

function openBtnClick(){
    let list = document.getElementById("list");
    let cardBack = document.getElementById("cardBack");
    let shadowLight = document.getElementById("shadowLight");
    let lighting = document.getElementById("lighting");
    let cardShine = document.getElementById("cardShine");

    list.style.transform = "translateX(-990px)";
    cardBack.style.display = "none";
    shadowLight.style.display = "none";
    lighting.style.display = "none";
    // cardShine.style.display = "block";
    // setTimeout(function () { cardShine.style.display = "none" },500);
}

/* 隨機選卡 */

let randomIndex;

function randomCardIndex() {
    return randomIndex = Math.floor(Math.random() * 10); //從0~9隨機傳出一個數字
}
randomCardIndex();