window.addEventListener("message", function (event) {
  let GangInfo = event.data.gangInfo
  let Image = event.data.gangImage
  let Color = event.data.gangColor
  let Total = event.data.gangTotal
  let Gangers = event.data.gangers
  let Radio = event.data.ShowRadio
  let ShowCarStatus = event.data.ShowCarStatus

  switch (event.data.action) {
    case 'open':
      $("#gangName").html(GangInfo.label);
      $("#gangLogo").attr("src", Image ?? "https://cdn.discordapp.com/attachments/940738528139169863/1070373498167509112/png.png");
      $("#total").html("Total: [" + Total + "]")
      $(".card").css({ 'border-left': `4px solid ${Color ?? '26ffba'}` });
      $(".gangers").html(Gangers);
      if (Radio == false) {
        $("#radio").html('');
      }
      if (ShowCarStatus == false) {
        $("#vehicleicon").html('');
      }
      $("#radio").css({ 'color': Color ?? 'white'});
      $("#vehicleicon").css({ 'color': Color ?? 'white' });
      $(".menu").fadeIn();
    break;
    case 'refresh':
      $(".menu").fadeIn();
      $(".gangers").html(Gangers);
    case 'close':
      $(".menu").fadeOut();
    break
  }
})

$(document).ready(function(){
	document.onkeyup = function(data) {
		if (data.which == 27) {
      $(".menu").fadeOut();
      $.post('https://nmsh-gangslist/actions', JSON.stringify({
        action: "close",
      }));
		}
	};
});