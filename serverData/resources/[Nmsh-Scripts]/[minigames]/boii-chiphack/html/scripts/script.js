//------------------------------\\
//---\\ BOII | DEVELOPMENT //---\\
//------------------------------\\

const shadow = document.querySelector('.shadow');
const counterInc = document.getElementById('chip');
const curCount = document.getElementById('current-count');
const progressbar = document.querySelector('.progress');
const gameArea = document.getElementById('game-area');
const chip = document.getElementById('chip');
var counter = 0;
var chipsneeded = null;
var timeleft = null;

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        var data = event.data;
        if (data.open == true) {
            chipsneeded = data.chipsneeded
            timeleft = data.timer
            $('#start-container').removeClass('hidden');
            const changeProgress = (progress) => {
                progressbar.style.width = `${progress}%`;
                if (progress >= 90) {
                    setTimeout(StartGame(chipsneeded, timeleft), 1000);
                }
            };
            setTimeout(() => changeProgress(15), 1000);
            setTimeout(() => changeProgress(32), 2000);
            setTimeout(() => changeProgress(65), 4600);
            setTimeout(() => changeProgress(78), 5266);
            setTimeout(() => changeProgress(90), 8000);
        } else if (data.open == false) {
            $('#start-container').addClass('hidden');
            $('#game-container').addClass('hidden');
            location.reload();
        }
        $(document).keyup(function (exit) {
            if (exit.keyCode === 27) {     
                CloseGame();      
            }      
        })
    })
})

// starts game
function StartGame() {
    $('#start-container').addClass('hidden');
    $('#game-container').removeClass('hidden');
    document.addEventListener('mousemove', (e) => {
        let x = e.clientX - (document.documentElement.clientWidth * 1.5);
        let y = e.clientY - (document.documentElement.clientHeight * 1.5);
        shadow.style.transform = 'translate(' + x + 'px, ' + y + 'px)';
    })
    var w = gameArea.offsetWidth || gameArea.style.width
    var h = gameArea.offsetHeight || gameArea.style.height
    $('#chip').click(function(){
        this.style.top = Math.round(Math.random() * h) + "px";
        this.style.left = Math.round(Math.random() * w) + "px";
        AddCounter()
    })
    StartCountdown()
}

// starts countdown timer
function StartCountdown() {
    var htmlResult = '<h2>CHIPS FOUND<h2>'+
    '<h2>'+counter+'/'+chipsneeded+'</h2>'
    $('#info-container').html(htmlResult);
}

// countdown timer
const countdown = setInterval(function() {
    if (timeleft === 0) {
        if (counter <= chipsneeded) {
            clearInterval(countdown);
            setTimeout(CloseGame(), 1000);
        }
    } else {
        document.getElementById("countdown").innerHTML = '<h2>'+timeleft+ 's REMAINING</h2>';
    }
    timeleft -= 1;
}, 1000);

// adds counter when chip found
function AddCounter() {
    var htmlResult = '<h2>CHIPS FOUND<h2>'+
    '<h2>'+counter+'/'+chipsneeded+'</h2>'
    $('#info-container').html(htmlResult);
    if (counter == chipsneeded) {
        $('#game-container').addClass('hidden');
        clearInterval(countdown);
        $.post(`https://boii-chiphack/CounterCallback`, JSON.stringify({'success': true}));
    }
}

// closes game
function CloseGame() {
    $.post(`https://boii-chiphack/CloseGame`, JSON.stringify({'success': false}));
}

// increments counter
const handleIncrement = () => {
    counter++;
    curCount.innerHTML = counter;
};
counterInc.addEventListener("click", handleIncrement);
