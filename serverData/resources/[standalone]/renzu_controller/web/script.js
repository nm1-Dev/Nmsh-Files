

function SendData(data,cb) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState == XMLHttpRequest.DONE) {
            if (cb) {
                cb(xhr.responseText)
            }
        }
    }
    xhr.open("POST", 'https://renzu_controller/nuicb', true)
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify(data))
}

let getEl = function( id ) { return document.getElementById( id )}
 
function setcontrol(type,index) {
    console.log(type,index)
    return SendData({msg: 'carcontrol', type: type, index: index})
} 

window.addEventListener('message', function (table) {
    let event = table.data;
    if (event.show) {
        getEl('body').style.opacity = '1.0'
    } else if (event.show == false) {
        getEl('body').style.opacity = '0.0'
    }
})



document.addEventListener("keydown", (event) => {
    if (event.keyCode == 27 || event.keyCode === 36 || event.keyCode === 8) {
      return SendData({msg: 'close'})
    }
});