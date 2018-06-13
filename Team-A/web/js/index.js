window.onload = function () {
  let balance = 500
  let cost = 20
  let monster
  let rollList = []
  let status = 'hidden'
  let cardCover = document.querySelector('.card-cover')
  let cardEffect = document.querySelector('.card-effect')

  let rollListDOM = document.querySelector('.roll-list')

  let theBalance = document.querySelector('.balance')

  var test = javaScriptCallToSwift.test('test')
  theBalance.innerHTML = test

  function randomCard () {
    for (let i = 0; i < 20; i++) {
      let rand = Math.floor((Math.random() * cardList.length))
      rollList.push(cardList[rand])
    }

    for (let i = 0; i < rollList.length; i++) {
      let newItem = document.createElement('li')
      switch (rollList[i].type) {
        case 0: newItem.classList.add('white-card'); break
        case 1: newItem.classList.add('green-card'); break
        case 2: newItem.classList.add('blue-card'); break
        case 3: newItem.classList.add('red-card'); break
      }
      newImg = document.createElement('img')
      newImg.src = `${rollList[i].src}`
      newItem.append(newImg)
      rollListDOM.append(newItem)
    }
  }

  let rollBtn = document.querySelector('.roll-btn')
  let testBtn = document.querySelector('.test-btn')
  rollBtn.addEventListener('click', e => {
    console.log()

    if (balance - cost < 0) {
      alert('餘額不足請盡快儲值！！')
      return
    }

    if (status === 'show') {
      rollListDOM.innerHTML = ''
      rollList = []
      addGlow(cardEffect)
      hideCard(cardCover)
      resetRoll(rollListDOM)
      status = 'hidden'
    } else {
      randomCard()
      removeGlow(cardEffect)
      showCard(cardCover)
      doRoll(rollListDOM)
      status = 'show'
      balance -= cost
      theBalance.innerHTML = balance
      monster = rollList[rollList.length - 1]
      console.log(rollList, monster)
    }
  })

  testBtn.addEventListener('click', javaScriptCallToSwift.test(balance))
}

function removeGlow (element) {
  element.classList.remove('glow')
}

function addGlow (element) {
  element.classList.add('glow')
}

function showCard (element) {
  element.classList.add('disable')
}

function hideCard (element) {
  element.classList.remove('disable')
}

function doRoll (element) {
  element.classList.add('rolled')
}

function resetRoll (element) {
  element.classList.remove('rolled')
}

let cardList = [
  {
    src: 'imgs/0.png',
    type: 0
  },
  {
    src: 'imgs/1.png',
    type: 0
  },
  {
    src: 'imgs/2.png',
    type: 1
  },
  {
    src: 'imgs/3.png',
    type: 0
  },
  {
    src: 'imgs/4.png',
    type: 2
  },
  {
    src: 'imgs/5.png',
    type: 0
  },
  {
    src: 'imgs/6.png',
    type: 3
  },
  {
    src: 'imgs/7.png',
    type: 0
  },
  {
    src: 'imgs/8.png',
    type: 1
  },
  {
    src: 'imgs/9.png',
    type: 1
  }
]
