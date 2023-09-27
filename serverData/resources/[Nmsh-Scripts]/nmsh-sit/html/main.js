const standup = document.getElementById('standup');


window.addEventListener('message', ({ data }) => {
    if (event.data.color) {
        standup.style.background = data.color;
    }
    if (event.data.type == "display") {
        if (data.text !== undefined) {
            standup.style.display = 'block';
            standup.innerHTML = event.data.text;
            standup.classList.add('slide-in');
        }
    } else if (event.data.type == "hide") {
        standup.classList.add('slide-out');
        setTimeout(function() {
            standup.innerHTML = '';
            standup.style.display = 'none';
            standup.classList.remove('slide-in');
            standup.classList.remove('slide-out');
        }, 1000)
    }
})