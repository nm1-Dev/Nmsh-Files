var radioOn = false,
  radioType = "dark",
  radioColour = "default",
  radioVolume = 50,
  radioEdit = false,
  radioWindow = 1;
var playerId = 0;

$(function () {
  window.addEventListener("message", function (event) {
    if (event.data.type == "openradio") {
      radioColour = event.data.colour;
      radioEdit = event.data.edit;
      playerId = event.data.playerId;
      $("#radioimage").attr(
        "src",
        "images/" +
          radioColour +
          (radioOn ? "/on_" + radioType : "/off") +
          ".png"
      );
      $("#radio").css("display", event.data.enable ? "block" : "none");
    } else if (event.data.type == "changedChannel") {
      $("#curchannel").html(event.data.channel);
    } else if (event.data.type == "powerOff") {
      $("#curchannel").html(event.data.channel);
      radioOn = true;
      OnOff();
    } else if (event.data.type == "playerList") {
      if (event.data.action === "display") {
        $("#radiolist").css("display", event.data.show ? "block" : "none");
      } else if (event.data.action === "toggle") {
        if ($("#radiolist").css("display") === "block") {
          $("#radiolist").css("display", "none");
        } else {
          $("#radiolist").css("display", "block");
        }
      } else if (event.data.action === "add") {
        let listHeader = $("#radiolist-item-header");
        if (!listHeader.length) {
          listHeader = document.createElement("div");
          listHeader.id = "radiolist-item-header";
          listHeader.textContent = "Radio List";
          listHeader.style.textDecorationLine = "underline";
          $("#radiolist").append(listHeader);
        }
        let listItem = document.createElement("div");
        listItem.id = "radiolist-item-" + event.data.playerId;
        listItem.textContent = event.data.playerName;
        $("#radiolist").append(listItem);
      } else if (event.data.action === "update") {
        let listItem = $("#radiolist-item-" + event.data.playerId);
        if (listItem.length) {
          listItem.text(event.data.playerName);
        }
      } else if (event.data.action === "talking") {
        if (event.data.isTalking) {
          $("#radiolist-item-" + event.data.playerId).css(
            "color",
            "rgba(255, 255, 255, 0.822)"
          );
        } else {
          $("#radiolist-item-" + event.data.playerId).css(
            "color",
            "rgb(148, 150, 151)"
          );
        }
      } else if (event.data.action === "remove") {
        $("#radiolist-item-" + event.data.playerId).remove();
      } else if (event.data.action === "clear") {
        $("#radiolist").empty();
      }
    }
  });

  $(document).keyup(function (e) {
    if (e.key === "Escape") {
      $.post("https://nmsh-radio/close", JSON.stringify({}));
    }
    if (radioEdit) {
      if (e.key === "ArrowLeft") {
        if (radioWindow > 1) {
          $(".screen-" + radioWindow).css("display", "none");
          radioWindow = radioWindow - 1;
          $(".screen-" + radioWindow).css("display", "block");
        }
      } else if (e.key === "ArrowRight") {
        if (radioWindow < 3) {
          $(".screen-" + radioWindow).css("display", "none");
          radioWindow = radioWindow + 1;
          $(".screen-" + radioWindow).css("display", "block");
        }
      }
    }
  });

  $("#freqform").submit(function (e) {
    e.preventDefault();
    ChangeFunc();
  });

  $("#nameform").submit(function (e) {
    e.preventDefault();
    ChangeFunc();
  });

  $("#callsignform").submit(function (e) {
    e.preventDefault();
    ChangeFunc();
  });

  $(".screenchange button").hover(
    function () {
      if (radioType === "dark") {
        $(this).css("color", "#C7C7C7");
      } else {
        $(this).css("color", "#383838");
      }
    },
    function () {
      if (radioType === "dark") {
        $(this).css("color", "white");
      } else {
        $(this).css("color", "black");
      }
    }
  );
});

function ToggleMode() {
  if (radioType === "dark") {
    radioType = "light";
    $("#radioimage").attr(
      "src",
      "images/" + radioColour + (radioOn ? "/on_" + radioType : "/off") + ".png"
    );
    $(".screeninfo").css("color", "black");
    $(".screeninfo").css("background-color", "#E2E2E2");
    $(".screen-1 input").css("color", "black");
    $(".screen-1 input").css("background-color", "#E2E2E2");
    $(".screen-2 input").css("color", "black");
    $(".screen-2 input").css("background-color", "#E2E2E2");
    $(".screen-3 input").css("color", "black");
    $(".screen-3 input").css("background-color", "#E2E2E2");
    $(".screenchange button").css("color", "black");
    $(".screenchange button").css("background-color", "#E2E2E2");
  } else {
    radioType = "dark";
    $("#radioimage").attr(
      "src",
      "images/" + radioColour + (radioOn ? "/on_" + radioType : "/off") + ".png"
    );
    $(".screeninfo").css("color", "white");
    $(".screeninfo").css("background-color", "#1E1E1E");
    $(".screen-1 input").css("color", "white");
    $(".screen-1 input").css("background-color", "#1E1E1E");
    $(".screen-2 input").css("color", "white");
    $(".screen-2 input").css("background-color", "#1E1E1E");
    $(".screen-3 input").css("color", "white");
    $(".screen-3 input").css("background-color", "#1E1E1E");
    $(".screenchange button").css("color", "white");
    $(".screenchange button").css("background-color", "#1E1E1E");
  }
}

function ChangeFunc() {
  if (radioWindow === 1) {
    $.post(
      "https://nmsh-radio/joinChannel",
      JSON.stringify({
        channel: $("#channel").val(),
      })
    );
  } else if (radioWindow === 2) {
    $.post(
      "https://nmsh-radio/changeInfo",
      JSON.stringify({
        type: "name",
        value: $("#channel2").val(),
      })
    );
  } else if (radioWindow === 3) {
    $.post(
      "https://nmsh-radio/changeInfo",
      JSON.stringify({
        type: "callsign",
        value: $("#channel3").val(),
      })
    );
  }
}

function OnOff() {
  if (radioOn) {
    radioOn = false;
    $(".screen-" + radioWindow).css("display", "none");
    $(".screeninfo").css("display", "none");
    $(".screenchange").css("display", "none");
    $("#radiolist").css("display", "none");
    $("#radiolist").empty();
    $("#radioimage").attr(
      "src",
      "images/" + radioColour + (radioOn ? "/on_" + radioType : "/off") + ".png"
    );
    $.post("https://nmsh-radio/leaveChannel", JSON.stringify({}));
  } else {
    radioOn = true;
    $("#radioimage").attr(
      "src",
      "images/" + radioColour + (radioOn ? "/on_" + radioType : "/off") + ".png"
    );
    $.post("https://nmsh-radio/radioOn", JSON.stringify({}));
    $(".screen-" + radioWindow).css("display", "block");
    $(".screeninfo").css("display", "block");
    $(".screenchange").css("display", "block");
  }
}

function VolUp() {
  $.post("https://nmsh-radio/VolUp", JSON.stringify({}));
  if (radioVolume < 100) {
    radioVolume = radioVolume + 10;
    $("#curvolume").html("Volume: " + radioVolume);
  }
}

function VolDown() {
  $.post("https://nmsh-radio/VolDown", JSON.stringify({}));
  if (radioVolume > 10) {
    radioVolume = radioVolume - 10;
    $("#curvolume").html("Volume: " + radioVolume);
  }
}

function setTwoNumberDecimal() {
  $("#channel").val(parseFloat($("#channel").val()).toFixed(2));
}
