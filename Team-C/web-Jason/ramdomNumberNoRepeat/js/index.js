


function randomCardIndex(n) { //10張卡中拿到拿到n張不重複的卡
    let rdmNum; // 儲存隨機亂數
    let cardArr = [] //隨機得到數字的陣列

    function isFind(rdmNum) { //是否有找到，「這裏的rdmNum是參數」
        return cardArr.indexOf(rdmNum) !== -1 //沒找到時 得到 -1 !== -1 => true
    }


    for (let i = 0; i < n; i++) {
        do {
            let exist = false //判別是否存在的變數(預設沒有)
            rdmNum = Math.floor(Math.random() * 10); //隨機取0～9
            if (!isFind(rdmNum)) {
                return exist = true;
            }   
        } while (exist) {
            cardArr[i] = rdmNum; //在陣列內index = i的位置儲存變數rdmNum
        }

        return cardArr; //完成5個數字的存取後，回傳陣列
        
    }
}

randomCardIndex(5);

console.log(cardArr);



